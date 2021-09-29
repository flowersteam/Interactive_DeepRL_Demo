/**
 * @classdesc Class that handles the water dynamics.
 */
class WaterDynamics {
    constructor(gravity, drag_mod=0.25, lift_mod=0.25, push_mod=0.05,
                max_drag=2000, max_lift=500, max_push=13){
        this.gravity = gravity;
        this.drag_mod = drag_mod;
        this.lift_mod = lift_mod;
        this.max_drag = max_drag;
        this.max_lift = max_lift;
        this.push_mod = push_mod;
        this.max_push = max_push;
    }

    compute_centroids(vectors){
        let count = vectors.length;
        console.assert(count >= 3);

        let c = new b2.Vec2(0, 0);
        let area = 0;
        let ref_point = new b2.Vec2(0, 0);
        let inv3 = 1/3;

        for(let i = 0; i < count; i++){
            // Triangle vertices
            let p1 = ref_point;
            let p2 = vectors[i];
            let p3 = i + 1 < count ? vectors[i + 1] : vectors[0];

            let e1 = b2.Vec2.Subtract(p2, p1);
            let e2 = b2.Vec2.Subtract(p3, p1);
            let d = b2.Cross_v2_v2(e1, e2);
            let triangle_area = 0.5 * d;
            area += triangle_area;

            // Area weighted centroid
            c.Add(b2.Vec2.Multiply(triangle_area * inv3, b2.Vec2.Add(p1, b2.Vec2.Add(p2, p3))));
        }

        if(area > b2.epsilon){
            c.Multiply(1/area);
        }
        else{
            area = 0;
        }

        return [c, area];
    }

    inside(cp1, cp2, p){
        return (cp2.x - cp1.x) * (p.y - cp1.y) > (cp2.y - cp1.y) * (p.x - cp1.x);
    }

    intersection(cp1, cp2, s, e){
        let dc = new b2.Vec2(cp1.x - cp2.x, cp1.y - cp2.y);
        let dp = new b2.Vec2(s.x - e.x, s.y - e.y);
        let n1 = cp1.x * cp2.y - cp1.y * cp2.x;
        let n2 = s.x * e.y - s.y * e.x;
        let n3 = 1.0 / (dc.x * dp.y - dc.y * dp.x);
        return new b2.Vec2((n1 * dp.x - n2 * dc.x) * n3, (n1 * dp.y - n2 * dc.y) * n3);
    }

    find_intersection(fixture_A, fixture_B){
        // TODO : assert polygons
        let output_vertices = [];
        let polygon_A = fixture_A.GetShape();
        let polygon_B = fixture_B.GetShape();

        // fill 'subject polygon' from fixture_A polygon
        for(let i = 0; i < polygon_A.m_count; i++){
            output_vertices.push(fixture_A.GetBody().GetWorldPoint(polygon_A.m_vertices[i]));
        }

        // fill 'clip polygon' from fixture_B polygon
        let clip_polygon = [];
        for(let i = 0; i < polygon_B.m_count; i++){
            clip_polygon.push(fixture_B.GetBody().GetWorldPoint(polygon_B.m_vertices[i]));
        }

        let cp1 = clip_polygon[clip_polygon.length - 1];
        for(let j = 0; j < clip_polygon.length; j++){
            let cp2 = clip_polygon[j];
            if(output_vertices.length == 0){
                break;
            }
            let input_list = output_vertices.slice();
            output_vertices = [];

            let s = input_list[input_list.length - 1];
            for(let i = 0; i < input_list.length; i++){
                let e = input_list[i];
                if(this.inside(cp1, cp2, e)){
                    if(!this.inside(cp1, cp2, s)){
                        output_vertices.push(this.intersection(cp1, cp2, s, e));
                    }
                    output_vertices.push(e);
                }
                else if(this.inside(cp1, cp2, s)){
                    output_vertices.push(this.intersection(cp1, cp2, s, e));
                }
                s = e;
            }
            cp1 = cp2
        }
        return [(output_vertices.length != 0), output_vertices];
    }

    calculate_forces(fixture_pairs){
        for(let pair of fixture_pairs){
            let density = pair[0].GetDensity();
            let [has_intersection, intersection_points] = this.find_intersection(pair[0], pair[1]);
            if(has_intersection){
                let [centroid, area] = this.compute_centroids(intersection_points);

                // apply buoyancy force
                let displaced_mass = pair[0].GetDensity() * area;
                let buoyancy_force = b2.Vec2.Multiply(displaced_mass, b2.Vec2.Negate(this.gravity));
                pair[1].GetBody().ApplyForce(buoyancy_force, centroid, true);

                // apply complex drag
                for(let i = 0; i < intersection_points.length; i++) {
                    let v0 = intersection_points[i];
                    let v1 = intersection_points[(i + 1) % intersection_points.length];
                    let mid_point = b2.Vec2.Multiply(0.5, b2.Vec2.Add(v0, v1));

                    // DRAG
                    // find relative velocity between object and fluid at edge midpoint
                    let vel_dir = b2.Vec2.Subtract(pair[1].GetBody().GetLinearVelocityFromWorldPoint(mid_point),
                                                    pair[0].GetBody().GetLinearVelocityFromWorldPoint(mid_point));
                    let vel = vel_dir.Normalize();

                    let edge = b2.Vec2.Subtract(v1, v0);
                    let edge_length = edge.Normalize();
                    let normal = b2.Cross_f_v2(-1, edge);
                    let drag_dot = b2.Dot_v2_v2(normal, vel_dir);
                    if(drag_dot >= 0){ // normal points backwards - this is not a leading edge
                        // apply drag
                        let drag_mag = drag_dot * this.drag_mod * edge_length * density * vel * vel;
                        drag_mag = Math.min(drag_mag, this.max_drag);
                        let drag_force = b2.Vec2.Multiply(drag_mag, b2.Vec2.Negate(vel_dir));
                        pair[1].GetBody().ApplyForce(drag_force, mid_point, true);

                        // apply lift
                        let lift_dot = b2.Dot_v2_v2(edge, vel_dir);
                        let lift_mag = drag_dot * lift_dot * this.lift_mod * edge_length * density * vel * vel;
                        lift_mag = Math.min(lift_mag, this.max_lift);
                        let lift_dir = b2.Cross_f_v2(1, vel_dir);
                        let lift_force = b2.Vec2.Multiply(lift_mag, lift_dir);
                        pair[1].GetBody().ApplyForce(lift_force, mid_point, true);
                    }

                    // PUSH
                    let body_to_check = pair[1].GetBody();
                    // Simplification /!\
                    let joints_to_check = [];
                    let joint_edge = body_to_check.GetJointList();
                    while(joint_edge != null){
                        if(joint_edge.joint.GetBodyB() == body_to_check){
                            joints_to_check.push(joint_edge.joint);
                        }
                        joint_edge = joint_edge.next;
                    }

                    for(let joint of joints_to_check){
                        if(joint.GetLowerLimit() < joint.GetJointAngle() && joint.GetJointAngle() < joint.GetUpperLimit()){
                            let torque = joint.GetMotorTorque(60);

                            // Calculate angular inertia of the object
                            let moment_of_inertia = body_to_check.GetInertia();
                            let angular_velocity = body_to_check.GetAngularVelocity();
                            let angular_inertia = moment_of_inertia * angular_velocity;

                            // Calculate the force applied to the object
                            let world_center = body_to_check.GetWorldCenter();
                            let anchor = joint.GetAnchorB();
                            let lever_vector = b2.Vec2.Subtract(world_center, anchor); // vector from pivot to point of application of the force
                            let force_applied_at_center = b2.Cross_v2_f(lever_vector, -torque);

                            let push_dot = b2.Dot_v2_v2(normal, force_applied_at_center);
                            if(push_dot > 0){
                                vel = torque + angular_inertia;
                                // Wrong approximation /!\
                                let push_mag = push_dot * this.push_mod * edge_length * density * vel * vel;
                                let force = b2.Vec2.Multiply(push_mag, b2.Vec2.Negate(force_applied_at_center));
                                let clip_force_x = Math.max(-this.max_push, Math.min(force.x, this.max_push));
                                let clip_force_y = Math.max(-this.max_push, Math.min(force.y, this.max_push))
                                let push_force =  new b2.Vec2(clip_force_x, clip_force_y);
                                body_to_check.ApplyForce(push_force, joint.GetAnchorB(), true);
                            }
                        }
                    }

                }

            }

        }
    }
}

/**
 * @classdesc Stores fixtures of objects in contact with water.
 * @constructor
 */
function WaterContactDetector() {
    b2.ContactListener.call(this);
    this.fixture_pairs = [];
}

WaterContactDetector.prototype = Object.create(b2.ContactListener.prototype);
WaterContactDetector.prototype.constructor = WaterContactDetector;
WaterContactDetector.prototype.BeginContact = function (contact){
    if(contact.GetFixtureA().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.WATER
        && contact.GetFixtureB().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.BODY_OBJECT){
        this.fixture_pairs.push([contact.GetFixtureA(), contact.GetFixtureB()]);
    }
    else if(contact.GetFixtureB().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.WATER
        && contact.GetFixtureA().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.BODY_OBJECT){
        this.fixture_pairs.push([contact.GetFixtureB(), contact.GetFixtureA()]);
    }
};

WaterContactDetector.prototype.EndContact = function (contact) {
    if(contact.GetFixtureA().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.WATER
        && contact.GetFixtureB().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.BODY_OBJECT){
        let index = this.fixture_pairs.indexOf([contact.GetFixtureA(), contact.GetFixtureB()]);
        if (index !== -1) {
            this.fixture_pairs.splice(index, 1);
        }
    }
    else if(contact.GetFixtureB().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.WATER
        && contact.GetFixtureA().GetBody().GetUserData().object_type == CustomUserDataObjectTypes.BODY_OBJECT){
        let index = this.fixture_pairs.indexOf([contact.GetFixtureB(), contact.GetFixtureA()]);
        if (index !== -1) {
            this.fixture_pairs.splice(index, 1);
        }
    }
};

WaterContactDetector.prototype.Reset = function (){
    this.fixture_pairs = [];
};


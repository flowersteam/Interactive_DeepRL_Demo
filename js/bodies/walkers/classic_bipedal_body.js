HULL_POLYGONS = [
    [[-30, +9], [+6, +9], [+34, +1], [+34, -8], [-30, -8]]
];
HULL_BOTTOM_WIDTH = 64;
const SPEED_HIP = 4;
const SPEED_KNEE = 6;

/**
 * @classdesc Bipedal Walker morphology.
 */
class ClassicBipedalBody extends WalkerAbstractBody {
    /**
     * @constructor
     * @param scale {number} - Scale of the environment
     * @param motors_torque {number}
     * @param nb_steps_under_water {number}
     * @param reset_on_hull_critical_contact {boolean}
     */
    constructor(scale, motors_torque=80, nb_steps_under_water=600, reset_on_hull_critical_contact=false) {
        super(scale, motors_torque, nb_steps_under_water);

        this.LEG_DOWN = 3 / this.SCALE; // 0 = center of hull
        this.LEG_W = 8 / this.SCALE;
        this.LEG_H = 34 / this.SCALE;
        this.TORQUE_PENALTY = 0.00035;
        this.reset_on_hull_critical_contact = reset_on_hull_critical_contact;

        this.AGENT_WIDTH = HULL_BOTTOM_WIDTH / this.SCALE;
        this.AGENT_HEIGHT = 17 / this.SCALE + this.LEG_H * 2 - this.LEG_DOWN;
        this.AGENT_CENTER_HEIGHT = this.LEG_H * 2 + this.LEG_DOWN;

        this.old_morphology = false;
    }

    draw(world, init_x, init_y, force_to_center){
        let HULL_FIXTURES = [];
        let fd_polygon;
        let vertices;
        let y_offset = 0;//10/this.SCALE;

        for(let polygon of HULL_POLYGONS){
            fd_polygon = new b2.FixtureDef();
            fd_polygon.shape = new b2.PolygonShape();
            vertices = [];
            for(let vertex of polygon){
                vertices.push(new b2.Vec2(vertex[0] / this.SCALE, vertex[1] / this.SCALE));
            }
            fd_polygon.shape.Set(vertices, polygon.length);
            fd_polygon.density = 5.0;
            fd_polygon.friction = 0.1;
            fd_polygon.filter.categoryBits = 0x20;
            fd_polygon.filter.maskBits = 0x000F; // 0.99 bouncy
            HULL_FIXTURES.push(fd_polygon);
        }

        let LEG_FD = new b2.FixtureDef();
        LEG_FD.shape = new b2.PolygonShape();
        LEG_FD.shape.SetAsBox(this.LEG_W / 2, this.LEG_H / 2);
        LEG_FD.density = 1.0;
        LEG_FD.restitution = 0.0;
        LEG_FD.filter.categoryBits = 0x20;
        LEG_FD.filter.maskBits = 0x000F;

        let LOWER_FD = new b2.FixtureDef();
        LOWER_FD.shape = new b2.PolygonShape();
        LOWER_FD.shape.SetAsBox(0.8 * this.LEG_W / 2, this.LEG_H / 2);
        LOWER_FD.density = 1.0;
        LOWER_FD.restitution = 0.0;
        LOWER_FD.filter.categoryBits = 0x20;
        LOWER_FD.filter.maskBits = 0x000F;

        let hull_bd = new b2.BodyDef();
        hull_bd.type = b2.Body.b2_dynamicBody;
        hull_bd.position.Set(init_x, init_y + y_offset);
        let hull = world.CreateBody(hull_bd);
        for(let fd of HULL_FIXTURES){
            hull.CreateFixture(fd);
        }
        hull.color1 = "#806682"; // [0.5, 0.4, 0.9]
        hull.color2 = "#4D4D80"; // [0.3, 0.3, 0.5]
        hull.ApplyForceToCenter(new b2.Vec2(force_to_center, 0), true);
        hull.SetUserData(new CustomBodyUserData(true, this.reset_on_hull_critical_contact, "hull"));
        this.body_parts.push(hull);
        this.reference_head_object = hull;

        // Leg and lower bodies and joints
        for(let i of [-1, +1]){

            // Leg body
            let leg_bd = new b2.BodyDef();
            leg_bd.type = b2.Body.b2_dynamicBody;
            leg_bd.position.Set(init_x, init_y - this.LEG_H / 2 - this.LEG_DOWN + y_offset);
            //leg_bd.angle = i * 0.05; // 2°
            let leg = world.CreateBody(leg_bd);
            leg.CreateFixture(LEG_FD);
            leg.color1 = i == -1 ? "#9C4F82" : "#964A7D"; // [0.61, 0.31, 0.51] : [0.59, 0.29, 0.49]
            leg.color2 = i == -1 ? "#69364F" : "#63304A"; // [0.41, 0.21, 0.31] : [0.39, 0.19, 0.29]
            leg.SetUserData(new CustomBodyUserData(false, false,"leg"));
            this.body_parts.push(leg);

            // Leg joint motor
            let leg_rjd = new b2.RevoluteJointDef();
            leg_rjd.Initialize(hull, leg, new b2.Vec2(init_x, init_y - this.LEG_DOWN + y_offset));
            leg_rjd.enableMotor = true;
            leg_rjd.enableLimit = true;
            leg_rjd.maxMotorTorque = this.MOTORS_TORQUE;
            leg_rjd.motorSpeed = i;
            leg_rjd.lowerAngle = - 0.8;
            leg_rjd.upperAngle = 1.1;
            let joint_motor = world.CreateJoint(leg_rjd);
            joint_motor.SetUserData(new CustomMotorUserData("hip", SPEED_HIP, false));
            this.motors.push(joint_motor);

            // lower body
            let lower_bd = new b2.BodyDef();
            lower_bd.type = b2.Body.b2_dynamicBody;
            lower_bd.position.Set(init_x, init_y - this.LEG_H * 3 / 2 - this.LEG_DOWN + y_offset);
            //lower_bd.angle = i * 0.05; // 2°
            let lower = world.CreateBody(lower_bd);
            lower.CreateFixture(LOWER_FD);
            lower.color1 = i == -1 ? "#9C4F82" : "#964A7D"; // [0.61, 0.31, 0.51] : [0.59, 0.29, 0.49]
            lower.color2 = i == -1 ? "#69364F" : "#63304A"; // [0.41, 0.21, 0.31] : [0.39, 0.19, 0.29]
            lower.SetUserData(new CustomBodyUserData(true, false,"lower"));
            this.body_parts.push(lower);

            // lower joint motor
            let lower_rjd = new b2.RevoluteJointDef();
            lower_rjd.Initialize(leg, lower, new b2.Vec2(init_x, init_y - this.LEG_DOWN - this.LEG_H + y_offset));
            lower_rjd.enableMotor = true;
            lower_rjd.enableLimit = true;
            lower_rjd.maxMotorTorque = this.MOTORS_TORQUE;
            lower_rjd.motorSpeed = 1;
            lower_rjd.lowerAngle = - 1.6;
            lower_rjd.upperAngle = -0.1;
            joint_motor = world.CreateJoint(lower_rjd);
            joint_motor.SetUserData(new CustomMotorUserData("knee", SPEED_KNEE, true, 1.0, lower));
            this.motors.push(joint_motor);
        }
    }
}
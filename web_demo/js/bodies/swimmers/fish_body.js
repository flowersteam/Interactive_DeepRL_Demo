// Head
HULL_POLYGON = [
    [-20, +12], [+6, +12],
    [+15, +4], [+15, -4],
    [+6, -12], [-20, -12]
];

BODY_P1 = [
    [-8, +9], [+8, +12],
    [+8, -12], [-8, -9]
];

BODY_P2 = [
    [-8, +4], [+8, +9],
    [+8, -9], [-8, -4]
];

// Tail
BODY_P3 = [
    [-4, +2], [+4, +4],
    [+4, -4], [-4, -2]
];

FIN = [
    [-1, -10], [-1, +10],
    [+1, +10], [+1, -10]
];

HULL_BOTTOM_WIDTH = 35;
const SPEED = 6;

/**
 * @classdesc Fish morphology.
 */
class FishBody extends SwimmerAbstractBody {
    /**
     * @constructor
     * @param scale {number} - Scale of the environment
     * @param motors_torque {number}
     * @param density {number} - Density of the agent's body.
     * @param nb_steps_outside_water {number}
     */
    constructor(scale, motors_torque=80, density, nb_steps_outside_water=600) {
        super(scale, motors_torque, density, nb_steps_outside_water);
        this.TORQUE_PENALTY = 0.00035;

        this.AGENT_WIDTH = HULL_BOTTOM_WIDTH / this.SCALE;
        this.AGENT_HEIGHT = 18 / this.SCALE;
        this.AGENT_CENTER_HEIGHT = 9 / this.SCALE;

        this.remove_reward_on_head_angle = true;

        this.fins = [];
        this.tail = null;
    }

    draw(world, init_x, init_y){

        let vertices;
        let rjd;
        let joint_motor;

        // HULL
        let hull_fd = new b2.FixtureDef();
        hull_fd.shape = new b2.PolygonShape();
        vertices = [];
        for(let vertex of HULL_POLYGON){
            vertices.push(new b2.Vec2(vertex[0] / this.SCALE, vertex[1] / this.SCALE));
        }
        hull_fd.shape.Set(vertices, HULL_POLYGON.length);
        hull_fd.density = this.DENSITY;
        hull_fd.friction = 0.1;
        hull_fd.filter.categoryBits = 0x20;
        hull_fd.filter.maskBits = 0x000F; // 0.99 bouncy

        let hull_bd = new b2.BodyDef();
        hull_bd.type = b2.Body.b2_dynamicBody;
        hull_bd.position.Set(init_x, init_y);
        let hull = world.CreateBody(hull_bd);
        hull.CreateFixture(hull_fd);
        hull.color1 = "#806682"; // [0.5, 0.4, 0.9]
        hull.color2 = "#4D4D80";
        hull.SetUserData(new CustomBodyUserData(true, false, "head"));
        this.body_parts.push(hull);
        this.reference_head_object = hull;

        // BODY_P1
        let body_p1_x = init_x - 35 / 2 / this.SCALE - 16 / 2 / this.SCALE;
        let body_p1_fd = new b2.FixtureDef();
        body_p1_fd.shape = new b2.PolygonShape();
        vertices = [];
        for(let vertex of BODY_P1){
            vertices.push(new b2.Vec2(vertex[0] / this.SCALE, vertex[1] / this.SCALE));
        }
        body_p1_fd.shape.Set(vertices, BODY_P1.length);
        body_p1_fd.density = this.DENSITY;
        body_p1_fd.restitution = 0.0;
        body_p1_fd.filter.categoryBits = 0x20;
        body_p1_fd.filter.maskBits = 0x000F; // 0.99 bouncy

        let body_p1_bd = new b2.BodyDef();
        body_p1_bd.type = b2.Body.b2_dynamicBody;
        body_p1_bd.position.Set(body_p1_x, init_y);
        let body_p1 = world.CreateBody(body_p1_bd);
        body_p1.CreateFixture(body_p1_fd);
        body_p1.color1 = "#806682"; // [0.5, 0.4, 0.9]
        body_p1.color2 = "#4D4D80";
        body_p1.SetUserData(new CustomBodyUserData(true, false, "body"));
        this.body_parts.push(body_p1);

        // Revolute joint between HULL and BODY_P1
        rjd = new b2.RevoluteJointDef();
        rjd.Initialize(hull, body_p1, new b2.Vec2(init_x - 35 / 2 / this.SCALE, init_y));
        rjd.enableMotor = true;
        rjd.enableLimit = true;
        rjd.maxMotorTorque = this.MOTORS_TORQUE;
        rjd.motorSpeed = 1;
        rjd.lowerAngle = -0.1 * Math.PI;
        rjd.upperAngle = 0.2 * Math.PI;
        joint_motor = world.CreateJoint(rjd);
        joint_motor.SetUserData(new CustomMotorUserData("neck", SPEED, true, 0.0, body_p1));
        this.motors.push(joint_motor);

        // BODY_P2
        let body_p2_x = body_p1_x - 16 / 2 / this.SCALE - 16 / 2 / this.SCALE;
        let body_p2_fd = new b2.FixtureDef();
        body_p2_fd.shape = new b2.PolygonShape();
        vertices = [];
        for(let vertex of BODY_P2){
            vertices.push(new b2.Vec2(vertex[0] / this.SCALE, vertex[1] / this.SCALE));
        }
        body_p2_fd.shape.Set(vertices, BODY_P2.length);
        body_p2_fd.density = this.DENSITY;
        body_p2_fd.restitution = 0.0;
        body_p2_fd.filter.categoryBits = 0x20;
        body_p2_fd.filter.maskBits = 0x000F;

        let body_p2_bd = new b2.BodyDef();
        body_p2_bd.type = b2.Body.b2_dynamicBody;
        body_p2_bd.position.Set(body_p2_x, init_y);
        let body_p2 = world.CreateBody(body_p2_bd);
        body_p2.CreateFixture(body_p2_fd);
        body_p2.color1 = "#806682"; // [0.5, 0.4, 0.9]
        body_p2.color2 = "#4D4D80";
        body_p2.SetUserData(new CustomBodyUserData(true, false, "body"));
        this.body_parts.push(body_p2);

        // Revolute joint between BODY_P1 and BODY_P2
        rjd = new b2.RevoluteJointDef();
        rjd.Initialize(body_p1, body_p2, new b2.Vec2(body_p1_x - 16 / 2 / this.SCALE, init_y));
        rjd.enableMotor = true;
        rjd.enableLimit = true;
        rjd.maxMotorTorque = this.MOTORS_TORQUE;
        rjd.motorSpeed = 1;
        rjd.lowerAngle = -0.15 * Math.PI;
        rjd.upperAngle = 0.15 * Math.PI;
        joint_motor = world.CreateJoint(rjd);
        joint_motor.SetUserData(new CustomMotorUserData("hip", SPEED, true, 0.0, body_p2));
        this.motors.push(joint_motor);

        // BODY_P3 - TAIL
        let body_p3_x = body_p2_x - 16 / 2 / this.SCALE - 8 / 2 / this.SCALE;
        let body_p3_fd = new b2.FixtureDef();
        body_p3_fd.shape = new b2.PolygonShape();
        vertices = [];
        for(let vertex of BODY_P3){
            vertices.push(new b2.Vec2(vertex[0] / this.SCALE, vertex[1] / this.SCALE));
        }
        body_p3_fd.shape.Set(vertices, BODY_P3.length);
        body_p3_fd.density = this.DENSITY;
        body_p3_fd.restitution = 0.0;
        body_p3_fd.filter.categoryBits = 0x20;
        body_p3_fd.filter.maskBits = 0x000F;

        let body_p3_bd = new b2.BodyDef();
        body_p3_bd.type = b2.Body.b2_dynamicBody;
        body_p3_bd.position.Set(body_p3_x, init_y);
        let body_p3 = world.CreateBody(body_p3_bd);
        body_p3.CreateFixture(body_p3_fd);
        body_p3.color1 = "#806682"; // [0.5, 0.4, 0.9]
        body_p3.color2 = "#4D4D80";
        body_p3.SetUserData(new CustomBodyUserData(true, false, "body"));
        this.body_parts.push(body_p3);
        this.tail = body_p3;

        // Revolute joint between BODY_P2 and BODY_P3
        rjd = new b2.RevoluteJointDef();
        rjd.Initialize(body_p2, body_p3, new b2.Vec2(body_p2_x - 16 / 2 / this.SCALE, init_y));
        rjd.enableMotor = true;
        rjd.enableLimit = true;
        rjd.maxMotorTorque = this.MOTORS_TORQUE;
        rjd.motorSpeed = 1;
        rjd.lowerAngle = -0.3 * Math.PI;
        rjd.upperAngle = 0.3 * Math.PI;
        joint_motor = world.CreateJoint(rjd);
        joint_motor.SetUserData(new CustomMotorUserData("knee", SPEED, true, 0.0, body_p3));
        this.motors.push(joint_motor);

        // FINS
        let fin_fd = new b2.FixtureDef();
        fin_fd.shape = new b2.PolygonShape();
        vertices = [];
        for(let vertex of FIN){
            vertices.push(new b2.Vec2(vertex[0] / this.SCALE, vertex[1] / this.SCALE));
        }
        fin_fd.shape.Set(vertices, FIN.length);
        fin_fd.density = this.DENSITY;
        fin_fd.restitution = 0.0;
        fin_fd.filter.categoryBits = 0x20;
        fin_fd.filter.maskBits = 0x000F;

        let fin_positions = [
            [init_x, init_y - 22 / 2 / this.SCALE + 0.2],
        ];
        let fin_angle = -0.2 * Math.PI;
        let middle_fin_x_distance = Math.sin(fin_angle) * 20 / 2 / this.SCALE;
        let middle_fin_y_distance = Math.cos(fin_angle) * 20 / 2 / this.SCALE;

        for(let fin_pos of fin_positions){
            let current_fin_x = fin_pos[0] + middle_fin_x_distance;
            let current_fin_y = fin_pos[1] - middle_fin_y_distance;

            let fin_bd = new b2.BodyDef();
            fin_bd.type = b2.Body.b2_dynamicBody;
            fin_bd.position.Set(current_fin_x, current_fin_y);
            let fin = world.CreateBody(fin_bd);
            fin.CreateFixture(fin_fd);
            fin.color1 = "#806682"; // [0.5, 0.4, 0.9]
            fin.color2 = "#4D4D80";
            fin.SetUserData(new CustomBodyUserData(true, false, "fin"));
            this.body_parts.push(fin);
            this.fins.push(fin);

            // Revolute joint between HULL and FIN
            rjd = new b2.RevoluteJointDef();
            rjd.Initialize(hull, fin, new b2.Vec2(fin_pos[0], fin_pos[1]));
            rjd.enableMotor = true;
            rjd.enableLimit = true;
            rjd.maxMotorTorque = this.MOTORS_TORQUE;
            rjd.motorSpeed = 1;
            rjd.lowerAngle = -0.3 * Math.PI;
            rjd.upperAngle = 0.2 * Math.PI;
            joint_motor = world.CreateJoint(rjd);
            joint_motor.SetUserData(new CustomMotorUserData("shoulder", SPEED, true, 0.0, fin));
            this.motors.push(joint_motor);
        }
    }
}
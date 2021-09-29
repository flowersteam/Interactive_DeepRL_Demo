const MAIN_BODY_POLYGONS = [
    [[-10, +10], [+10, +10], [+10, -10], [-10, -10]]
]
const MAIN_BODY_BOTTOM_WIDTH = 20
const SPIDER_SPEED_HIP = 4
const SPIDER_SPEED_KNEE = 6

/**
 * @classdesc Spider morphology.
 */
class SpiderBody extends WalkerAbstractBody {

    constructor(scale, motors_torque=100, nb_pairs_of_legs=2,
                nb_steps_under_water=600, reset_on_hull_critical_contact=false){
        super(scale, motors_torque, nb_steps_under_water);

        this.LEG_DOWN = 4 / this.SCALE;
        this.LEG_W = 6 / this.SCALE;
        this.LEG_H = 20 / this.SCALE;
        this.reset_on_critical_contact = reset_on_hull_critical_contact;

        this.nb_pairs_of_legs = nb_pairs_of_legs;

        this.TORQUE_PENALTY = 0.00035 / this.nb_pairs_of_legs;

        // not exacts but works
        this.AGENT_WIDTH = MAIN_BODY_BOTTOM_WIDTH / this.SCALE + this.LEG_H * 4;
        this.AGENT_HEIGHT = 20 / this.SCALE + this.LEG_H * 2;
        this.AGENT_CENTER_HEIGHT = this.LEG_H + this.LEG_DOWN;
    }

    draw(world, init_x, init_y, force_to_center){

        let fd_polygon;
        let vertices;

        /* Creates the different fixtures */

        let MAIN_BODY_FIXTURES = [];
        for(let polygon of MAIN_BODY_POLYGONS){
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
            fd_polygon.filter.maskBits = 0x000F;
            MAIN_BODY_FIXTURES.push(fd_polygon);
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

        /* Creates the different bodies */

        // Main body
        let main_body_bd = new b2.BodyDef();
        main_body_bd.type = b2.Body.b2_dynamicBody;
        main_body_bd.position.Set(init_x, init_y);
        let main_body = world.CreateBody(main_body_bd);
        for(let fd of MAIN_BODY_FIXTURES){
            main_body.CreateFixture(fd);
        }
        main_body.color1 = "#803366"; // [0.5, 0.2, 0.4]
        main_body.color2 = "#4D1A33"; // [0.3, 0.1, 0.2]
        main_body.ApplyForceToCenter(new b2.Vec2(force_to_center, 0), true);
        main_body.SetUserData(new CustomBodyUserData(true, this.reset_on_hull_critical_contact, "main_body"));
        this.body_parts.push(main_body);
        this.reference_head_object = main_body;

        // Legs bodies and joints
        let legs_coef = [];
        for(let i = 0; i < this.nb_pairs_of_legs; i++){
            legs_coef.push(+1, -1);
        }
        for(let i of legs_coef){

            // First part of the leg
            let upper_leg_angle = 0.25 * Math.PI * i;
            let upper_leg_x_distance = Math.sin(upper_leg_angle) * this.LEG_H / 2;
            let upper_leg_y_distance = Math.cos(upper_leg_angle) * this.LEG_H / 2;
            let upper_leg_x = init_x - i * MAIN_BODY_BOTTOM_WIDTH / this.SCALE / 2 - upper_leg_x_distance;
            let upper_leg_y = init_y + upper_leg_y_distance - this.LEG_DOWN;

            let upper_leg_bd = new b2.BodyDef();
            upper_leg_bd.type = b2.Body.b2_dynamicBody;
            upper_leg_bd.position.Set(upper_leg_x, upper_leg_y);
            upper_leg_bd.angle = upper_leg_angle;
            let upper_leg = world.CreateBody(upper_leg_bd);
            upper_leg.CreateFixture(LEG_FD);
            upper_leg.color1 = "#B36699"; // [0.7, 0.4, 0.6]
            upper_leg.color2 = "#804D66"; // [0.5, 0.3, 0.4]
            upper_leg.SetUserData(new CustomBodyUserData(false, false,"upper_leg"));
            this.body_parts.push(upper_leg);

            // Upper leg joint motor
            let upper_leg_rjd = new b2.RevoluteJointDef();
            upper_leg_rjd.Initialize(main_body, upper_leg, new b2.Vec2(init_x - i * MAIN_BODY_BOTTOM_WIDTH / this.SCALE / 2, init_y - this.LEG_DOWN));
            upper_leg_rjd.enableMotor = true;
            upper_leg_rjd.enableLimit = true;
            upper_leg_rjd.maxMotorTorque = this.MOTORS_TORQUE;
            upper_leg_rjd.motorSpeed = 1;
            upper_leg_rjd.lowerAngle = - 0.1 * Math.PI;
            upper_leg_rjd.upperAngle = 0.1 * Math.PI;
            let joint_motor = world.CreateJoint(upper_leg_rjd);
            joint_motor.SetUserData(new CustomMotorUserData("hip", SPIDER_SPEED_HIP, false));
            this.motors.push(joint_motor);

            // Second part of the leg
            let middle_leg_angle = 0.7 * Math.PI * i;
            let middle_leg_x_distance = Math.sin(middle_leg_angle) * this.LEG_H / 2;
            let middle_leg_y_distance = - Math.cos(middle_leg_angle) * this.LEG_H / 2;
            let middle_leg_x = upper_leg_x - upper_leg_x_distance - middle_leg_x_distance;
            let middle_leg_y = upper_leg_y + upper_leg_y_distance - middle_leg_y_distance;

            let middle_leg_bd = new b2.BodyDef();
            middle_leg_bd.type = b2.Body.b2_dynamicBody;
            middle_leg_bd.position.Set(middle_leg_x, middle_leg_y);
            middle_leg_bd.angle = middle_leg_angle;
            let middle_leg = world.CreateBody(middle_leg_bd);
            middle_leg.CreateFixture(LEG_FD);
            middle_leg.color1 = "#B36699"; // [0.7, 0.4, 0.6]
            middle_leg.color2 = "#804D66"; // [0.5, 0.3, 0.4]
            middle_leg.SetUserData(new CustomBodyUserData(false, false,"middle_leg"));
            this.body_parts.push(middle_leg);

            // middle_leg joint motor
            let middle_leg_rjd = new b2.RevoluteJointDef();
            middle_leg_rjd.Initialize(upper_leg, middle_leg, new b2.Vec2(upper_leg_x - upper_leg_x_distance, upper_leg_y + upper_leg_y_distance));
            middle_leg_rjd.enableMotor = true;
            middle_leg_rjd.enableLimit = true;
            middle_leg_rjd.maxMotorTorque = this.MOTORS_TORQUE;
            middle_leg_rjd.motorSpeed = 1;
            middle_leg_rjd.lowerAngle = - 0.15 * Math.PI;
            middle_leg_rjd.upperAngle = 0.15 * Math.PI;
            joint_motor = world.CreateJoint(middle_leg_rjd);
            joint_motor.SetUserData(new CustomMotorUserData("hip", SPIDER_SPEED_HIP,false));
            this.motors.push(joint_motor);

            // Third part of the leg
            let lower_leg_angle = 0.9 * Math.PI * i;
            let lower_leg_x_distance = Math.sin(lower_leg_angle) * this.LEG_H / 2;
            let lower_leg_y_distance = - Math.cos(lower_leg_angle) * this.LEG_H / 2;
            let lower_leg_x = middle_leg_x - middle_leg_x_distance - lower_leg_x_distance;
            let lower_leg_y = middle_leg_y - middle_leg_y_distance - lower_leg_y_distance;

            let lower_leg_bd = new b2.BodyDef();
            lower_leg_bd.type = b2.Body.b2_dynamicBody;
            lower_leg_bd.position.Set(lower_leg_x, lower_leg_y);
            lower_leg_bd.angle = lower_leg_angle;
            let lower_leg = world.CreateBody(lower_leg_bd);
            lower_leg.CreateFixture(LOWER_FD);
            lower_leg.color1 = "#B36699"; // [0.7, 0.4, 0.6]
            lower_leg.color2 = "#804D66"; // [0.5, 0.3, 0.4]
            lower_leg.SetUserData(new CustomBodyUserData(true, false,"lower_leg"));
            this.body_parts.push(lower_leg);

            // lower_leg joint motor
            let lower_leg_rjd = new b2.RevoluteJointDef();
            lower_leg_rjd.Initialize(middle_leg, lower_leg, new b2.Vec2(middle_leg_x - middle_leg_x_distance, middle_leg_y - middle_leg_y_distance));
            lower_leg_rjd.enableMotor = true;
            lower_leg_rjd.enableLimit = true;
            lower_leg_rjd.maxMotorTorque = this.MOTORS_TORQUE;
            lower_leg_rjd.motorSpeed = 1;
            lower_leg_rjd.lowerAngle = - 0.2 * Math.PI;
            lower_leg_rjd.upperAngle = 0.2 * Math.PI;
            joint_motor = world.CreateJoint(lower_leg_rjd);
            joint_motor.SetUserData(new CustomMotorUserData("knee", SPIDER_SPEED_KNEE,true, 0.0, lower_leg));
            this.motors.push(joint_motor);
        }
    }
};
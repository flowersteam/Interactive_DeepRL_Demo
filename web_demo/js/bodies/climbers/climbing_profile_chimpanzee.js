const CHIMP_SPEED_HIP = 4;
const CHIMP_SPEED_KNEE = 6;
const CHIMP_SPEED_HAND = 8;

/**
 * @classdesc Chimpanzee morphology.
 */
class ClimbingProfileChimpanzee extends ClimberAbstractBody {
    /**
     * @constructor
     * @param scale {number} - Scale of the environment
     * @param motors_torque {number}
     * @param nb_steps_under_water {number}
     */
    constructor(scale, motors_torque=100, nb_steps_under_water=600){
        super(scale, motors_torque, nb_steps_under_water);

        this.LEG_DOWN = 12 / this.SCALE;
        this.ARM_UP = 22 / this.SCALE;
        this.LIMB_W = 8 / this.SCALE;
        this.LIMB_H = 28 / this.SCALE;
        this.HAND_PART_W = 4 / this.SCALE;
        this.HAND_PART_H = 8 / this.SCALE;
        this.LEG_H = this.LIMB_H;
        this.TORQUE_PENALTY = 0.00035 / 5; // Legs + arms + hands
        this.BODY_HEIGHT = 45;
        this.HEAD_HEIGHT = 20;
        this.HEAD_UP = 2.5 / this.SCALE; // formerly 0.2

        this.AGENT_WIDTH = 24 / this.SCALE;
        this.AGENT_HEIGHT = this.BODY_HEIGHT / this.SCALE
            + this.HEAD_HEIGHT / this.SCALE
            + this.HEAD_UP + this.LEG_H * 2
            - this.LEG_DOWN;
        this.AGENT_CENTER_HEIGHT = this.LEG_H * 2 + this.LEG_DOWN;

        this.remove_reward_on_head_angle = true;
    }

    draw(world, init_x, init_y, force_to_center){

        // Head
        let head_fd = new b2.FixtureDef();
        head_fd.shape = new b2.PolygonShape();
        head_fd.shape.SetAsBox(5 / this.SCALE, 10 / this.SCALE);
        /*head_fd.shape.Set([
            new b2.Vec2(-5 / this.SCALE, 10 / this.SCALE),
            new b2.Vec2(5 / this.SCALE, 10 / this.SCALE),
            new b2.Vec2(5 / this.SCALE, -10 / this.SCALE),
            new b2.Vec2(-5 / this.SCALE, -10 / this.SCALE),
        ], 4);*/
        head_fd.density = 5.0;
        head_fd.friction = 0.1;
        head_fd.filter.categoryBits = 0x20;
        head_fd.filter.maskBits = 0x1;

        let head_bd = new b2.BodyDef();
        head_bd.type = b2.Body.b2_dynamicBody;
        head_bd.position.Set(init_x,
                             init_y + this.BODY_HEIGHT / this.SCALE / 2 + this.HEAD_HEIGHT / this.SCALE / 2 + this.HEAD_UP);
        let head = world.CreateBody(head_bd);
        head.CreateFixture(head_fd);
        head.color1 = "#806682"; // [0.5, 0.4, 0.9]
        head.color2 = "#4D4D80";
        head.ApplyForceToCenter(new b2.Vec2(force_to_center, 0), true);
        head.SetUserData(new CustomBodyUserData(true, true, "head"));
        this.body_parts.push(head);
        this.reference_head_object = head;

        // Body
        let body_fd = new b2.FixtureDef();
        body_fd.shape = new b2.PolygonShape();
        body_fd.shape.Set([
            new b2.Vec2(-12 / this.SCALE, 25 / this.SCALE),
            new b2.Vec2(12 / this.SCALE, 25 / this.SCALE),
            new b2.Vec2(8 / this.SCALE, -20 / this.SCALE),
            new b2.Vec2(-8 / this.SCALE, -20 / this.SCALE),
        ], 4);
        body_fd.density = 5.0;
        body_fd.friction = 0.1;
        body_fd.filter.categoryBits = 0x20;
        body_fd.filter.maskBits = 0x1; // collide only with ground

        let body_bd = new b2.BodyDef();
        body_bd.type = b2.Body.b2_dynamicBody;
        body_bd.position.Set(init_x, init_y);
        let body = world.CreateBody(body_bd);
        body.CreateFixture(body_fd);
        body.color1 = "#806682"; // [0.5, 0.4, 0.9]
        body.color2 = "#4D4D80"; // [0.3, 0.3, 0.5]
        body.SetUserData(new CustomBodyUserData(true, true, "body"));
        this.body_parts.push(body);

        // Revolute joint between head and body
        let rjd = new b2.RevoluteJointDef();
        rjd.Initialize(head, body, new b2.Vec2(init_x, init_y + this.BODY_HEIGHT / this.SCALE / 2));
        rjd.enableMotor = false;
        rjd.enableLimit = true;
        rjd.lowerAngle = -0.1 * Math.PI;
        rjd.upperAngle = 0.1 * Math.PI;
        let joint_motor = world.CreateJoint(rjd);
        joint_motor.SetUserData(new CustomMotorUserData("neck", 0, false));
        this.neck_joint = joint_motor;

        // Limbs FixtureDef
        let UPPER_LIMB_FD = new b2.FixtureDef();
        UPPER_LIMB_FD.shape = new b2.PolygonShape();
        UPPER_LIMB_FD.shape.SetAsBox(this.LIMB_W / 2, this.LIMB_H / 2);
        UPPER_LIMB_FD.density = 1.0;
        UPPER_LIMB_FD.restitution = 0;
        UPPER_LIMB_FD.filter.categoryBits = 0x20;
        UPPER_LIMB_FD.filter.maskBits = 0x1;

        let LOWER_LIMB_FD = new b2.FixtureDef();
        LOWER_LIMB_FD.shape = new b2.PolygonShape();
        LOWER_LIMB_FD.shape.SetAsBox(0.8 * this.LIMB_W / 2, this.LIMB_H / 2);
        LOWER_LIMB_FD.density = 1.0;
        LOWER_LIMB_FD.restitution = 0;
        LOWER_LIMB_FD.filter.categoryBits = 0x20;
        LOWER_LIMB_FD.filter.maskBits = 0x1;

        let HAND_PART_FD = new b2.FixtureDef();
        HAND_PART_FD.shape = new b2.PolygonShape();
        HAND_PART_FD.shape.SetAsBox(this.HAND_PART_W / 2, this.HAND_PART_H / 2);
        HAND_PART_FD.density = 1.0;
        HAND_PART_FD.restitution = 0;
        HAND_PART_FD.filter.categoryBits = 0x20;
        HAND_PART_FD.filter.maskBits = 0x1;

        // Legs
        for(let i = 0; i < 2; i++){

            // Upper leg
            let upper_bd = new b2.BodyDef();
            upper_bd.type = b2.Body.b2_dynamicBody;
            upper_bd.position.Set(init_x, init_y - this.LIMB_H / 2 - this.LEG_DOWN);
            let upper = world.CreateBody(upper_bd);
            upper.CreateFixture(UPPER_LIMB_FD);
            upper.color1 = "#964A7D"; // [0.59, 0.29, 0.49]
            upper.color2 = "#63304A"; // [0.39, 0.19, 0.29]
            upper.SetUserData(new CustomBodyUserData(false, false, "upper_leg"));
            this.body_parts.push(upper);

            // Revolute joint between body and upper leg
            rjd = new b2.RevoluteJointDef();
            rjd.Initialize(body, upper, new b2.Vec2(init_x, init_y - this.LEG_DOWN));
            rjd.enableMotor = true;
            rjd.enableLimit = true;
            rjd.maxMotorTorque = this.MOTORS_TORQUE;
            rjd.motorSpeed = 1;
            rjd.lowerAngle = -0.3 * Math.PI;
            rjd.upperAngle = 0.6 * Math.PI;
            joint_motor = world.CreateJoint(rjd);
            joint_motor.SetUserData(new CustomMotorUserData("hip", CHIMP_SPEED_HIP, false));
            this.motors.push(joint_motor);

            // Lower leg
            let lower_bd = new b2.BodyDef();
            lower_bd.type = b2.Body.b2_dynamicBody;
            lower_bd.position.Set(init_x, init_y - this.LIMB_H * 3/2 - this.LEG_DOWN);
            let lower = world.CreateBody(lower_bd);
            lower.CreateFixture(LOWER_LIMB_FD);
            lower.color1 = "#964A7D"; // [0.59, 0.29, 0.49]
            lower.color2 = "#63304A"; // [0.39, 0.19, 0.29]
            lower.SetUserData(new CustomBodyUserData(true, true, "lower_leg"));
            this.body_parts.push(lower);

            // Revolute joint between upper and lower leg
            rjd = new b2.RevoluteJointDef();
            rjd.Initialize(upper, lower, new b2.Vec2(init_x, init_y - this.LEG_H - this.LEG_DOWN));
            rjd.enableMotor = true;
            rjd.enableLimit = true;
            rjd.maxMotorTorque = this.MOTORS_TORQUE;
            rjd.motorSpeed = 1;
            rjd.lowerAngle = -0.75 * Math.PI;
            rjd.upperAngle = -0.1;
            joint_motor = world.CreateJoint(rjd);
            joint_motor.SetUserData(new CustomMotorUserData("knee",
                                                            CHIMP_SPEED_KNEE,
                                                            true,
                                                            1,
                                                            lower));
            this.motors.push(joint_motor);
        }

        // Arms
        for(let i = 0; i < 2; i++){
            // Upper arm
            let upper_bd = new b2.BodyDef();
            upper_bd.type = b2.Body.b2_dynamicBody;
            upper_bd.position.Set(init_x, init_y + this.LIMB_H / 2 + this.ARM_UP);
            let upper = world.CreateBody(upper_bd);
            upper.CreateFixture(UPPER_LIMB_FD);
            upper.color1 = "#9C4F82"; // [0.61, 0.31, 0.51]
            upper.color2 = "#69364F"; // [0.41, 0.21, 0.31]
            upper.SetUserData(new CustomBodyUserData(false, false, "upper_arm"));
            this.body_parts.push(upper);

            // Revolute joint between body and upper arm
            rjd = new b2.RevoluteJointDef();
            rjd.Initialize(body, upper, new b2.Vec2(init_x, init_y + this.ARM_UP));
            rjd.enableMotor = true;
            rjd.enableLimit = true;
            rjd.maxMotorTorque = this.MOTORS_TORQUE;
            rjd.motorSpeed = 1;
            rjd.lowerAngle = -0.75 * 2 * Math.PI;
            rjd.upperAngle = 0;
            joint_motor = world.CreateJoint(rjd);
            joint_motor.SetUserData(new CustomMotorUserData("shoulder", CHIMP_SPEED_HIP, false));
            this.motors.push(joint_motor);

            // Lower arm
            let lower_bd = new b2.BodyDef();
            lower_bd.type = b2.Body.b2_dynamicBody;
            lower_bd.position.Set(init_x, init_y + this.LIMB_H * 3/2 + this.ARM_UP);
            let lower = world.CreateBody(lower_bd);
            lower.CreateFixture(LOWER_LIMB_FD);
            lower.color1 = "#9C4F82"; // [0.61, 0.31, 0.51]
            lower.color2 = "#69364F"; // [0.41, 0.21, 0.31]
            lower.SetUserData(new CustomBodyUserData(false, false, "lower_arm"));
            this.body_parts.push(lower);

            // Revolute joint between upper arm and lower arm
            rjd = new b2.RevoluteJointDef();
            rjd.Initialize(upper, lower, new b2.Vec2(init_x, init_y + this.LIMB_H + this.ARM_UP));
            rjd.enableMotor = true;
            rjd.enableLimit = true;
            rjd.maxMotorTorque = this.MOTORS_TORQUE;
            rjd.motorSpeed = 1;
            rjd.lowerAngle = 0;
            rjd.upperAngle = 0.75 * Math.PI;
            joint_motor = world.CreateJoint(rjd);
            joint_motor.SetUserData(new CustomMotorUserData("elbow",
                                                            CHIMP_SPEED_HIP,
                                                            false));
            this.motors.push(joint_motor);

            // Hand
            let prev_part = lower;
            let initial_y = init_y + this.LIMB_H * 2 + this.ARM_UP;
            let angle_boundaries = [[-0.5, 0.5]];
            let nb_hand_parts = 1;
            for(let u = 0; u < nb_hand_parts; u++){
                let hand_part_bd = new b2.BodyDef();
                hand_part_bd.type = b2.Body.b2_dynamicBody;
                hand_part_bd.position.Set(init_x, initial_y + this.HAND_PART_H / 2 + this.HAND_PART_H * u);
                let hand_part = world.CreateBody(hand_part_bd);
                hand_part.CreateFixture(HAND_PART_FD);
                hand_part.color1 = "#9C4F82"; // [0.61, 0.31, 0.51]
                hand_part.color2 = "#69364F"; // [0.41, 0.21, 0.31]
                hand_part.SetUserData(new CustomBodyUserData(true, false, "hand"));
                this.body_parts.push(hand_part);

                // Revolute joint between prev_part and hand_part
                rjd = new b2.RevoluteJointDef();
                rjd.Initialize(prev_part, hand_part, new b2.Vec2(init_x, initial_y + this.HAND_PART_H * u));
                rjd.enableMotor = true;
                rjd.enableLimit = true;
                rjd.maxMotorTorque = this.MOTORS_TORQUE;
                rjd.motorSpeed = 1;
                rjd.lowerAngle = angle_boundaries[u][0] * Math.PI;
                rjd.upperAngle = angle_boundaries[u][1] * Math.PI;
                joint_motor = world.CreateJoint(rjd);
                joint_motor.SetUserData(new CustomMotorUserData("hand",
                                                                CHIMP_SPEED_HAND,
                                                                true,
                                                                0,
                                                                hand_part));
                this.motors.push(joint_motor);

                prev_part = hand_part;
            }

            // Sensor
            let hand_sensor_position = new b2.Vec2(init_x, initial_y + this.HAND_PART_H * nb_hand_parts);
            let hand_sensor_part_bd = new b2.BodyDef();
            hand_sensor_part_bd.type = b2.Body.b2_dynamicBody;
            hand_sensor_part_bd.position.Assign(hand_sensor_position);
            let hand_sensor_part = world.CreateBody(hand_sensor_part_bd);
            hand_sensor_part.CreateFixture(this.SENSOR_FD);
            hand_sensor_part.color1 = "#FF0000"; // [1, 0, 0]
            hand_sensor_part.color2 = "#FF0000"; // [1, 0, 0]
            hand_sensor_part.SetUserData(new CustomBodySensorUserData(true, false, "hand_sensor"));
            this.sensors.push(hand_sensor_part);

            let wjd = new b2.WeldJointDef();
            wjd.Initialize(prev_part, hand_sensor_part, hand_sensor_position);
            world.CreateJoint(wjd);
        }


    }
}
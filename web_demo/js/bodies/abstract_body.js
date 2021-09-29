/**
 * @classdesc Abstract class for agent's morphologies
 */
class AbstractBody {

    /**
     * @constructor
     * @param scale {number} - Scale of the environment
     * @param motors_torque {number}
     */
    constructor(scale, motors_torque){
        this.SCALE = scale;
        this.MOTORS_TORQUE = motors_torque;
        this.body_parts = [];
        this.motors = [];
        this.is_selected = false;
    }

    /**
     * Gets the size of the motors state.
     * @return {number}
     */
    get_state_size(){
        return this.get_motors_state().length;
    }

    /**
     * Gets the motors state.
     * @return {Array}
     */
    get_motors_state(){
        let state = [];
        for(let motor of this.motors){
            let motor_info = motor.GetUserData();
            if(motor_info.check_contact){
                let s = [
                    motor.GetJointAngle() + motor_info.angle_correction,
                    motor.GetJointSpeed() / motor_info.speed_control,
                    0.0
                ]
                if(motor_info.contact_body.GetUserData().has_contact){
                    s[2] = 1.0;
                }
                state = state.concat(s);
            }
            else{
                state = state.concat([
                    motor.GetJointAngle() + motor_info.angle_correction,
                    motor.GetJointSpeed() / motor_info.speed_control
                ])
            }
        }
        return state;
    }

    /**
     * Gets the size of the action space.
     * @return {number}
     */
    get_action_size(){
        return this.motors.length;
    }

    /**
     * Activates the motors according to the given actions by setting the motors speed and torque.
     * @param actions {Array}
     */
    activate_motors(actions){
        for(let i = 0; i < this.motors.length; i++){
            this.motors[i].SetMotorSpeed(this.motors[i].GetUserData().speed_control * Math.sign(actions[i]));
            let clamp01 = Math.max(0, Math.min(Math.abs(actions[i]), 1));
            this.motors[i].SetMaxMotorTorque(this.MOTORS_TORQUE * clamp01);
        }
    }

    /**
     * Creates the Box2D body parts, joints and sensors of the agent.
     * @param world {Object} - Box2D world
     * @param init_x {number}
     * @param init_y {number}
     * @param force_to_center {number}
     */
    draw(world, init_x, init_y, force_to_center){}

    /**
     * Gets all the body parts
     * @return {Array}
     */
    get_elements_to_render(){
        return this.body_parts;
    }

    /**
     * Checks if the given position is inside the agent's morphology
     * @param pos {{x: number, y: number}}
     * @return {boolean}
     */
    isPosInside(pos){
        for(let body of this.body_parts){
            let shape = body.GetFixtureList().GetShape();
            let vertices = [];
            for(let i = 0; i < shape.m_count; i++){
                let world_pos = body.GetWorldPoint(shape.m_vertices[i]);
                vertices.push({x: world_pos.x, y: world_pos.y});
            }

            // Counts the number of intersections between the edges of the polygon and the line of equation y = pos.y which are to the right of pos.x
            let nb_intersections = 0;
            for(let i = 0; i < vertices.length; i++){
                let v1 = vertices[i];
                let v2;
                if(i == vertices.length - 1){
                    v2 = vertices[0];
                }
                else {
                    v2 = vertices[i+1];
                }

                // Checks if the edge between v1 and v2 cross the mouse y-coordinate
                if(pos.y >= Math.min(v1.y, v2.y) && pos.y <= Math.max(v1.y, v2.y)){
                    let intersection_x;

                    // Computes the equation of the line between v1 and v2
                    let a = (v2.y - v1.y) / (v2.x - v1.x);
                    let b = v1.y - a * v1.x;

                    // Computes the x-coordinate of the intersection point
                    if(Math.abs(a) == Infinity){
                        intersection_x = v1.x;
                    }
                    else{
                        intersection_x = (pos.y - b) / a;
                    }

                    // Increases the number of intersection only if the intersection point is to the right of the mouse x-coordinate
                    if(intersection_x >= pos.x) {
                        nb_intersections += 1;
                    }
                }
            }

            // The pos is inside the agent's body if there is an odd number of intersections, else it is outside
            if(nb_intersections % 2 != 0){
                return true;
            }
        }
        return false;
    }

    /**
     * Destroys all the body parts of the agents.
     * @param world {Object} - Box2D world
     */
    destroy(world){
        for(let body of this.body_parts){
            world.DestroyBody(body);
        }
        this.body_parts = [];
        this.motors = [];
    }
}
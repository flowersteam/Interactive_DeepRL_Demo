/**
 * @classdesc Abstract class for climber morphologies.
 */
class ClimberAbstractBody extends WalkerAbstractBody {
    /**
     * @constructor
     * @param scale {number} - Scale of the environment
     * @param motors_torque {number}
     * @param nb_steps_under_water {number}
     */
    constructor(scale, motors_torque, nb_steps_under_water){
        super(scale, motors_torque, nb_steps_under_water);

        this.body_type = BodyTypesEnum.CLIMBER;
        this.sensors = [];
        this.SENSOR_FD = new b2.FixtureDef();
        this.SENSOR_FD.shape = new b2.CircleShape();
        this.SENSOR_FD.shape.m_radius = 0.05;
        this.SENSOR_FD.density = 1.0;
        this.SENSOR_FD.restitution = 0.0;
        this.SENSOR_FD.filter.categoryBits = 0x20;
        this.SENSOR_FD.filter.maskBits = 0x1;
        this.SENSOR_FD.isSensor = true;
    }

    // States
    get_state_size() {
        return super.get_state_size() + this.get_sensors_state().length;
    }

    get_sensors_state(){
        let state = [];
        for(let sensor of this.sensors){
            state = state.concat([
                sensor.GetUserData().has_contact ? 1 : 0,
                sensor.GetUserData().has_joint ? 1 : 0
            ]);
        }
        return state;
    }

    // Actions
    get_action_size() {
        return super.get_action_size() + this.sensors.length;
    }

    // Draw
    get_elements_to_render() {
        return super.get_elements_to_render().concat(this.sensors);
    }

    // Destroy
    destroy(world) {
        super.destroy(world);
        for(let sensor of this.sensors){
            world.DestroyBody(sensor);
        }
        this.sensors = [];
    }
}
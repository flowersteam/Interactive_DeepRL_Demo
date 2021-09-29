/**
 * @classdesc Abstract class for walker morphologies.
 */
class WalkerAbstractBody extends AbstractBody{
    /**
     * @constructor
     * @param scale {number} - Scale of the environment
     * @param motors_torque {number}
     * @param nb_steps_under_water {number}
     */
    constructor(scale, motors_torque, nb_steps_under_water) {
        super(scale, motors_torque);
        this.body_type = BodyTypesEnum.WALKER;
        this.nb_steps_can_survive_under_water = nb_steps_under_water;
    }
}
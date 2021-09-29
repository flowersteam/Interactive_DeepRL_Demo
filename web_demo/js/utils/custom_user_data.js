let CustomUserDataObjectTypes = {
    BODY_OBJECT: 0,
    WATER: 1,
    TERRAIN: 2,
    GRIP_TERRAIN: 3,
    MOTOR: 4,
    BODY_SENSOR: 5,
    SENSOR_GRIP_TERRAIN:6,
};

/**
 * @classdesc Class used to store data about different objects.
 */
class CustomUserData{
    /**
     * @constructor
     * @param name {string}
     * @param object_type {number}
     */
    constructor(name, object_type){
        this.name = name;
        this.object_type = object_type;
    }
}

/**
 * @classdesc Motor user data class.
 */
class CustomMotorUserData extends CustomUserData{
    /**
     * @constructor
     * @param name {string}
     * @param speed_control {number}
     * @param check_contact {boolean}
     * @param angle_correction {number}
     * @param contact_body {Object}
     */
    constructor(name, speed_control, check_contact, angle_correction=0.0, contact_body=null){
        super(name, CustomUserDataObjectTypes.MOTOR);
        this.speed_control = speed_control;
        this.check_contact = check_contact;
        this.angle_correction = angle_correction;
        this.contact_body = contact_body;
    }
}

/**
 * @classdesc Body user data class.
 */
class CustomBodyUserData extends CustomUserData{
    /**
     * @constructor
     * @param check_contact {boolean}
     * @param is_contact_critical {boolean}
     * @param name {string}
     * @param object_type {number}
     */
    constructor(check_contact, is_contact_critical=false,
                 name="body_part", object_type=CustomUserDataObjectTypes.BODY_OBJECT){
        super(name, object_type);
        this.check_contact = check_contact;
        this.is_contact_critical = is_contact_critical;
        this.has_contact = false;
    }
}

/**
 * @classdesc Sensor user data class.
 */
class CustomBodySensorUserData extends CustomBodyUserData{
    /**
     * @constructor
     * @param check_contact {boolean}
     * @param is_contact_critical {boolean}
     * @param name {string}
     */
    constructor(check_contact, is_contact_critical=false, name="body_part"){
        super(check_contact, is_contact_critical, name, CustomUserDataObjectTypes.BODY_SENSOR);
        this.has_joint = false;
        this.ready_to_attach = false;
    }
}

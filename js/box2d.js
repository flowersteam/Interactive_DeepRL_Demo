/** https://github.com/kripken/box2d.js v2.3.1 */

var performance = {
    now: function () {
        return +new Date()
    }
}
Function.prototype._extend = function (parent) {
    this.prototype.parent = parent;
    for (var x in parent.prototype) {
        if (!this.prototype[x]) {
            this.prototype[x] = parent.prototype[x]
        }
    }
};
Function.prototype._implement = function (parent) {
    return this._extend(parent)
};
var b2Profiler = (function () {

    function profileStruct(name, parent) {
        this.name = name;
        this.parent = parent;
        this.children = {};
        this.startTime = 0;
        this.elapsedTime = 0;
        this.totalTime = 0;
        this.running = false;
        this.childrenCount = 0
    }
    profileStruct.prototype = {
        start: function () {
            this.startTime = performance.now();
            this.running = true
        },
        stop: function (reset) {
            if (!this.running) {
                return
            }
            this.running = false;
            this.elapsedTime += performance.now() - this.startTime;
            if (reset) {
                this.start()
            }
            for (var x in this.children) {
                this.children[x].stop()
            }
        },
        reset: function (dontRun) {
            if (!dontRun) {
                this.running = true;
                this.totalTime += this.elapsedTime;
                this.start()
            }
            this.elapsedTime = 0;
            for (var x in this.children) {
                this.children[x].reset(true)
            }
        }
    };
    var profiles = [];
    var root = new profileStruct("root");

    function create(name, parent) {
        if (!profiles) {
            throw new Error("late profile creation not allowed")
        }
        var s = new profileStruct(name, parent || "root");
        profiles.push(s);
        return s
    }

    function destroy(profile) {
        profile.childrenCount--;
        delete profile.children[profile.name]
    }

    function recursiveParentCheck(node, profile) {
        if (node.name === profile.parent) {
            return node
        }
        for (var x in node.children) {
            var n;
            if (n = recursiveParentCheck(node.children[x], profile)) {
                return n
            }
        }
        return null
    }

    function init() {
        while (profiles.length) {
            var p = profiles.pop();
            if (!(p.parentNode = recursiveParentCheck(root, p))) {
                profiles.unshift(p)
            } else {
                p.parentNode.children[p.name] = p;
                p.parentNode.childrenCount++
            }
        }
        profiles = null
    }

    function resetAll() {
        root.reset(true)
    }
    return {
        create: create,
        destroy: destroy,
        init: init,
        reset: resetAll,
        profileRoot: root
    }
}());
"use strict";
var b2_maxFloat = Number.MAX_VALUE;
var b2_epsilon = 2.220446049250313e-16;
var b2_pi = Math.PI;
var b2_maxManifoldPoints = 2;
var b2_maxPolygonVertices = 8;
var b2_aabbExtension = 0.1;
var b2_aabbMultiplier = 2;
var b2_linearSlop = 0.005;
var b2_angularSlop = (2 / 180 * b2_pi);
var b2_polygonRadius = (2 * b2_linearSlop);
var b2_maxSubSteps = 8;
var b2_maxTOIContacts = 32;
var b2_velocityThreshold = 1;
var b2_maxLinearCorrection = 0.2;
var b2_maxAngularCorrection = (8 / 180 * b2_pi);
var b2_maxTranslation = 2;
var b2_maxTranslationSquared = (b2_maxTranslation * b2_maxTranslation);
var b2_maxRotation = (0.5 * b2_pi);
var b2_maxRotationSquared = (b2_maxRotation * b2_maxRotation);
var b2_baumgarte = 0.2;
var b2_toiBaugarte = 0.75;
var b2_timeToSleep = 0.5;
var b2_linearSleepTolerance = 0.01;
var b2_angularSleepTolerance = (2 / 180 * b2_pi);

function b2Version(ma, mi, re) {
    this.major = ma;
    this.minor = mi;
    this.revision = re
}
b2Version.prototype = {
    toString: function () {
        return this.major + "." + this.minor + "." + this.revision
    }
};
var b2_version = new b2Version(2, 3, 1);
"use strict";

function b2IsValid(x) {
    return isFinite(x) && !isNaN(x)
}
var sqrtf = Math.sqrt;
var atan2f = Math.atan2;
var sinf = Math.sin;
var cosf = Math.cos;
var floorf = Math.floor;
var ceilf = Math.ceil;
var b2Sqrt = sqrtf;
var b2Atan2 = atan2f;

function b2InvSqrt(x) {
    return 1 / sqrtf(x)
}

function b2Vec2(x, y) {
    if (typeof (x) !== "undefined") {
        this.x = x;
        this.y = y
    } else {
        this.x = this.y = 0
    }
}
b2Vec2.prototype = {
    Clone: function () {
        return new b2Vec2(this.x, this.y)
    },
    SetZero: function () {
        this.x = 0;
        this.y = 0;
        return this
    },
    Set: function (x_, y_) {
        this.x = x_;
        this.y = y_;
        return this
    },
    Assign: function (l) {
        this.x = l.x;
        this.y = l.y;
        return this
    },
    Negate: function () {
        var v = new b2Vec2();
        v.Set(-this.x, -this.y);
        return v
    },
    get_i: function (i) {
        switch (i) {
            case 0:
                return this.x;
            case 1:
                return this.y
        }
    },
    set_i: function (i, v) {
        switch (i) {
            case 0:
                return this.x = v;
            case 1:
                return this.y = v
        }
    },
    Add: function (v) {
        this.x += v.x;
        this.y += v.y;
        return this
    },
    Subtract: function (v) {
        this.x -= v.x;
        this.y -= v.y;
        return this
    },
    Multiply: function (a) {
        this.x *= a;
        this.y *= a;
        return this
    },
    Length: function () {
        return b2Sqrt(this.x * this.x + this.y * this.y)
    },
    LengthSquared: function () {
        return this.x * this.x + this.y * this.y
    },
    Normalize: function () {
        var length = this.Length();
        if (length < b2_epsilon) {
            return 0
        }
        var invLength = 1 / length;
        this.x *= invLength;
        this.y *= invLength;
        return length
    },
    IsValid: function () {
        return b2IsValid(this.x) && b2IsValid(this.y)
    },
    Skew: function () {
        return new b2Vec2(-this.y, this.x)
    },
    _serialize: function (out) {
        var obj = out || [];
        obj[0] = this.x;
        obj[1] = this.y;
        return obj
    },
    _deserialize: function (data) {
        this.x = data[0];
        this.y = data[1]
    }
};
b2Vec2.Add = function (a, b) {
    return new b2Vec2(a.x + b.x, a.y + b.y)
};
b2Vec2.Subtract = function (a, b) {
    return new b2Vec2(a.x - b.x, a.y - b.y)
};
b2Vec2.Equals = function (a, b) {
    return a.x == b.x && a.y == b.y
};
b2Vec2.Multiply = function (s, a) {
    return new b2Vec2(s * a.x, s * a.y)
};
b2Vec2.Negate = function (a) {
    return new b2Vec2(-a.x, -a.y)
};

function b2Vec3(x, y, z) {
    if (typeof (x) !== "undefined") {
        this.x = x;
        this.y = y;
        this.z = z
    }
}
b2Vec3.prototype = {
    Clone: function () {
        return new b2Vec3(this.x, this.y, this.z)
    },
    SetZero: function () {
        this.x = 0;
        this.y = 0;
        this.z = 0
    },
    Set: function (x_, y_, z_) {
        this.x = x_;
        this.y = y_;
        this.z = z_
    },
    Negate: function () {
        var v = new b2Vec3();
        v.Set(-this.x, -this.y, -this.z);
        return v
    },
    Add: function (v) {
        this.x += v.x;
        this.y += v.y;
        this.z += v.z
    },
    Subtract: function (v) {
        this.x -= v.x;
        this.y -= v.y;
        this.z -= v.z
    },
    Multiply: function (s) {
        this.x *= s;
        this.y *= s;
        this.z *= s
    },
    x: 0,
    y: 0,
    z: 0
};
b2Vec3.Multiply = function (s, a) {
    return new b2Vec3(s * a.x, s * a.y, s * a.z)
};
b2Vec3.Add = function (a, b) {
    return new b2Vec3(a.x + b.x, a.y + b.y, a.z + b.z)
};
b2Vec3.Subtract = function (a, b) {
    return new b2Vec3(a.x - b.x, a.y - b.y, a.z - b.z)
};

function b2Mat22(c1, c2) {
    this.ex = c1 ? c1.Clone() : new b2Vec2();
    this.ey = c2 ? c2.Clone() : new b2Vec2()
}
b2Mat22.prototype = {
    Set: function (c1, c2) {
        this.ex.Assign(c1);
        this.ey.Assign(c2)
    },
    Assign: function (mat) {
        this.ex.Assign(mat.ex);
        this.ey.Assign(mat.ey)
    },
    SetIdentity: function () {
        this.ex.x = 1;
        this.ey.x = 0;
        this.ex.y = 0;
        this.ey.y = 1
    },
    SetZero: function () {
        this.ex.x = 0;
        this.ey.x = 0;
        this.ex.y = 0;
        this.ey.y = 0
    },
    GetInverse: function () {
        var a = this.ex.x,
            b = this.ey.x,
            c = this.ex.y,
            d = this.ey.y;
        var B = new b2Mat22();
        var det = a * d - b * c;
        if (det != 0) {
            det = 1 / det
        }
        B.ex.x = det * d;
        B.ey.x = -det * b;
        B.ex.y = -det * c;
        B.ey.y = det * a;
        return B
    },
    Solve: function (b) {
        var a11 = this.ex.x,
            a12 = this.ey.x,
            a21 = this.ex.y,
            a22 = this.ey.y;
        var det = a11 * a22 - a12 * a21;
        if (det != 0) {
            det = 1 / det
        }
        var x = new b2Vec2();
        x.x = det * (a22 * b.x - a12 * b.y);
        x.y = det * (a11 * b.y - a21 * b.x);
        return x
    }
};
b2Mat22.Add = function (A, B) {
    return new b2Mat22(b2Vec2.Add(A.ex, B.ex), b2Vec2.Add(A.ey, B.ey))
};

function b2Mat33(c1, c2, c3) {
    this.ex = c1 ? c1.Clone() : new b2Vec3();
    this.ey = c2 ? c2.Clone() : new b2Vec3();
    this.ez = c3 ? c3.Clone() : new b2Vec3()
}
b2Mat33.prototype = {
    SetZero: function () {
        this.ex.SetZero();
        this.ey.SetZero();
        this.ez.SetZero()
    },
    Solve33: function (b) {
        var det = b2Dot_v3_v3(this.ex, b2Cross_v3_v3(this.ey, this.ez));
        if (det != 0) {
            det = 1 / det
        }
        var x = new b2Vec3();
        x.x = det * b2Dot_v3_v3(b, b2Cross_v3_v3(this.ey, this.ez));
        x.y = det * b2Dot_v3_v3(this.ex, b2Cross_v3_v3(b, this.ez));
        x.z = det * b2Dot_v3_v3(this.ex, b2Cross_v3_v3(this.ey, b));
        return x
    },
    Solve22: function (b) {
        var a11 = this.ex.x,
            a12 = this.ey.x,
            a21 = this.ex.y,
            a22 = this.ey.y;
        var det = a11 * a22 - a12 * a21;
        if (det != 0) {
            det = 1 / det
        }
        var x = new b2Vec2();
        x.x = det * (a22 * b.x - a12 * b.y);
        x.y = det * (a11 * b.y - a21 * b.x);
        return x
    },
    GetInverse22: function (M) {
        var a = this.ex.x,
            b = this.ey.x,
            c = this.ex.y,
            d = this.ey.y;
        var det = a * d - b * c;
        if (det != 0) {
            det = 1 / det
        }
        M.ex.x = det * d;
        M.ey.x = -det * b;
        M.ex.z = 0;
        M.ex.y = -det * c;
        M.ey.y = det * a;
        M.ey.z = 0;
        M.ez.x = 0;
        M.ez.y = 0;
        M.ez.z = 0
    },
    GetSymInverse33: function (M) {
        var det = b2Dot_v3_v3(this.ex, b2Cross_v3_v3(this.ey, this.ez));
        if (det != 0) {
            det = 1 / det
        }
        var a11 = this.ex.x,
            a12 = this.ey.x,
            a13 = this.ez.x;
        var a22 = this.ey.y,
            a23 = this.ez.y;
        var a33 = this.ez.z;
        M.ex.x = det * (a22 * a33 - a23 * a23);
        M.ex.y = det * (a13 * a23 - a12 * a33);
        M.ex.z = det * (a12 * a23 - a13 * a22);
        M.ey.x = M.ex.y;
        M.ey.y = det * (a11 * a33 - a13 * a13);
        M.ey.z = det * (a13 * a12 - a11 * a23);
        M.ez.x = M.ex.z;
        M.ez.y = M.ey.z;
        M.ez.z = det * (a11 * a22 - a12 * a12)
    }
};

function b2Rot(angle, c) {
    if (typeof (c) !== "undefined") {
        this.s = angle;
        this.c = c
    } else {
        if (typeof (angle) !== "undefined") {
            this.Set(angle)
        }
    }
}
b2Rot.prototype = {
    Clone: function () {
        return new b2Rot(this.s, this.c)
    },
    Assign: function (l) {
        this.s = l.s;
        this.c = l.c
    },
    Set: function (x) {
        this.s = sinf(x);
        this.c = cosf(x)
    },
    SetIdentity: function () {
        this.s = 0;
        this.c = 1
    },
    GetAngle: function () {
        return b2Atan2(this.s, this.c)
    },
    GetXAxis: function () {
        return new b2Vec2(this.c, this.s)
    },
    GetYAxis: function () {
        return new b2Vec2(-this.s, this.c)
    },
    s: 0,
    c: 1
};

function b2Transform(position, rotation) {
    this.p = new b2Vec2();
    this.q = new b2Rot();
    if (position) {
        this.p.Assign(position);
        this.q.Assign(rotation)
    }
}
b2Transform.prototype = {
    Clone: function () {
        var xf = new b2Transform(this.p, this.q);
        return xf
    },
    Assign: function (xf) {
        this.p.Assign(xf.p);
        this.q.Assign(xf.q)
    },
    SetIdentity: function () {
        this.p.SetZero();
        this.q.SetIdentity()
    },
    Set: function (position, angle) {
        this.p.Assign(position);
        this.q.Set(angle)
    }
};

function b2Sweep() {
    this.localCenter = new b2Vec2();
    this.c0 = new b2Vec2();
    this.c = new b2Vec2()
}
b2Sweep.prototype = {
    Assign: function (sweep) {
        this.localCenter.Assign(sweep.localCenter);
        this.c0.Assign(sweep.c0);
        this.c.Assign(sweep.c);
        this.a = sweep.a;
        this.a0 = sweep.a0;
        this.alpha0 = sweep.alpha0
    },
    Clone: function () {
        var sweep = new b2Sweep();
        sweep.localCenter.Assign(this.localCenter);
        sweep.c0.Assign(this.c0);
        sweep.c.Assign(this.c);
        sweep.a = this.a;
        sweep.a0 = this.a0;
        sweep.alpha0 = this.alpha0;
        return sweep
    },
    GetTransform: function (xf, beta) {
        xf.p.x = ((1 - beta) * this.c0.x) + (beta * this.c.x);
        xf.p.y = ((1 - beta) * this.c0.y) + (beta * this.c.y);
        var angle = (1 - beta) * this.a0 + beta * this.a;
        xf.q.Set(angle);
        xf.p.x -= xf.q.c * this.localCenter.x - xf.q.s * this.localCenter.y;
        xf.p.y -= xf.q.s * this.localCenter.x + xf.q.c * this.localCenter.y
    },
    Advance: function (alpha) {
        var beta = (alpha - this.alpha0) / (1 - this.alpha0);
        this.c0.Add(b2Vec2.Multiply(beta, b2Vec2.Subtract(this.c, this.c0)));
        this.a0 += beta * (this.a - this.a0);
        this.alpha0 = alpha
    },
    Normalize: function () {
        var twoPi = 2 * b2_pi;
        var d = twoPi * floorf(this.a0 / twoPi);
        this.a0 -= d;
        this.a -= d
    },
    a0: 0,
    a: 0,
    alpha0: 0
};

function b2Dot_v2_v2(a, b) {
    return a.x * b.x + a.y * b.y
}

function b2Cross_v2_v2(a, b) {
    return a.x * b.y - a.y * b.x
}

function b2Cross_v2_f(a, s) {
    return new b2Vec2(s * a.y, -s * a.x)
}

function b2Cross_f_v2(s, a) {
    return new b2Vec2(-s * a.y, s * a.x)
}

function b2Mul_m22_v2(A, v) {
    return new b2Vec2(A.ex.x * v.x + A.ey.x * v.y, A.ex.y * v.x + A.ey.y * v.y)
}

function b2MulT_m22_v2(A, v) {
    return new b2Vec2(b2Dot_v2_v2(v, A.ex), b2Dot_v2_v2(v, A.ey))
}

function b2Distance(a, b) {
    var c = b2Vec2.Subtract(a, b);
    return c.Length()
}

function b2DistanceSquared(a, b) {
    var c = b2Vec2.Subtract(a, b);
    return b2Dot_v2_v2(c, c)
}

function b2Dot_v3_v3(a, b) {
    return a.x * b.x + a.y * b.y + a.z * b.z
}

function b2Cross_v3_v3(a, b) {
    return new b2Vec3(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x)
}

function b2Mul_m22_m22(A, B) {
    return new b2Mat22(b2Mul_m22_v2(A, B.ex), b2Mul_m22_v2(A, B.ey))
}

function b2MulT_m22_m22(A, B) {
    var c1 = new b2Vec2(b2Dot_v2_v2(A.ex, B.ex), b2Dot_v2_v2(A.ey, B.ex));
    var c2 = new b2Vec2(b2Dot_v2_v2(A.ex, B.ey), b2Dot_v2_v2(A.ey, B.ey));
    return new b2Mat22(c1, c2)
}

function b2Mul_m33_v3(A, v) {
    return b2Vec3.Add(b2Vec3.Add(b2Vec3.Multiply(v.x, A.ex), b2Vec3.Multiply(v.y, A.ey)), b2Vec3.Multiply(v.z, A.ez))
}

function b2Mul22_m33_v2(A, v) {
    return new b2Vec2(A.ex.x * v.x + A.ey.x * v.y, A.ex.y * v.x + A.ey.y * v.y)
}

function b2Mul_r_r(q, r) {
    var qr = new b2Rot();
    qr.s = q.s * r.c + q.c * r.s;
    qr.c = q.c * r.c - q.s * r.s;
    return qr
}

function b2MulT_r_r(q, r) {
    var qr = new b2Rot();
    qr.s = q.c * r.s - q.s * r.c;
    qr.c = q.c * r.c + q.s * r.s;
    return qr
}

function b2Mul_r_v2(q, v) {
    return new b2Vec2(q.c * v.x - q.s * v.y, q.s * v.x + q.c * v.y)
}

function b2MulT_r_v2(q, v) {
    return new b2Vec2(q.c * v.x + q.s * v.y, -q.s * v.x + q.c * v.y)
}

function b2Mul_t_v2(T, v) {
    return new b2Vec2((T.q.c * v.x - T.q.s * v.y) + T.p.x, (T.q.s * v.x + T.q.c * v.y) + T.p.y)
}

function b2MulT_t_v2(T, v) {
    var px = v.x - T.p.x;
    var py = v.y - T.p.y;
    var x = (T.q.c * px + T.q.s * py);
    var y = (-T.q.s * px + T.q.c * py);
    return new b2Vec2(x, y)
}

function b2Mul_t_t(A, B) {
    var C = new b2Transform();
    C.q = b2Mul_r_r(A.q, B.q);
    C.p = b2Vec2.Add(b2Mul_r_v2(A.q, B.p), A.p);
    return C
}

function b2MulT_t_t(A, B) {
    var C = new b2Transform();
    C.q = b2MulT_r_r(A.q, B.q);
    var tvx = B.p.x - A.p.x;
    var tvy = B.p.y - A.p.y;
    C.p.x = A.q.c * tvx + A.q.s * tvy;
    C.p.y = -A.q.s * tvx + A.q.c * tvy;
    return C
}
var b2Abs = Math.abs;

function b2Abs_v2(a) {
    return new b2Vec2(b2Abs(a.x), b2Abs(a.y))
}

function b2Abs_m22(A) {
    return new b2Mat22(b2Abs_v2(A.ex), b2Abs_v2(A.ey))
}
var b2Min = Math.min;

function b2Min_v2(a, b) {
    return new b2Vec2(b2Min(a.x, b.x), b2Min(a.y, b.y))
}
var b2Max = Math.max;

function b2Max_v2(a, b) {
    return new b2Vec2(b2Max(a.x, b.x), b2Max(a.y, b.y))
}

function b2Clamp(a, low, high) {
    return b2Max(low, b2Min(a, high))
}

function b2Clamp_v2(a, low, high) {
    return b2Max_v2(low, b2Min_v2(a, high))
}

function b2NextPowerOfTwo(x) {
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);
    return x + 1
}

function b2IsPowerOfTwo(x) {
    var result = x > 0 && (x & (x - 1)) == 0;
    return result
}
var RAND_LIMIT = 32767;

function b2RandomFloat(lo, hi) {
    var r = Math.random();
    if (typeof (lo) !== "undefined") {
        r = (hi - lo) * r + lo
    } else {
        r = 2 * r - 1
    }
    return r
}
"use strict";

function b2Color(r, g, b) {
    this.r = r || 0;
    this.g = g || 0;
    this.b = b || 0
}
b2Color.prototype = {
    Set: function (r, g, b) {
        this.r = r;
        this.g = g;
        this.b = b
    }
};

function b2Draw() {}
b2Draw.prototype = {
    SetFlags: function (flags) {
        this.m_drawFlags = flags
    },
    GetFlags: function () {
        return this.m_drawFlags
    },
    AppendFlags: function (flags) {
        this.m_drawFlags |= flags
    },
    ClearFlags: function (flags) {
        this.m_drawFlags &= ~flags
    },
    ToggleFlags: function (flags) {
        this.m_drawFlags ^= flags
    },
    DrawPolygon: function (vertices, vertexCount, color) {},
    DrawSolidPolygon: function (vertices, vertexCount, color) {},
    DrawCircle: function (center, radius, color) {},
    DrawSolidCircle: function (center, radius, axis, color) {},
    DrawSegment: function (p1, p2, color) {},
    DrawTransform: function (xf) {},
    m_drawFlags: 0
};
b2Draw.e_shapeBit = 1;
b2Draw.e_jointBit = 2;
b2Draw.e_aabbBit = 4;
b2Draw.e_centerOfMassBit = 8;
b2Draw.e_contactPoints = 16;
b2Draw.e_contactNormals = 32;
b2Draw.e_contactImpulses = 64;
b2Draw.e_frictionImpulses = 128;
b2Draw.e_statistics = 256;
b2Draw.e_profile = 512;
b2Draw.e_pairBit = 1024;

"use strict";
function b2Timer() {
    this.Reset()
}
b2Timer.prototype = {
    Reset: function () {
        this.m_start = performance.now()
    },
    GetMilliseconds: function () {
        return performance.now() - this.m_start
    }
};
"use strict";

function b2MassData() {
    this.mass = 0;
    this.center = new b2Vec2();
    this.I = 0
}

function b2Shape() {
    this.m_type = 0;
    this.m_radius = 0
}
b2Shape.prototype = {
    Clone: function () {},
    GetType: function () {
        return this.m_type
    },
    GetChildCount: function () {},
    TestPoint: function (xf, p) {},
    RayCast: function (output, input, transform, childIndex) {},
    ComputeAABB: function (aabb, xf, childIndex) {},
    ComputeMass: function (massData, density) {},
    _serialize: function (out) {
        var obj = out || {};
        obj.m_type = this.m_type;
        obj.m_radius = this.m_radius;
        return obj
    },
    _deserialize: function (data) {
        this.m_radius = data.m_radius
    }
};
b2Shape.e_circle = 0;
b2Shape.e_edge = 1;
b2Shape.e_polygon = 2;
b2Shape.e_chain = 3;
b2Shape.e_typeCount = 4;
"use strict";

function b2CircleShape() {
    this.parent.call(this);
    this.m_type = b2Shape.e_circle;
    this.m_radius = 0;
    this.m_p = new b2Vec2();
    Object.seal(this)
}
b2CircleShape.prototype = {
    Clone: function () {
        var shape = new b2CircleShape();
        shape.m_radius = this.m_radius;
        shape.m_p = this.m_p.Clone();
        return shape
    },
    GetChildCount: function () {
        return 1
    },
    TestPoint: function (transform, p) {
        var center = b2Vec2.Add(transform.p, b2Mul_r_v2(transform.q, this.m_p));
        var d = b2Vec2.Subtract(p, center);
        return b2Dot_v2_v2(d, d) <= this.m_radius * this.m_radius
    },
    RayCast: function (output, input, transform, childIndex) {
        var position = b2Vec2.Add(transform.p, b2Mul_r_v2(transform.q, this.m_p));
        var s = b2Vec2.Subtract(input.p1, position);
        var b = b2Dot_v2_v2(s, s) - this.m_radius * this.m_radius;
        var r = b2Vec2.Subtract(input.p2, input.p1);
        var c = b2Dot_v2_v2(s, r);
        var rr = b2Dot_v2_v2(r, r);
        var sigma = c * c - rr * b;
        if (sigma < 0 || rr < b2_epsilon) {
            return false
        }
        var a = -(c + b2Sqrt(sigma));
        if (0 <= a && a <= input.maxFraction * rr) {
            a /= rr;
            output.fraction = a;
            output.normal = b2Vec2.Add(s, b2Vec2.Multiply(a, r));
            output.normal.Normalize();
            return true
        }
        return false
    },
    ComputeAABB: function (aabb, transform, childIndex) {
        var px = transform.p.x + (transform.q.c * this.m_p.x - transform.q.s * this.m_p.y);
        var py = transform.p.y + (transform.q.s * this.m_p.x + transform.q.c * this.m_p.y);
        aabb.lowerBound.x = px - this.m_radius;
        aabb.lowerBound.y = py - this.m_radius;
        aabb.upperBound.x = px + this.m_radius;
        aabb.upperBound.y = py + this.m_radius
    },
    ComputeMass: function (massData, density) {
        massData.mass = density * b2_pi * this.m_radius * this.m_radius;
        massData.center = this.m_p;
        massData.I = massData.mass * (0.5 * this.m_radius * this.m_radius + b2Dot_v2_v2(this.m_p, this.m_p))
    },
    GetSupport: function (d) {
        return 0
    },
    GetSupportVertex: function (d) {
        return this.m_p
    },
    GetVertexCount: function () {
        return 1
    },
    GetVertex: function (index) {
        return this.m_p
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.m_p = this.m_p._serialize();
        return obj
    },
    _deserialize: function (data) {
        this.parent.prototype._deserialize.call(this, data);
        this.m_p._deserialize(data.m_p)
    }
};
b2CircleShape._extend(b2Shape);
"use strict";

function b2EdgeShape() {
    this.parent.call(this);
    this.m_type = b2Shape.e_edge;
    this.m_radius = b2_polygonRadius;
    this.m_vertex0 = new b2Vec2();
    this.m_vertex1 = new b2Vec2();
    this.m_vertex2 = new b2Vec2();
    this.m_vertex3 = new b2Vec2();
    this.m_hasVertex0 = false;
    this.m_hasVertex3 = false;
    Object.seal(this)
}
b2EdgeShape.prototype = {
    Set: function (v1, v2) {
        this.m_vertex1.Assign(v1);
        this.m_vertex2.Assign(v2);
        this.m_hasVertex0 = false;
        this.m_hasVertex3 = false
    },
    Clone: function () {
        var shape = new b2EdgeShape();
        shape.m_vertex0 = this.m_vertex0.Clone();
        shape.m_vertex1 = this.m_vertex1.Clone();
        shape.m_vertex2 = this.m_vertex2.Clone();
        shape.m_vertex3 = this.m_vertex3.Clone();
        shape.m_hasVertex0 = this.m_hasVertex0;
        shape.m_hasVertex3 = this.m_hasVertex3;
        return shape
    },
    GetChildCount: function () {
        return 1
    },
    TestPoint: function (transform, p) {
        return false
    },
    RayCast: function (output, input, xf, childIndex) {
        var p1 = b2MulT_r_v2(xf.q, b2Vec2.Subtract(input.p1, xf.p));
        var p2 = b2MulT_r_v2(xf.q, b2Vec2.Subtract(input.p2, xf.p));
        var d = b2Vec2.Subtract(p2, p1);
        var v1 = this.m_vertex1;
        var v2 = this.m_vertex2;
        var e = b2Vec2.Subtract(v2, v1);
        var normal = new b2Vec2(e.y, -e.x);
        normal.Normalize();
        var numerator = b2Dot_v2_v2(normal, b2Vec2.Subtract(v1, p1));
        var denominator = b2Dot_v2_v2(normal, d);
        if (denominator == 0) {
            return false
        }
        var t = numerator / denominator;
        if (t < 0 || input.maxFraction < t) {
            return false
        }
        var q = b2Vec2.Add(p1, b2Vec2.Multiply(t, d));
        var r = b2Vec2.Subtract(v2, v1);
        var rr = b2Dot_v2_v2(r, r);
        if (rr == 0) {
            return false
        }
        var s = b2Dot_v2_v2(b2Vec2.Subtract(q, v1), r) / rr;
        if (s < 0 || 1 < s) {
            return false
        }
        output.fraction = t;
        if (numerator > 0) {
            output.normal = b2Mul_r_v2(xf.q, normal).Negate()
        } else {
            output.normal = b2Mul_r_v2(xf.q, normal)
        }
        return true
    },
    ComputeAABB: function (aabb, xf, childIndex) {
        var v1x = (xf.q.c * this.m_vertex1.x - xf.q.s * this.m_vertex1.y) + xf.p.x;
        var v1y = (xf.q.s * this.m_vertex1.x + xf.q.c * this.m_vertex1.y) + xf.p.y;
        var v2x = (xf.q.c * this.m_vertex2.x - xf.q.s * this.m_vertex2.y) + xf.p.x;
        var v2y = (xf.q.s * this.m_vertex2.x + xf.q.c * this.m_vertex2.y) + xf.p.y;
        var lowerx = b2Min(v1x, v2x);
        var lowery = b2Min(v1y, v2y);
        var upperx = b2Max(v1x, v2x);
        var uppery = b2Max(v1y, v2y);
        aabb.lowerBound.x = lowerx - this.m_radius;
        aabb.lowerBound.y = lowery - this.m_radius;
        aabb.upperBound.x = upperx + this.m_radius;
        aabb.upperBound.y = uppery + this.m_radius
    },
    ComputeMass: function (massData, density) {
        massData.mass = 0;
        massData.center = b2Vec2.Multiply(0.5, b2Vec2.Add(this.m_vertex1, this.m_vertex2));
        massData.I = 0
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.m_vertex1 = this.m_vertex1._serialize();
        obj.m_vertex2 = this.m_vertex2._serialize();
        obj.m_hasVertex0 = this.m_hasVertex0;
        if (this.m_hasVertex0) {
            obj.m_vertex0 = this.m_vertex0._serialize()
        }
        obj.m_hasVertex3 = this.m_hasVertex3;
        if (this.m_hasVertex3) {
            obj.m_vertex3 = this.m_vertex3._serialize()
        }
        return obj
    },
    _deserialize: function (data) {
        this.parent.prototype._deserialize.call(this, data);
        this.m_vertex1._deserialize(data.m_vertex1);
        this.m_vertex2._deserialize(data.m_vertex2);
        this.m_hasVertex0 = data.m_hasVertex0;
        if (this.m_hasVertex0) {
            this.m_vertex0._deserialize(data.m_vertex0)
        }
        this.m_hasVertex3 = data.m_hasVertex3;
        if (this.m_hasVertex3) {
            this.m_vertex3._deserialize(data.m_vertex3)
        }
    }
};
b2EdgeShape._extend(b2Shape);
"use strict";

function b2ChainShape() {
    this.parent.call(this);
    this.m_type = b2Shape.e_chain;
    this.m_radius = b2_polygonRadius;
    this.m_vertices = null;
    this.m_count = 0;
    this.m_prevVertex = new b2Vec2();
    this.m_nextVertex = new b2Vec2();
    this.m_hasPrevVertex = false;
    this.m_hasNextVertex = false;
    Object.seal(this)
}
b2ChainShape.prototype = {
    CreateLoop: function (vertices, count) {
        for (var i = 1; i < count; ++i) {
            var v1 = vertices[i - 1];
            var v2 = vertices[i]
        }
        this.m_count = count + 1;
        this.m_vertices = new Array(this.m_count);
        for (var i = 0; i < count; ++i) {
            this.m_vertices[i] = vertices[i].Clone()
        }
        this.m_vertices[count] = this.m_vertices[0].Clone();
        this.m_prevVertex.Assign(this.m_vertices[this.m_count - 2]);
        this.m_nextVertex.Assign(this.m_vertices[1]);
        this.m_hasPrevVertex = true;
        this.m_hasNextVertex = true
    },
    CreateChain: function (vertices, count) {
        for (var i = 1; i < count; ++i) {
            var v1 = vertices[i - 1];
            var v2 = vertices[i]
        }
        this.m_count = count;
        this.m_vertices = new Array(count);
        for (var i = 0; i < count; ++i) {
            this.m_vertices[i] = vertices[i].Clone()
        }
        this.m_hasPrevVertex = false;
        this.m_hasNextVertex = false;
        this.m_prevVertex.SetZero();
        this.m_nextVertex.SetZero()
    },
    SetPrevVertex: function (prevVertex) {
        this.m_prevVertex.Assign(prevVertex);
        this.m_hasPrevVertex = true
    },
    SetNextVertex: function (nextVertex) {
        this.m_nextVertex.Assign(nextVertex);
        this.m_hasNextVertex = true
    },
    Clone: function () {
        var shape = new b2ChainShape();
        shape.m_count = this.m_count;
        shape.m_vertices = new Array(this.m_count);
        for (var i = 0; i < this.m_count; ++i) {
            shape.m_vertices[i] = this.m_vertices[i].Clone()
        }
        shape.m_prevVertex = this.m_prevVertex.Clone();
        shape.m_nextVertex = this.m_nextVertex.Clone();
        shape.m_hasPrevVertex = this.m_hasPrevVertex;
        shape.m_hasNextVertex = this.m_hasNextVertex;
        return shape
    },
    GetChildCount: function () {
        return this.m_count - 1
    },
    GetChildEdge: function (edge, index) {
        edge.m_type = b2Shape.e_edge;
        edge.m_radius = this.m_radius;
        edge.m_vertex1 = this.m_vertices[index + 0];
        edge.m_vertex2 = this.m_vertices[index + 1];
        if (index > 0) {
            edge.m_vertex0 = this.m_vertices[index - 1];
            edge.m_hasVertex0 = true
        } else {
            edge.m_vertex0 = this.m_prevVertex;
            edge.m_hasVertex0 = this.m_hasPrevVertex
        }
        if (index < this.m_count - 2) {
            edge.m_vertex3 = this.m_vertices[index + 2];
            edge.m_hasVertex3 = true
        } else {
            edge.m_vertex3 = this.m_nextVertex;
            edge.m_hasVertex3 = this.m_hasNextVertex
        }
    },
    TestPoint: function (transform, p) {
        return false
    },
    RayCast: function (output, input, xf, childIndex) {
        var edgeShape = new b2EdgeShape();
        var i1 = childIndex;
        var i2 = childIndex + 1;
        if (i2 == this.m_count) {
            i2 = 0
        }
        edgeShape.m_vertex1 = this.m_vertices[i1].Clone();
        edgeShape.m_vertex2 = this.m_vertices[i2].Clone();
        return edgeShape.RayCast(output, input, xf, 0)
    },
    ComputeAABB: function (aabb, xf, childIndex) {
        var i1 = childIndex;
        var i2 = childIndex + 1;
        if (i2 == this.m_count) {
            i2 = 0
        }
        var v1x = (xf.q.c * this.m_vertices[i1].x - xf.q.s * this.m_vertices[i1].y) + xf.p.x;
        var v1y = (xf.q.s * this.m_vertices[i1].x + xf.q.c * this.m_vertices[i1].y) + xf.p.y;
        var v2x = (xf.q.c * this.m_vertices[i2].x - xf.q.s * this.m_vertices[i2].y) + xf.p.x;
        var v2y = (xf.q.s * this.m_vertices[i2].x + xf.q.c * this.m_vertices[i2].y) + xf.p.y;
        aabb.lowerBound.x = b2Min(v1x, v2x);
        aabb.lowerBound.y = b2Min(v1y, v2y);
        aabb.upperBound.x = b2Max(v1x, v2x);
        aabb.upperBound.y = b2Max(v1y, v2y)
    },
    ComputeMass: function (massData, density) {
        massData.mass = 0;
        massData.center.SetZero();
        massData.I = 0
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.m_count = this.m_count;
        obj.m_vertices = [];
        for (var i = 0; i < this.m_count; ++i) {
            obj.m_vertices.push(this.m_vertices[i]._serialize())
        }
        obj.m_hasPrevVertex = this.m_hasPrevVertex;
        if (this.m_hasPrevVertex) {
            obj.m_prevVertex = this.m_prevVertex._serialize()
        }
        obj.m_hasNextVertex = this.m_hasNextVertex;
        if (this.m_hasNextVertex) {
            obj.m_nextVertex = this.m_nextVertex._serialize()
        }
        return obj
    },
    _deserialize: function (data) {
        this.parent.prototype._deserialize.call(this, data);
        this.m_count = data.m_count;
        this.m_vertices = [];
        for (var i = 0; i < this.m_count; ++i) {
            this.m_vertices[i] = new b2Vec2();
            this.m_vertices[i]._deserialize(data.m_vertices[i])
        }
        this.m_hasPrevVertex = data.m_hasPrevVertex;
        if (this.m_hasPrevVertex) {
            this.m_prevVertex._deserialize(data.m_prevVertex)
        }
        this.m_hasNextVertex = data.m_hasNextVertex;
        if (this.m_hasNextVertex) {
            this.m_nextVertex._deserialize(data.m_nextVertex)
        }
    }
};
b2ChainShape._extend(b2Shape);
"use strict";

function b2PolygonShape() {
    this.parent.call(this);
    this.m_type = b2Shape.e_polygon;
    this.m_radius = b2_polygonRadius;
    this.m_count = 0;
    this.m_centroid = new b2Vec2();
    this.m_vertices = new Array(b2_maxPolygonVertices);
    this.m_normals = new Array(b2_maxPolygonVertices);
    Object.seal(this)
}
b2PolygonShape.prototype = {
    Clone: function () {
        var shape = new b2PolygonShape();
        shape.m_count = this.m_count;
        shape.m_centroid = this.m_centroid.Clone();
        for (var i = 0; i < this.m_count; ++i) {
            shape.m_vertices[i] = this.m_vertices[i].Clone();
            shape.m_normals[i] = this.m_normals[i].Clone()
        }
        return shape
    },
    GetChildCount: function () {
        return 1
    },
    Set: function (vertices, count) {
        if (count < 3) {
            this.SetAsBox(1, 1);
            return
        }
        var n = b2Min(count, b2_maxPolygonVertices);
        var ps = new Array(b2_maxPolygonVertices);
        var tempCount = 0;
        for (var i = 0; i < n; ++i) {
            var v = vertices[i];
            var unique = true;
            for (var j = 0; j < tempCount; ++j) {
                if (b2DistanceSquared(v, ps[j]) < 0.5 * b2_linearSlop) {
                    unique = false;
                    break
                }
            }
            if (unique) {
                ps[tempCount++] = v.Clone()
            }
        }
        n = tempCount;
        if (n < 3) {
            this.SetAsBox(1, 1);
            return
        }
        var i0 = 0;
        var x0 = ps[0].x;
        for (i = 1; i < n; ++i) {
            var x = ps[i].x;
            if (x > x0 || (x == x0 && ps[i].y < ps[i0].y)) {
                i0 = i;
                x0 = x
            }
        }
        var hull = new Array(b2_maxPolygonVertices);
        var m = 0;
        var ih = i0;
        for (;;) {
            hull[m] = ih;
            var ie = 0;
            for (j = 1; j < n; ++j) {
                if (ie == ih) {
                    ie = j;
                    continue
                }
                var r = b2Vec2.Subtract(ps[ie], ps[hull[m]]);
                var v = b2Vec2.Subtract(ps[j], ps[hull[m]]);
                var c = b2Cross_v2_v2(r, v);
                if (c < 0) {
                    ie = j
                }
                if (c == 0 && v.LengthSquared() > r.LengthSquared()) {
                    ie = j
                }
            }++m;
            ih = ie;
            if (ie == i0) {
                break
            }
        }
        this.m_count = m;
        for (i = 0; i < m; ++i) {
            this.m_vertices[i] = ps[hull[i]].Clone()
        }
        for (i = 0; i < m; ++i) {
            var i1 = i;
            var i2 = i + 1 < m ? i + 1 : 0;
            var edge = b2Vec2.Subtract(this.m_vertices[i2], this.m_vertices[i1]);
            this.m_normals[i] = b2Cross_v2_f(edge, 1).Clone();
            this.m_normals[i].Normalize()
        }
        this.m_centroid = b2PolygonShape.ComputeCentroid(this.m_vertices, m)
    },
    SetAsBox: function (hx, hy, center, angle) {
        this.m_count = 4;
        this.m_vertices[0] = new b2Vec2(-hx, -hy);
        this.m_vertices[1] = new b2Vec2(hx, -hy);
        this.m_vertices[2] = new b2Vec2(hx, hy);
        this.m_vertices[3] = new b2Vec2(-hx, hy);
        this.m_normals[0] = new b2Vec2(0, -1);
        this.m_normals[1] = new b2Vec2(1, 0);
        this.m_normals[2] = new b2Vec2(0, 1);
        this.m_normals[3] = new b2Vec2(-1, 0);
        if (!center) {
            return
        }
        this.m_centroid.Assign(center);
        var xf = new b2Transform();
        xf.p = center;
        xf.q.Set(angle);
        for (var i = 0; i < this.m_count; ++i) {
            this.m_vertices[i].Assign(b2Mul_t_v2(xf, this.m_vertices[i]));
            this.m_normals[i].Assign(b2Mul_r_v2(xf.q, this.m_normals[i]))
        }
    },
    TestPoint: function (xf, p) {
        var pLocal = b2MulT_r_v2(xf.q, b2Vec2.Subtract(p, xf.p));
        for (var i = 0; i < this.m_count; ++i) {
            var dot = b2Dot_v2_v2(this.m_normals[i], b2Vec2.Subtract(pLocal, this.m_vertices[i]));
            if (dot > 0) {
                return false
            }
        }
        return true
    },
    RayCast: function (output, input, xf, childIndex) {
        var p1 = b2MulT_r_v2(xf.q, b2Vec2.Subtract(input.p1, xf.p));
        var p2 = b2MulT_r_v2(xf.q, b2Vec2.Subtract(input.p2, xf.p));
        var d = b2Vec2.Subtract(p2, p1);
        var lower = 0,
            upper = input.maxFraction;
        var index = -1;
        for (var i = 0; i < this.m_count; ++i) {
            var numerator = b2Dot_v2_v2(this.m_normals[i], b2Vec2.Subtract(this.m_vertices[i], p1));
            var denominator = b2Dot_v2_v2(this.m_normals[i], d);
            if (denominator == 0) {
                if (numerator < 0) {
                    return false
                }
            } else {
                if (denominator < 0 && numerator < lower * denominator) {
                    lower = numerator / denominator;
                    index = i
                } else {
                    if (denominator > 0 && numerator < upper * denominator) {
                        upper = numerator / denominator
                    }
                }
            }
            if (upper < lower) {
                return false
            }
        }
        if (index >= 0) {
            output.fraction = lower;
            output.normal = b2Mul_r_v2(xf.q, this.m_normals[index]);
            return true
        }
        return false
    },
    ComputeAABB: function (aabb, xf, childIndex) {
        var lowerx = (xf.q.c * this.m_vertices[0].x - xf.q.s * this.m_vertices[0].y) + xf.p.x;
        var lowery = (xf.q.s * this.m_vertices[0].x + xf.q.c * this.m_vertices[0].y) + xf.p.y;
        var upperx = lowerx;
        var uppery = lowery;
        for (var i = 1; i < this.m_count; ++i) {
            var vx = (xf.q.c * this.m_vertices[i].x - xf.q.s * this.m_vertices[i].y) + xf.p.x;
            var vy = (xf.q.s * this.m_vertices[i].x + xf.q.c * this.m_vertices[i].y) + xf.p.y;
            lowerx = b2Min(lowerx, vx);
            lowery = b2Min(lowery, vy);
            upperx = b2Max(upperx, vx);
            uppery = b2Max(uppery, vy)
        }
        aabb.lowerBound.x = lowerx - this.m_radius;
        aabb.lowerBound.y = lowery - this.m_radius;
        aabb.upperBound.x = upperx + this.m_radius;
        aabb.upperBound.y = uppery + this.m_radius
    },
    ComputeMass: function (massData, density) {
        var center = new b2Vec2(0, 0);
        var area = 0;
        var I = 0;
        var s = new b2Vec2(0, 0);
        for (var i = 0; i < this.m_count; ++i) {
            s.Add(this.m_vertices[i])
        }
        s.Multiply(1 / this.m_count);
        var k_inv3 = 1 / 3;
        for (var i = 0; i < this.m_count; ++i) {
            var e1 = b2Vec2.Subtract(this.m_vertices[i], s);
            var e2 = i + 1 < this.m_count ? b2Vec2.Subtract(this.m_vertices[i + 1], s) : b2Vec2.Subtract(this.m_vertices[0], s);
            var D = b2Cross_v2_v2(e1, e2);
            var triangleArea = 0.5 * D;
            area += triangleArea;
            center.Add(b2Vec2.Multiply(triangleArea * k_inv3, b2Vec2.Add(e1, e2)));
            var ex1 = e1.x,
                ey1 = e1.y;
            var ex2 = e2.x,
                ey2 = e2.y;
            var intx2 = ex1 * ex1 + ex2 * ex1 + ex2 * ex2;
            var inty2 = ey1 * ey1 + ey2 * ey1 + ey2 * ey2;
            I += (0.25 * k_inv3 * D) * (intx2 + inty2)
        }
        massData.mass = density * area;
        center.Multiply(1 / area);
        massData.center = b2Vec2.Add(center, s);
        massData.I = density * I;
        massData.I += massData.mass * (b2Dot_v2_v2(massData.center, massData.center) - b2Dot_v2_v2(center, center))
    },
    GetVertexCount: function () {
        return this.m_count
    },
    GetVertex: function (index) {
        return this.m_vertices[index]
    },
    Validate: function () {
        for (var i = 0; i < this.m_count; ++i) {
            var i1 = i;
            var i2 = i < this.m_count - 1 ? i1 + 1 : 0;
            var p = this.m_vertices[i1];
            var e = b2Vec2.Subtract(this.m_vertices[i2], p);
            for (var j = 0; j < this.m_count; ++j) {
                if (j == i1 || j == i2) {
                    continue
                }
                var v = b2Vec2.Subtract(this.m_vertices[j], p);
                var c = b2Cross_v2_v2(e, v);
                if (c < 0) {
                    return false
                }
            }
        }
        return true
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.m_count = this.m_count;
        obj.m_centroid = this.m_centroid._serialize();
        obj.m_vertices = [];
        obj.m_normals = [];
        for (var i = 0; i < this.m_count; ++i) {
            obj.m_vertices.push(this.m_vertices[i]._serialize());
            obj.m_normals.push(this.m_normals[i]._serialize())
        }
        return obj
    },
    _deserialize: function (data) {
        this.parent.prototype._deserialize.call(this, data);
        this.m_count = data.m_count;
        this.m_centroid._deserialize(data.m_centroid);
        this.m_vertices = [];
        this.m_normals = [];
        for (var i = 0; i < this.m_count; ++i) {
            this.m_vertices[i] = new b2Vec2();
            this.m_vertices[i]._deserialize(data.m_vertices[i]);
            this.m_normals[i] = new b2Vec2();
            this.m_normals[i]._deserialize(data.m_normals[i])
        }
    }
};
b2PolygonShape.ComputeCentroid = function (vs, count) {
    var c = new b2Vec2();
    var area = 0;
    var pRef = new b2Vec2(0, 0);
    var inv3 = 1 / 3;
    for (var i = 0; i < count; ++i) {
        var p1 = pRef;
        var p2 = vs[i];
        var p3 = i + 1 < count ? vs[i + 1] : vs[0];
        var e1 = b2Vec2.Subtract(p2, p1);
        var e2 = b2Vec2.Subtract(p3, p1);
        var D = b2Cross_v2_v2(e1, e2);
        var triangleArea = 0.5 * D;
        area += triangleArea;
        c.Add(b2Vec2.Multiply(triangleArea, b2Vec2.Multiply(inv3, b2Vec2.Add(b2Vec2.Add(p1, p2), p3))))
    }
    c.Multiply(1 / area);
    return c
};
b2PolygonShape._extend(b2Shape);
"use strict";

function b2Pair() {
    this.proxyIdA = 0;
    this.proxyIdB = 0
}

function b2PairLessThan(pair1, pair2) {
    if (pair1.proxyIdA == pair2.proxyIdA) {
        return pair1.proxyIdB - pair2.proxyIdB
    }
    return pair1.proxyIdA - pair2.proxyIdA
}

function b2BroadPhase() {
    this.m_tree = new b2DynamicTree();
    this.m_queryProxyId = 0;
    this.m_proxyCount = 0;
    this.m_pairCount = 0;
    this.m_pairBuffer = [];
    this.m_moveCount = 0;
    this.m_moveBuffer = []
}
b2BroadPhase.prototype = {
    CreateProxy: function (aabb, userData) {
        var proxyId = this.m_tree.CreateProxy(aabb, userData);
        ++this.m_proxyCount;
        this.BufferMove(proxyId);
        return proxyId
    },
    DestroyProxy: function (proxyId) {
        this.UnBufferMove(proxyId);
        --this.m_proxyCount;
        this.m_tree.DestroyProxy(proxyId)
    },
    MoveProxy: function (proxyId, aabb, displacement) {
        var buffer = this.m_tree.MoveProxy(proxyId, aabb, displacement);
        if (buffer) {
            this.BufferMove(proxyId)
        }
    },
    TouchProxy: function (proxyId) {
        this.BufferMove(proxyId)
    },
    GetFatAABB: function (proxyId) {
        return this.m_tree.GetFatAABB(proxyId)
    },
    GetUserData: function (proxyId) {
        return this.m_tree.GetUserData(proxyId)
    },
    TestOverlap: function (proxyIdA, proxyIdB) {
        var aabbA = this.m_tree.GetFatAABB(proxyIdA);
        var aabbB = this.m_tree.GetFatAABB(proxyIdB);
        return b2TestOverlap(aabbA, aabbB)
    },
    GetProxyCount: function () {
        return this.m_proxyCount
    },
    UpdatePairs: function (callback) {
        this.m_pairCount = 0;
        this.m_pairBuffer.length = 0;
        for (var i = 0; i < this.m_moveCount; ++i) {
            this.m_queryProxyId = this.m_moveBuffer[i];
            if (this.m_queryProxyId == b2BroadPhase.e_nullProxy) {
                continue
            }
            var fatAABB = this.m_tree.GetFatAABB(this.m_queryProxyId);
            this.m_tree.Query(this, fatAABB)
        }
        this.m_moveCount = 0;
        this.m_pairBuffer.sort(b2PairLessThan);
        var i = 0;
        while (i < this.m_pairCount) {
            var primaryPair = this.m_pairBuffer[i];
            var userDataA = this.m_tree.GetUserData(primaryPair.proxyIdA);
            var userDataB = this.m_tree.GetUserData(primaryPair.proxyIdB);
            callback.AddPair(userDataA, userDataB);
            ++i;
            while (i < this.m_pairCount) {
                var pair = this.m_pairBuffer[i];
                if (pair.proxyIdA != primaryPair.proxyIdA || pair.proxyIdB != primaryPair.proxyIdB) {
                    break
                }++i
            }
        }
    },
    Query: function (callback, aabb) {
        this.m_tree.Query(callback, aabb)
    },
    RayCast: function (callback, input) {
        this.m_tree.RayCast(callback, input)
    },
    GetTreeHeight: function () {
        return this.m_tree.GetHeight()
    },
    GetTreeBalance: function () {
        return this.m_tree.GetMaxBalance()
    },
    GetTreeQuality: function () {
        return this.m_tree.GetAreaRatio()
    },
    ShiftOrigin: function (newOrigin) {
        this.m_tree.ShiftOrigin(newOrigin)
    },
    BufferMove: function (proxyId) {
        this.m_moveBuffer[this.m_moveCount] = proxyId;
        ++this.m_moveCount
    },
    UnBufferMove: function (proxyId) {
        for (var i = 0; i < this.m_moveCount; ++i) {
            if (this.m_moveBuffer[i] == proxyId) {
                this.m_moveBuffer[i] = b2BroadPhase.e_nullProxy
            }
        }
    },
    QueryCallback: function (proxyId) {
        if (proxyId == this.m_queryProxyId) {
            return true
        }
        this.m_pairBuffer[this.m_pairCount] = new b2Pair();
        this.m_pairBuffer[this.m_pairCount].proxyIdA = b2Min(proxyId, this.m_queryProxyId);
        this.m_pairBuffer[this.m_pairCount].proxyIdB = b2Max(proxyId, this.m_queryProxyId);
        ++this.m_pairCount;
        return true
    }
};
b2BroadPhase.e_nullProxy = -1;
"use strict";

function b2DistanceProxy() {
    this.m_vertices = null;
    this.m_count = 0;
    this.m_radius = 0
}
b2DistanceProxy.prototype = {
    Assign: function (l) {
        this.m_vertices = l.m_vertices;
        this.m_count = l.m_count;
        this.m_radius = l.m_radius
    },
    Set: function (shape, index) {
        switch (shape.GetType()) {
            case b2Shape.e_circle:
                var circle = shape;
                this.m_vertices = [circle.m_p];
                this.m_count = 1;
                this.m_radius = circle.m_radius;
                break;
            case b2Shape.e_polygon:
                var polygon = shape;
                this.m_vertices = polygon.m_vertices;
                this.m_count = polygon.m_count;
                this.m_radius = polygon.m_radius;
                break;
            case b2Shape.e_chain:
                var chain = shape;
                this.m_vertices = [chain.m_vertices[index]];
                if (index + 1 < chain.m_count) {
                    this.m_vertices[1] = chain.m_vertices[index + 1]
                } else {
                    this.m_vertices[1] = chain.m_vertices[0]
                }
                this.m_count = 2;
                this.m_radius = chain.m_radius;
                break;
            case b2Shape.e_edge:
                var edge = shape;
                this.m_vertices = [edge.m_vertex1, edge.m_vertex2];
                this.m_count = 2;
                this.m_radius = edge.m_radius;
                break
        }
    },
    GetSupport: function (dx, dy) {
        var bestIndex = 0;
        var bestValue = this.m_vertices[0].x * dx + this.m_vertices[0].y * dy;
        for (var i = 1; i < this.m_count; ++i) {
            var value = this.m_vertices[i].x * dx + this.m_vertices[i].y * dy;
            if (value > bestValue) {
                bestIndex = i;
                bestValue = value
            }
        }
        return bestIndex
    },
    GetSupportVertex: function (dx, dy) {
        return this.m_vertices[this.GetSupport(dx, dy)]
    },
    GetVertexCount: function () {
        return this.m_count
    },
    GetVertex: function (index) {
        return this.m_vertices[index]
    }
};

function b2SimplexCache() {
    this.metric = 0;
    this.count = 0;
    this.indexA = [0, 0, 0];
    this.indexB = [0, 0, 0]
}

function b2DistanceInput() {
    this.proxyA = new b2DistanceProxy();
    this.proxyB = new b2DistanceProxy();
    this.transformA = new b2Transform();
    this.transformB = new b2Transform();
    this.useRadii = false
}

function b2DistanceOutput() {
    this.pointA = new b2Vec2();
    this.pointB = new b2Vec2();
    this.distance = 0;
    this.iterations = 0
}

function b2SimplexVertex() {
    this.wA = new b2Vec2();
    this.wB = new b2Vec2();
    this.w = new b2Vec2();
    this.a = 0;
    this.indexA = 0;
    this.indexB = 0
}
b2SimplexVertex.prototype = {
    Assign: function (l) {
        this.wA.x = l.wA.x;
        this.wA.y = l.wA.y;
        this.wB.x = l.wB.x;
        this.wB.y = l.wB.y;
        this.w.x = l.w.x;
        this.w.y = l.w.y;
        this.a = l.a;
        this.indexA = l.indexA;
        this.indexB = l.indexB
    }
};

function b2Simplex() {
    this.m_v = [new b2SimplexVertex(), new b2SimplexVertex(), new b2SimplexVertex()];
    this.m_count = 0
}
b2Simplex.prototype = {
    ReadCache: function (cache, proxyA, transformA, proxyB, transformB) {
        this.m_count = cache.count;
        var vertices = this.m_v;
        for (var i = 0; i < this.m_count; ++i) {
            var v = vertices[i];
            v.indexA = cache.indexA[i];
            v.indexB = cache.indexB[i];
            var wALocal = proxyA.GetVertex(v.indexA);
            var wBLocal = proxyB.GetVertex(v.indexB);
            v.wA.x = (transformA.q.c * wALocal.x - transformA.q.s * wALocal.y) + transformA.p.x;
            v.wA.y = (transformA.q.s * wALocal.x + transformA.q.c * wALocal.y) + transformA.p.y;
            v.wB.x = (transformB.q.c * wBLocal.x - transformB.q.s * wBLocal.y) + transformB.p.x;
            v.wB.y = (transformB.q.s * wBLocal.x + transformB.q.c * wBLocal.y) + transformB.p.y;
            v.w.x = v.wB.x - v.wA.x;
            v.w.y = v.wB.y - v.wA.y;
            v.a = 0
        }
        if (this.m_count > 1) {
            var metric1 = cache.metric;
            var metric2 = this.GetMetric();
            if (metric2 < 0.5 * metric1 || 2 * metric1 < metric2 || metric2 < b2_epsilon) {
                this.m_count = 0
            }
        }
        if (this.m_count == 0) {
            var v = vertices[0];
            v.indexA = 0;
            v.indexB = 0;
            var wALocal = proxyA.GetVertex(0);
            var wBLocal = proxyB.GetVertex(0);
            v.wA.x = (transformA.q.c * wALocal.x - transformA.q.s * wALocal.y) + transformA.p.x;
            v.wA.y = (transformA.q.s * wALocal.x + transformA.q.c * wALocal.y) + transformA.p.y;
            v.wB.x = (transformB.q.c * wBLocal.x - transformB.q.s * wBLocal.y) + transformB.p.x;
            v.wB.y = (transformB.q.s * wBLocal.x + transformB.q.c * wBLocal.y) + transformB.p.y;
            v.w.x = v.wB.x - v.wA.x;
            v.w.y = v.wB.y - v.wA.y;
            v.a = 1;
            this.m_count = 1
        }
    },
    WriteCache: function (cache) {
        cache.metric = this.GetMetric();
        cache.count = this.m_count;
        var vertices = this.m_v;
        for (var i = 0; i < this.m_count; ++i) {
            cache.indexA[i] = vertices[i].indexA;
            cache.indexB[i] = vertices[i].indexB
        }
    },
    GetSearchDirection: function (p) {
        switch (this.m_count) {
            case 1:
                p.x = -this.m_v[0].w.x;
                p.y = -this.m_v[0].w.y;
                break;
            case 2:
                var e12x = this.m_v[1].w.x - this.m_v[0].w.x;
                var e12y = this.m_v[1].w.y - this.m_v[0].w.y;
                var sgn = e12x * -this.m_v[0].w.y - e12y * -this.m_v[0].w.x;
                if (sgn > 0) {
                    p.x = -1 * e12y;
                    p.y = 1 * e12x
                } else {
                    p.x = 1 * e12y;
                    p.y = -1 * e12x
                }
                break
        }
    },
    GetClosestPoint: function (p) {
        switch (this.m_count) {
            case 1:
                p.x = this.m_v[0].w.x;
                p.y = this.m_v[0].w.y;
                break;
            case 2:
                p.x = (this.m_v[0].a * this.m_v[0].w.x) + (this.m_v[1].a * this.m_v[1].w.x);
                p.y = (this.m_v[0].a * this.m_v[0].w.y) + (this.m_v[1].a * this.m_v[1].w.y);
                break;
            case 3:
                p.x = p.y = 0;
                break
        }
    },
    GetWitnessPoints: function (pA, pB) {
        switch (this.m_count) {
            case 1:
                pA.x = this.m_v[0].wA.x;
                pA.y = this.m_v[0].wA.y;
                pB.x = this.m_v[0].wB.x;
                pB.y = this.m_v[0].wB.y;
                break;
            case 2:
                pA.x = (this.m_v[0].a * this.m_v[0].wA.x) + (this.m_v[1].a * this.m_v[1].wA.x);
                pA.y = (this.m_v[0].a * this.m_v[0].wA.y) + (this.m_v[1].a * this.m_v[1].wA.y);
                pB.x = (this.m_v[0].a * this.m_v[0].wB.x) + (this.m_v[1].a * this.m_v[1].wB.x);
                pB.y = (this.m_v[0].a * this.m_v[0].wB.y) + (this.m_v[1].a * this.m_v[1].wB.y);
                break;
            case 3:
                pA.x = (this.m_v[0].a, this.m_v[0].wA.x) + (this.m_v[1].a, this.m_v[1].wA.x) + (this.m_v[2].a, this.m_v[2].wA.x);
                pA.y = (this.m_v[0].a, this.m_v[0].wA.y) + (this.m_v[1].a, this.m_v[1].wA.y) + (this.m_v[2].a, this.m_v[2].wA.y);
                pB.x = pA.x;
                pB.y = pA.y;
                break
        }
    },
    GetMetric: function () {
        switch (this.m_count) {
            case 1:
                return 0;
            case 2:
                return b2Distance(this.m_v[0].w, this.m_v[1].w);
            case 3:
                return (this.m_v[1].w.x - this.m_v[0].w.x) * (this.m_v[2].w.y - this.m_v[0].w.y) - (this.m_v[1].w.y - this.m_v[0].w.y) * (this.m_v[2].w.x - this.m_v[0].w.x)
        }
    },
    Solve2: function () {
        var w1 = this.m_v[0].w;
        var w2 = this.m_v[1].w;
        var e12x = w2.x - w1.x;
        var e12y = w2.y - w1.y;
        var d12_2 = -(w1.x * e12x + w1.y * e12y);
        if (d12_2 <= 0) {
            this.m_v[0].a = 1;
            this.m_count = 1;
            return
        }
        var d12_1 = w2.x * e12x + w2.y * e12y;
        if (d12_1 <= 0) {
            this.m_v[1].a = 1;
            this.m_count = 1;
            this.m_v[0].Assign(this.m_v[1]);
            return
        }
        var inv_d12 = 1 / (d12_1 + d12_2);
        this.m_v[0].a = d12_1 * inv_d12;
        this.m_v[1].a = d12_2 * inv_d12;
        this.m_count = 2
    },
    Solve3: function () {
        var w1 = this.m_v[0].w;
        var w2 = this.m_v[1].w;
        var w3 = this.m_v[2].w;
        var e12x = w2.x - w1.x;
        var e12y = w2.y - w1.y;
        var w1e12 = w1.x * e12x + w1.y * e12y;
        var w2e12 = w2.x * e12x + w2.y * e12y;
        var d12_1 = w2e12;
        var d12_2 = -w1e12;
        var e13x = w3.x - w1.x;
        var e13y = w3.y - w1.y;
        var w1e13 = w1.x * e13x + w1.y * e13y;
        var w3e13 = w3.x * e13x + w3.y * e13y;
        var d13_1 = w3e13;
        var d13_2 = -w1e13;
        var e23x = w3.x - w2.x;
        var e23y = w3.y - w2.y;
        var w2e23 = w2.x * e23x + w2.y * e23y;
        var w3e23 = w3.x * e23x + w3.y * e23y;
        var d23_1 = w3e23;
        var d23_2 = -w2e23;
        var n123 = e12x * e13y - e12y * e13x;
        var d123_1 = n123 * (w2.x * w3.y - w2.y * w3.x);
        var d123_2 = n123 * (w3.x * w1.y - w3.y * w1.x);
        var d123_3 = n123 * (w1.x * w2.y - w1.y * w2.x);
        if (d12_2 <= 0 && d13_2 <= 0) {
            this.m_v[0].a = 1;
            this.m_count = 1;
            return
        }
        if (d12_1 > 0 && d12_2 > 0 && d123_3 <= 0) {
            var inv_d12 = 1 / (d12_1 + d12_2);
            this.m_v[0].a = d12_1 * inv_d12;
            this.m_v[1].a = d12_2 * inv_d12;
            this.m_count = 2;
            return
        }
        if (d13_1 > 0 && d13_2 > 0 && d123_2 <= 0) {
            var inv_d13 = 1 / (d13_1 + d13_2);
            this.m_v[0].a = d13_1 * inv_d13;
            this.m_v[2].a = d13_2 * inv_d13;
            this.m_count = 2;
            this.m_v[1].Assign(this.m_v[2]);
            return
        }
        if (d12_1 <= 0 && d23_2 <= 0) {
            this.m_v[1].a = 1;
            this.m_count = 1;
            this.m_v[0].Assign(this.m_v[1]);
            return
        }
        if (d13_1 <= 0 && d23_1 <= 0) {
            this.m_v[2].a = 1;
            this.m_count = 1;
            this.m_v[0].Assign(this.m_v[2]);
            return
        }
        if (d23_1 > 0 && d23_2 > 0 && d123_1 <= 0) {
            var inv_d23 = 1 / (d23_1 + d23_2);
            this.m_v[1].a = d23_1 * inv_d23;
            this.m_v[2].a = d23_2 * inv_d23;
            this.m_count = 2;
            this.m_v[0].Assign(this.m_v[2]);
            return
        }
        var inv_d123 = 1 / (d123_1 + d123_2 + d123_3);
        this.m_v[0].a = d123_1 * inv_d123;
        this.m_v[1].a = d123_2 * inv_d123;
        this.m_v[2].a = d123_3 * inv_d123;
        this.m_count = 3
    }
};
var _b2Distance_simplex = new b2Simplex();
var _b2Distance_normal = new b2Vec2();
var _b2Distance_p = new b2Vec2();

function b2DistanceFunc(output, cache, input) {
    ++b2DistanceFunc.b2_gjkCalls;
    var proxyA = input.proxyA;
    var proxyB = input.proxyB;
    var transformA = input.transformA;
    var transformB = input.transformB;
    _b2Distance_simplex.ReadCache(cache, proxyA, transformA, proxyB, transformB);
    var vertices = _b2Distance_simplex.m_v;
    var k_maxIters = 20;
    var saveA = [0, 0, 0],
        saveB = [0, 0, 0];
    var saveCount = 0;
    var distanceSqr1 = b2_maxFloat;
    var distanceSqr2 = distanceSqr1;
    var iter = 0;
    while (iter < k_maxIters) {
        saveCount = _b2Distance_simplex.m_count;
        for (var i = 0; i < saveCount; ++i) {
            saveA[i] = vertices[i].indexA;
            saveB[i] = vertices[i].indexB
        }
        switch (_b2Distance_simplex.m_count) {
            case 1:
                break;
            case 2:
                _b2Distance_simplex.Solve2();
                break;
            case 3:
                _b2Distance_simplex.Solve3();
                break
        }
        if (_b2Distance_simplex.m_count == 3) {
            break
        }
        _b2Distance_simplex.GetClosestPoint(_b2Distance_p);
        distanceSqr2 = _b2Distance_p.LengthSquared();
        if (distanceSqr2 >= distanceSqr1) {}
        distanceSqr1 = distanceSqr2;
        _b2Distance_simplex.GetSearchDirection(_b2Distance_p);
        if (_b2Distance_p.LengthSquared() < b2_epsilon * b2_epsilon) {
            break
        }
        var vertex = vertices[_b2Distance_simplex.m_count];
        vertex.indexA = proxyA.GetSupport(transformA.q.c * -_b2Distance_p.x + transformA.q.s * -_b2Distance_p.y, -transformA.q.s * -_b2Distance_p.x + transformA.q.c * -_b2Distance_p.y);
        var pva = proxyA.GetVertex(vertex.indexA);
        vertex.wA.x = (transformA.q.c * pva.x - transformA.q.s * pva.y) + transformA.p.x;
        vertex.wA.y = (transformA.q.s * pva.x + transformA.q.c * pva.y) + transformA.p.y;
        vertex.indexB = proxyB.GetSupport(transformB.q.c * _b2Distance_p.x + transformB.q.s * _b2Distance_p.y, -transformB.q.s * _b2Distance_p.x + transformB.q.c * _b2Distance_p.y);
        var pvb = proxyB.GetVertex(vertex.indexB);
        vertex.wB.x = (transformB.q.c * pvb.x - transformB.q.s * pvb.y) + transformB.p.x;
        vertex.wB.y = (transformB.q.s * pvb.x + transformB.q.c * pvb.y) + transformB.p.y;
        vertex.w.x = vertex.wB.x - vertex.wA.x;
        vertex.w.y = vertex.wB.y - vertex.wA.y;
        ++iter;
        ++b2DistanceFunc.b2_gjkIters;
        var duplicate = false;
        for (var i = 0; i < saveCount; ++i) {
            if (vertex.indexA == saveA[i] && vertex.indexB == saveB[i]) {
                duplicate = true;
                break
            }
        }
        if (duplicate) {
            break
        }++_b2Distance_simplex.m_count
    }
    b2DistanceFunc.b2_gjkMaxIters = b2Max(b2DistanceFunc.b2_gjkMaxIters, iter);
    _b2Distance_simplex.GetWitnessPoints(output.pointA, output.pointB);
    output.distance = b2Distance(output.pointA, output.pointB);
    output.iterations = iter;
    _b2Distance_simplex.WriteCache(cache);
    if (input.useRadii) {
        var rA = proxyA.m_radius;
        var rB = proxyB.m_radius;
        if (output.distance > rA + rB && output.distance > b2_epsilon) {
            output.distance -= rA + rB;
            _b2Distance_normal.x = output.pointB.x - output.pointA.x;
            _b2Distance_normal.y = output.pointB.y - output.pointA.y;
            _b2Distance_normal.Normalize();
            output.pointA.x += (rA * _b2Distance_normal.x);
            output.pointA.y += (rA * _b2Distance_normal.y);
            output.pointB.x -= (rB * _b2Distance_normal.x);
            output.pointB.y -= (rB * _b2Distance_normal.y)
        } else {
            var px = (0.5 * (output.pointA.x + output.pointB.x));
            var py = (0.5 * (output.pointA.y + output.pointB.y));
            output.pointA.x = px;
            output.pointA.y = py;
            output.pointB.x = px;
            output.pointB.y = py;
            output.distance = 0
        }
    }
}
b2DistanceFunc.b2_gjkCalls = 0;
b2DistanceFunc.b2_gjkIters = 0;
b2DistanceFunc.b2_gjkMaxIters = 0;
"use strict";
var b2_nullFeature = 255;

function b2ContactID() {}
b2ContactID.prototype = {
    indexA: 0,
    indexB: 0,
    typeA: 0,
    typeB: 0,
    Reset: function () {
        this.indexA = this.indexB = this.typeA = this.typeB = 0
    },
    Get: function () {
        return this.indexA | (this.indexB << 8) | (this.typeA << 16) | (this.typeB << 24)
    },
    Assign: function (k) {
        this.indexA = k.indexA;
        this.indexB = k.indexB;
        this.typeA = k.typeA;
        this.typeB = k.typeB
    }
};
b2ContactID.e_vertex = 0;
b2ContactID.e_face = 1;

function b2ManifoldPoint() {
    this.localPoint = new b2Vec2();
    this.normalImpulse = 0;
    this.tangentImpulse = 0;
    this.id = new b2ContactID()
}
b2ManifoldPoint.prototype = {
    Clone: function () {
        var point = new b2ManifoldPoint();
        point.localPoint.x = this.localPoint.x;
        point.localPoint.y = this.localPoint.y;
        point.normalImpulse = this.normalImpulse;
        point.tangentImpulse = this.tangentImpulse;
        point.id.Assign(this.id);
        return point
    }
};

function b2Manifold() {
    this.points = new Array(b2_maxManifoldPoints);
    this.localNormal = new b2Vec2();
    this.localPoint = new b2Vec2();
    this.type = 0;
    this.pointCount = 0
}
b2Manifold.prototype = {
    Clone: function () {
        var manifold = new b2Manifold();
        manifold.pointCount = this.pointCount;
        manifold.type = this.type;
        manifold.localPoint.x = this.localPoint.x;
        manifold.localPoint.y = this.localPoint.y;
        manifold.localNormal.x = this.localNormal.x;
        manifold.localNormal.y = this.localNormal.y;
        for (var i = 0; i < this.pointCount; ++i) {
            manifold.points[i] = this.points[i].Clone()
        }
        return manifold
    },
    Assign: function (manifold) {
        this.pointCount = manifold.pointCount;
        this.type = manifold.type;
        this.localPoint.x = manifold.localPoint.x;
        this.localPoint.y = manifold.localPoint.y;
        this.localNormal.x = manifold.localNormal.x;
        this.localNormal.y = manifold.localNormal.y;
        for (var i = 0; i < this.pointCount; ++i) {
            this.points[i] = manifold.points[i].Clone()
        }
    }
};
b2Manifold.e_circles = 0;
b2Manifold.e_faceA = 1;
b2Manifold.e_faceB = 2;
b2Manifold.b2_nullState = 0;
b2Manifold.b2_addState = 1;
b2Manifold.b2_persistState = 2;
b2Manifold.b2_removeState = 3;

function b2WorldManifold() {
    this.normal = new b2Vec2();
    this.points = new Array(b2_maxManifoldPoints);
    this.separations = new Array(b2_maxManifoldPoints)
}
b2WorldManifold.prototype = {
    Initialize: function (manifold, xfA, radiusA, xfB, radiusB) {
        if (manifold.pointCount == 0) {
            return
        }
        switch (manifold.type) {
            case b2Manifold.e_circles:
                this.normal.x = 1;
                this.normal.y = 0;
                var pointAx = (xfA.q.c * manifold.localPoint.x - xfA.q.s * manifold.localPoint.y) + xfA.p.x;
                var pointAy = (xfA.q.s * manifold.localPoint.x + xfA.q.c * manifold.localPoint.y) + xfA.p.y;
                var pointBx = (xfB.q.c * manifold.points[0].localPoint.x - xfB.q.s * manifold.points[0].localPoint.y) + xfB.p.x;
                var pointBy = (xfB.q.s * manifold.points[0].localPoint.x + xfB.q.c * manifold.points[0].localPoint.y) + xfB.p.y;
                var cx = pointAx - pointBx;
                var cy = pointAy - pointBy;
                if ((cx * cx + cy * cy) > b2_epsilon * b2_epsilon) {
                    this.normal.x = pointBx - pointAx;
                    this.normal.y = pointBy - pointAy;
                    this.normal.Normalize()
                }
                var cAx = pointAx + (radiusA * this.normal.x);
                var cAy = pointAy + (radiusA * this.normal.y);
                var cBx = pointBx - (radiusB * this.normal.x);
                var cBy = pointBy - (radiusB * this.normal.y);
                this.points[0] = new b2Vec2(0.5 * (cAx + cBx), 0.5 * (cAy + cBy));
                this.separations[0] = (cBx - cAx) * this.normal.x + (cBy - cAy) * this.normal.y;
                break;
            case b2Manifold.e_faceA:
                this.normal.x = xfA.q.c * manifold.localNormal.x - xfA.q.s * manifold.localNormal.y;
                this.normal.y = xfA.q.s * manifold.localNormal.x + xfA.q.c * manifold.localNormal.y;
                var planePointx = (xfA.q.c * manifold.localPoint.x - xfA.q.s * manifold.localPoint.y) + xfA.p.x;
                var planePointy = (xfA.q.s * manifold.localPoint.x + xfA.q.c * manifold.localPoint.y) + xfA.p.y;
                for (var i = 0; i < manifold.pointCount; ++i) {
                    var clipPointx = (xfB.q.c * manifold.points[i].localPoint.x - xfB.q.s * manifold.points[i].localPoint.y) + xfB.p.x;
                    var clipPointy = (xfB.q.s * manifold.points[i].localPoint.x + xfB.q.c * manifold.points[i].localPoint.y) + xfB.p.y;
                    var d = (clipPointx - planePointx) * this.normal.x + (clipPointy - planePointy) * this.normal.y;
                    var cAx = clipPointx + ((radiusA - d) * this.normal.x);
                    var cAy = clipPointy + ((radiusA - d) * this.normal.y);
                    var cBx = (clipPointx - (radiusB * this.normal.x));
                    var cBy = (clipPointy - (radiusB * this.normal.y));
                    this.points[i] = new b2Vec2(0.5 * (cAx + cBx), 0.5 * (cAy + cBy));
                    this.separations[i] = (cBx - cAx) * this.normal.x + (cBy - cAy) * this.normal.y
                }
                break;
            case b2Manifold.e_faceB:
                this.normal.x = xfB.q.c * manifold.localNormal.x - xfB.q.s * manifold.localNormal.y;
                this.normal.y = xfB.q.s * manifold.localNormal.x + xfB.q.c * manifold.localNormal.y;
                var planePointx = (xfB.q.c * manifold.localPoint.x - xfB.q.s * manifold.localPoint.y) + xfB.p.x;
                var planePointy = (xfB.q.s * manifold.localPoint.x + xfB.q.c * manifold.localPoint.y) + xfB.p.y;
                for (var i = 0; i < manifold.pointCount; ++i) {
                    var clipPointx = (xfA.q.c * manifold.points[i].localPoint.x - xfA.q.s * manifold.points[i].localPoint.y) + xfA.p.x;
                    var clipPointy = (xfA.q.s * manifold.points[i].localPoint.x + xfA.q.c * manifold.points[i].localPoint.y) + xfA.p.y;
                    var d = (clipPointx - planePointx) * this.normal.x + (clipPointy - planePointy) * this.normal.y;
                    var cBx = clipPointx + ((radiusB - d) * this.normal.x);
                    var cBy = clipPointy + ((radiusB - d) * this.normal.y);
                    var cAx = (clipPointx - (radiusA * this.normal.x));
                    var cAy = (clipPointy - (radiusA * this.normal.y));
                    this.points[i] = new b2Vec2(0.5 * (cAx + cBx), 0.5 * (cAy + cBy));
                    this.separations[i] = (cAx - cBx) * this.normal.x + (cAy - cBy) * this.normal.y
                }
                this.normal.x = -this.normal.x;
                this.normal.y = -this.normal.y;
                break
        }
    }
};

function b2GetPointStates(state1, state2, manifold1, manifold2) {
    for (var i = 0; i < b2_maxManifoldPoints; ++i) {
        state1[i] = b2Manifold.b2_nullState;
        state2[i] = b2Manifold.b2_nullState
    }
    for (var i = 0; i < manifold1.pointCount; ++i) {
        var id = manifold1.points[i].id;
        state1[i] = b2Manifold.b2_removeState;
        for (var j = 0; j < manifold2.pointCount; ++j) {
            if (manifold2.points[j].id.Get() == id.Get()) {
                state1[i] = b2Manifold.b2_persistState;
                break
            }
        }
    }
    for (var i = 0; i < manifold2.pointCount; ++i) {
        var id = manifold2.points[i].id;
        state2[i] = b2Manifold.b2_addState;
        for (var j = 0; j < manifold1.pointCount; ++j) {
            if (manifold1.points[j].id.Get() == id.Get()) {
                state2[i] = b2Manifold.b2_persistState;
                break
            }
        }
    }
}

function b2ClipVertex() {
    this.v = new b2Vec2();
    this.id = new b2ContactID()
}

function b2RayCastInput() {
    this.p1 = new b2Vec2(), this.p2 = new b2Vec2();
    this.maxFraction = 0
}

function b2RayCastOutput() {
    this.normal = new b2Vec2();
    this.fraction = 0
}

function b2AABB() {
    this.lowerBound = new b2Vec2();
    this.upperBound = new b2Vec2()
}
b2AABB.prototype = {
    Assign: function (other) {
        this.lowerBound.x = other.lowerBound.x;
        this.lowerBound.y = other.lowerBound.y;
        this.upperBound.x = other.upperBound.x;
        this.upperBound.y = other.upperBound.y
    },
    Clone: function () {
        var clone = new b2AABB();
        clone.lowerBound.x = this.lowerBound.x;
        clone.lowerBound.y = this.lowerBound.y;
        clone.lowerBound.x = this.lowerBound.x;
        clone.lowerBound.y = this.lowerBound.y;
        return clone
    },
    IsValid: function () {
        return (this.upperBound.x - this.lowerBound.x) >= 0 && (this.upperBound.y - this.lowerBound.y) >= 0 && this.lowerBound.IsValid() && this.upperBound.IsValid()
    },
    GetCenter: function () {
        return new b2Vec2(0.5 * (this.lowerBound.x + this.upperBound.x), 0.5 * (this.lowerBound.y + this.upperBound.y))
    },
    GetExtents: function () {
        return new b2Vec2(0.5 * (this.upperBound.x - this.lowerBound.x), 0.5 * (this.upperBound.y - this.lowerBound.y))
    },
    GetPerimeter: function () {
        return 2 * ((this.upperBound.x - this.lowerBound.x) + (this.upperBound.y - this.lowerBound.y))
    },
    Combine: function (aabb1, aabb2) {
        if (aabb2) {
            this.lowerBound.x = b2Min(aabb1.lowerBound.x, aabb2.lowerBound.x);
            this.lowerBound.y = b2Min(aabb1.lowerBound.y, aabb2.lowerBound.y);
            this.upperBound.x = b2Max(aabb1.upperBound.x, aabb2.upperBound.x);
            this.upperBound.y = b2Max(aabb1.upperBound.y, aabb2.upperBound.y)
        } else {
            this.lowerBound.x = b2Min(this.lowerBound.x, aabb1.lowerBound.x);
            this.lowerBound.y = b2Min(this.lowerBound.y, aabb1.lowerBound.y);
            this.upperBound.x = b2Max(this.upperBound.x, aabb1.upperBound.x);
            this.upperBound.y = b2Max(this.upperBound.y, aabb1.upperBound.y)
        }
    },
    Contains: function (aabb) {
        return this.lowerBound.x <= aabb.lowerBound.x && this.lowerBound.y <= aabb.lowerBound.y && aabb.upperBound.x <= this.upperBound.x && aabb.upperBound.y <= this.upperBound.y
    },
    RayCast: function (output, input) {
        var tmin = -b2_maxFloat;
        var tmax = b2_maxFloat;
        var p = input.p1;
        var d = b2Vec2.Subtract(input.p2, input.p1);
        var absD = b2Abs_v2(d);
        var normal = new b2Vec2();
        for (var i = 0; i < 2; ++i) {
            if (absD.get_i(i) < b2_epsilon) {
                if (p.get_i(i) < this.lowerBound.get_i(i) || this.upperBound.get_i(i) < p.get_i(i)) {
                    return false
                }
            } else {
                var inv_d = 1 / d.get_i(i);
                var t1 = (this.lowerBound.get_i(i) - p.get_i(i)) * inv_d;
                var t2 = (this.upperBound.get_i(i) - p.get_i(i)) * inv_d;
                var s = -1;
                if (t1 > t2) {
                    var temp = t2;
                    t2 = t1;
                    t1 = temp;
                    s = 1
                }
                if (t1 > tmin) {
                    normal.x = normal.y = 0;
                    normal.set_i(i, s);
                    tmin = t1
                }
                tmax = b2Min(tmax, t2);
                if (tmin > tmax) {
                    return false
                }
            }
        }
        if (tmin < 0 || input.maxFraction < tmin) {
            return false
        }
        output.fraction = tmin;
        output.normal.x = normal.x;
        output.normal.y = normal.y;
        return true
    }
};

function b2CollideCircles(manifold, circleA, xfA, circleB, xfB) {
    manifold.pointCount = 0;
    var pA = b2Mul_t_v2(xfA, circleA.m_p);
    var pB = b2Mul_t_v2(xfB, circleB.m_p);
    var dx = pB.x - pA.x;
    var dy = pB.y - pA.y;
    var distSqr = dx * dx + dy * dy;
    var rA = circleA.m_radius,
        rB = circleB.m_radius;
    var radius = rA + rB;
    if (distSqr > radius * radius) {
        return
    }
    manifold.type = b2Manifold.e_circles;
    manifold.localPoint.x = circleA.m_p.x;
    manifold.localPoint.y = circleA.m_p.y;
    manifold.localNormal.x = manifold.localNormal.y = 0;
    manifold.pointCount = 1;
    manifold.points[0] = new b2ManifoldPoint();
    manifold.points[0].localPoint.x = circleB.m_p.x;
    manifold.points[0].localPoint.y = circleB.m_p.y;
    manifold.points[0].id.Reset()
}

function b2CollidePolygonAndCircle(manifold, polygonA, xfA, circleB, xfB) {
    manifold.pointCount = 0;
    var c = b2Mul_t_v2(xfB, circleB.m_p);
    var cLocal = b2MulT_t_v2(xfA, c);
    var normalIndex = 0;
    var separation = -b2_maxFloat;
    var radius = polygonA.m_radius + circleB.m_radius;
    var vertexCount = polygonA.m_count;
    var vertices = polygonA.m_vertices;
    var normals = polygonA.m_normals;
    for (var i = 0; i < vertexCount; ++i) {
        var s = normals[i].x * (cLocal.x - vertices[i].x) + normals[i].y * (cLocal.y - vertices[i].y);
        if (s > radius) {
            return
        }
        if (s > separation) {
            separation = s;
            normalIndex = i
        }
    }
    var vertIndex1 = normalIndex;
    var vertIndex2 = vertIndex1 + 1 < vertexCount ? vertIndex1 + 1 : 0;
    var v1 = vertices[vertIndex1];
    var v2 = vertices[vertIndex2];
    if (separation < b2_epsilon) {
        manifold.pointCount = 1;
        manifold.type = b2Manifold.e_faceA;
        manifold.localNormal.x = normals[normalIndex].x;
        manifold.localNormal.y = normals[normalIndex].y;
        manifold.localPoint.x = 0.5 * (v1.x + v2.x);
        manifold.localPoint.y = 0.5 * (v1.y + v2.y);
        manifold.points[0] = new b2ManifoldPoint();
        manifold.points[0].localPoint.x = circleB.m_p.x;
        manifold.points[0].localPoint.y = circleB.m_p.y;
        manifold.points[0].id.Reset();
        return
    }
    var u1 = (cLocal.x - v1.x) * (v2.x - v1.x) + (cLocal.y - v1.y) * (v2.y - v1.y);
    var u2 = (cLocal.x - v2.x) * (v1.x - v2.x) + (cLocal.y - v2.y) * (v1.y - v2.y);
    if (u1 <= 0) {
        if (b2DistanceSquared(cLocal, v1) > radius * radius) {
            return
        }
        manifold.pointCount = 1;
        manifold.type = b2Manifold.e_faceA;
        manifold.localNormal.x = cLocal.x - v1.x;
        manifold.localNormal.y = cLocal.y - v1.y;
        manifold.localNormal.Normalize();
        manifold.localPoint.x = v1.x;
        manifold.localPoint.y = v1.y;
        manifold.points[0] = new b2ManifoldPoint();
        manifold.points[0].localPoint.x = circleB.m_p.x;
        manifold.points[0].localPoint.y = circleB.m_p.y;
        manifold.points[0].id.Reset()
    } else {
        if (u2 <= 0) {
            if (b2DistanceSquared(cLocal, v2) > radius * radius) {
                return
            }
            manifold.pointCount = 1;
            manifold.type = b2Manifold.e_faceA;
            manifold.localNormal.x = cLocal.x - v2.x;
            manifold.localNormal.y = cLocal.y - v2.y;
            manifold.localNormal.Normalize();
            manifold.localPoint.x = v2.x;
            manifold.localPoint.y = v2.y;
            manifold.points[0] = new b2ManifoldPoint();
            manifold.points[0].localPoint.x = circleB.m_p.x;
            manifold.points[0].localPoint.y = circleB.m_p.y;
            manifold.points[0].id.Reset()
        } else {
            var faceCenterx = 0.5 * (v1.x + v2.x);
            var faceCentery = 0.5 * (v1.y + v2.y);
            var separation = (cLocal.x - faceCenterx) * normals[vertIndex1].x + (cLocal.y - faceCentery) * normals[vertIndex1].y;
            if (separation > radius) {
                return
            }
            manifold.pointCount = 1;
            manifold.type = b2Manifold.e_faceA;
            manifold.localNormal.x = normals[vertIndex1].x;
            manifold.localNormal.y = normals[vertIndex1].y;
            manifold.localPoint.x = faceCenterx;
            manifold.localPoint.y = faceCentery;
            manifold.points[0] = new b2ManifoldPoint();
            manifold.points[0].localPoint.x = circleB.m_p.x;
            manifold.points[0].localPoint.y = circleB.m_p.y;
            manifold.points[0].id.Reset()
        }
    }
}

function b2FindMaxSeparation(edgeIndex, poly1, xf1, poly2, xf2) {
    var count1 = poly1.m_count;
    var count2 = poly2.m_count;
    var n1s = poly1.m_normals;
    var v1s = poly1.m_vertices;
    var v2s = poly2.m_vertices;
    var xf = b2MulT_t_t(xf2, xf1);
    var bestIndex = 0;
    var maxSeparation = -b2_maxFloat;
    for (var i = 0; i < count1; ++i) {
        var nx = xf.q.c * n1s[i].x - xf.q.s * n1s[i].y;
        var ny = xf.q.s * n1s[i].x + xf.q.c * n1s[i].y;
        var v1x = (xf.q.c * v1s[i].x - xf.q.s * v1s[i].y) + xf.p.x;
        var v1y = (xf.q.s * v1s[i].x + xf.q.c * v1s[i].y) + xf.p.y;
        var si = b2_maxFloat;
        for (var j = 0; j < count2; ++j) {
            var sij = nx * (v2s[j].x - v1x) + ny * (v2s[j].y - v1y);
            if (sij < si) {
                si = sij
            }
        }
        if (si > maxSeparation) {
            maxSeparation = si;
            bestIndex = i
        }
    }
    edgeIndex[0] = bestIndex;
    return maxSeparation
}

function b2FindIncidentEdge(c, poly1, xf1, edge1, poly2, xf2) {
    var normals1 = poly1.m_normals;
    var count2 = poly2.m_count;
    var vertices2 = poly2.m_vertices;
    var normals2 = poly2.m_normals;
    var t1x = xf1.q.c * normals1[edge1].x - xf1.q.s * normals1[edge1].y;
    var t1y = xf1.q.s * normals1[edge1].x + xf1.q.c * normals1[edge1].y;
    var normal1x = xf2.q.c * t1x + xf2.q.s * t1y;
    var normal1y = -xf2.q.s * t1x + xf2.q.c * t1y;
    var index = 0;
    var minDot = b2_maxFloat;
    for (var i = 0; i < count2; ++i) {
        var dot = normal1x * normals2[i].x + normal1y * normals2[i].y;
        if (dot < minDot) {
            minDot = dot;
            index = i
        }
    }
    var i1 = index;
    var i2 = i1 + 1 < count2 ? i1 + 1 : 0;
    c[0].v.x = (xf2.q.c * vertices2[i1].x - xf2.q.s * vertices2[i1].y) + xf2.p.x;
    c[0].v.y = (xf2.q.s * vertices2[i1].x + xf2.q.c * vertices2[i1].y) + xf2.p.y;
    c[0].id.indexA = edge1;
    c[0].id.indexB = i1;
    c[0].id.typeA = b2ContactID.e_face;
    c[0].id.typeB = b2ContactID.e_vertex;
    c[1].v.x = (xf2.q.c * vertices2[i2].x - xf2.q.s * vertices2[i2].y) + xf2.p.x;
    c[1].v.y = (xf2.q.s * vertices2[i2].x + xf2.q.c * vertices2[i2].y) + xf2.p.y;
    c[1].id.indexA = edge1;
    c[1].id.indexB = i2;
    c[1].id.typeA = b2ContactID.e_face;
    c[1].id.typeB = b2ContactID.e_vertex
}

function b2CollidePolygons(manifold, polyA, xfA, polyB, xfB) {
    manifold.pointCount = 0;
    var totalRadius = polyA.m_radius + polyB.m_radius;
    var edgeA = [0];
    var separationA = b2FindMaxSeparation(edgeA, polyA, xfA, polyB, xfB);
    if (separationA > totalRadius) {
        return
    }
    var edgeB = [0];
    var separationB = b2FindMaxSeparation(edgeB, polyB, xfB, polyA, xfA);
    if (separationB > totalRadius) {
        return
    }
    var poly1;
    var poly2;
    var xf1, xf2;
    var edge1 = 0;
    var flip = 0;
    var k_tol = 0.1 * b2_linearSlop;
    if (separationB > separationA + k_tol) {
        poly1 = polyB;
        poly2 = polyA;
        xf1 = xfB;
        xf2 = xfA;
        edge1 = edgeB[0];
        manifold.type = b2Manifold.e_faceB;
        flip = 1
    } else {
        poly1 = polyA;
        poly2 = polyB;
        xf1 = xfA;
        xf2 = xfB;
        edge1 = edgeA[0];
        manifold.type = b2Manifold.e_faceA;
        flip = 0
    }
    b2FindIncidentEdge(b2CollidePolygons._local_incidentEdges, poly1, xf1, edge1, poly2, xf2);
    var count1 = poly1.m_count;
    var vertices1 = poly1.m_vertices;
    var iv1 = edge1;
    var iv2 = edge1 + 1 < count1 ? edge1 + 1 : 0;
    var v11 = vertices1[iv1];
    var v12 = vertices1[iv2];
    b2CollidePolygons._localTangent.x = v12.x - v11.x;
    b2CollidePolygons._localTangent.y = v12.y - v11.y;
    b2CollidePolygons._localTangent.Normalize();
    var localNormalx = 1 * b2CollidePolygons._localTangent.y;
    var localNormaly = -1 * b2CollidePolygons._localTangent.x;
    var planePointx = 0.5 * (v11.x + v12.x);
    var planePointy = 0.5 * (v11.y + v12.y);
    var tangentx = xf1.q.c * b2CollidePolygons._localTangent.x - xf1.q.s * b2CollidePolygons._localTangent.y;
    var tangenty = xf1.q.s * b2CollidePolygons._localTangent.x + xf1.q.c * b2CollidePolygons._localTangent.y;
    var normalx = 1 * tangenty;
    var normaly = -1 * tangentx;
    v11 = b2Mul_t_v2(xf1, v11);
    v12 = b2Mul_t_v2(xf1, v12);
    var frontOffset = normalx * v11.x + normaly * v11.y;
    var sideOffset1 = -(tangentx * v11.x + tangenty * v11.y) + totalRadius;
    var sideOffset2 = (tangentx * v12.x + tangenty * v12.y) + totalRadius;
    var clipPoints1 = new Array(2);
    var clipPoints2 = new Array(2);
    var np;
    np = b2ClipSegmentToLine(clipPoints1, b2CollidePolygons._local_incidentEdges, -tangentx, -tangenty, sideOffset1, iv1);
    if (np < 2) {
        return
    }
    np = b2ClipSegmentToLine(clipPoints2, clipPoints1, tangentx, tangenty, sideOffset2, iv2);
    if (np < 2) {
        return
    }
    manifold.localNormal.x = localNormalx;
    manifold.localNormal.y = localNormaly;
    manifold.localPoint.x = planePointx;
    manifold.localPoint.y = planePointy;
    var pointCount = 0;
    for (var i = 0; i < b2_maxManifoldPoints; ++i) {
        var separation = (normalx * clipPoints2[i].v.x + normaly * clipPoints2[i].v.y) - frontOffset;
        if (separation <= totalRadius) {
            var cp = manifold.points[pointCount] = new b2ManifoldPoint();
            cp.localPoint.Assign(b2MulT_t_v2(xf2, clipPoints2[i].v));
            cp.id.Assign(clipPoints2[i].id);
            if (flip) {
                var cf = new b2ContactID();
                cf.Assign(cp.id);
                cp.id.indexA = cf.indexB;
                cp.id.indexB = cf.indexA;
                cp.id.typeA = cf.typeB;
                cp.id.typeB = cf.typeA
            }++pointCount
        }
    }
    manifold.pointCount = pointCount
}
b2CollidePolygons._localTangent = new b2Vec2();
b2CollidePolygons._local_incidentEdges = [new b2ClipVertex(), new b2ClipVertex()];

function b2CollideEdgeAndCircle(manifold, edgeA, xfA, circleB, xfB) {
    manifold.pointCount = 0;
    var Q = b2MulT_t_v2(xfA, b2Mul_t_v2(xfB, circleB.m_p));
    var A = edgeA.m_vertex1,
        B = edgeA.m_vertex2;
    var ex = B.x - A.x;
    var ey = B.y - A.y;
    var u = ex * (B.x - Q.x) + ey * (B.y - Q.y);
    var v = ex * (Q.x - A.x) + ey * (Q.y - A.y);
    var radius = edgeA.m_radius + circleB.m_radius;
    var cf = new b2ContactID();
    cf.indexB = 0;
    cf.typeB = b2ContactID.e_vertex;
    if (v <= 0) {
        var P = A;
        var dx = Q.x - P.x;
        var dy = Q.y - P.y;
        var dd = dx * dx + dy * dy;
        if (dd > radius * radius) {
            return
        }
        if (edgeA.m_hasVertex0) {
            var A1 = edgeA.m_vertex0;
            var B1 = A;
            var e1x = B1.x - A1.x;
            var e1y = B1.y - A1.y;
            var u1 = e1x * (B1.x - Q.x) + e1y * (B1.y - Q.y);
            if (u1 > 0) {
                return
            }
        }
        cf.indexA = 0;
        cf.typeA = b2ContactID.e_vertex;
        manifold.pointCount = 1;
        manifold.type = b2Manifold.e_circles;
        manifold.localNormal.x = manifold.localNormal.y = 0;
        manifold.localPoint.x = P.x;
        manifold.localPoint.y = P.y;
        manifold.points[0] = new b2ManifoldPoint();
        manifold.points[0].id.Assign(cf);
        manifold.points[0].localPoint.x = circleB.m_p.x;
        manifold.points[0].localPoint.y = circleB.m_p.y;
        return
    }
    if (u <= 0) {
        var P = B;
        var dx = Q.x - P.x;
        var dy = Q.y - P.y;
        var dd = dx * dx + dy * dy;
        if (dd > radius * radius) {
            return
        }
        if (edgeA.m_hasVertex3) {
            var B2 = edgeA.m_vertex3;
            var A2 = B;
            var e2x = B2.x - A2.x;
            var e2y = B2.y - A2.y;
            var v2 = e2x * (Q.x - A2.x) + e2y * (Q.y - A2.y);
            if (v2 > 0) {
                return
            }
        }
        cf.indexA = 1;
        cf.typeA = b2ContactID.e_vertex;
        manifold.pointCount = 1;
        manifold.type = b2Manifold.e_circles;
        manifold.localNormal.x = manifold.localNormal.y = 0;
        manifold.localPoint.x = P.x;
        manifold.localPoint.y = P.y;
        manifold.points[0] = new b2ManifoldPoint();
        manifold.points[0].id.Assign(cf);
        manifold.points[0].localPoint.x = circleB.m_p.x;
        manifold.points[0].localPoint.y = circleB.m_p.y;
        return
    }
    var den = ex * ex + ey * ey;
    var Px = (1 / den) * ((u * A.x) + (v * B.x));
    var Py = (1 / den) * ((u * A.y) + (v * B.y));
    var dx = Q.x - Px;
    var dy = Q.y - Py;
    var dd = dx * dx + dy * dy;
    if (dd > radius * radius) {
        return
    }
    var nx = -ey;
    var ny = ex;
    if (nx * (Q.x - A.x) + ny * (Q.y - A.y) < 0) {
        nx = -nx;
        ny = -ny
    }
    cf.indexA = 0;
    cf.typeA = b2ContactID.e_face;
    manifold.pointCount = 1;
    manifold.type = b2Manifold.e_faceA;
    manifold.localNormal.x = nx;
    manifold.localNormal.y = ny;
    manifold.localNormal.Normalize();
    manifold.localPoint.x = A.x;
    manifold.localPoint.y = A.y;
    manifold.points[0] = new b2ManifoldPoint();
    manifold.points[0].id.Assign(cf);
    manifold.points[0].localPoint.x = circleB.m_p.x;
    manifold.points[0].localPoint.y = circleB.m_p.y
}

function b2EPAxis() {
    this.type = 0;
    this.index = 0;
    this.separation = 0
}
b2EPAxis.e_unknown = 0;
b2EPAxis.e_edgeA = 1;
b2EPAxis.e_edgeB = 2;

function b2TempPolygon() {
    this.vertices = new Array(b2_maxPolygonVertices);
    this.normals = new Array(b2_maxPolygonVertices);
    this.count = 0
}

function b2ReferenceFace() {
    this.i1 = 0, this.i2 = 0;
    this.v1 = new b2Vec2(), this.v2 = new b2Vec2();
    this.normal = new b2Vec2();
    this.sideNormal1 = new b2Vec2();
    this.sideOffset1 = 0;
    this.sideNormal2 = new b2Vec2();
    this.sideOffset2 = 0
}

function b2EPCollider() {
    this.m_polygonB = new b2TempPolygon();
    this.m_xf = new b2Transform();
    this.m_centroidB = new b2Vec2();
    this.m_v0 = new b2Vec2(), this.m_v1 = new b2Vec2(), this.m_v2 = new b2Vec2(), this.m_v3 = new b2Vec2();
    this.m_normal0 = new b2Vec2(), this.m_normal1 = new b2Vec2(), this.m_normal2 = new b2Vec2();
    this.m_normal = new b2Vec2();
    this.m_type1 = 0, this.m_type2 = 0;
    this.m_lowerLimit = new b2Vec2(), this.m_upperLimit = new b2Vec2();
    this.m_radius = 0;
    this.m_front = false
}
b2EPCollider._temp_edge = new b2Vec2();
b2EPCollider._temp_edge0 = new b2Vec2();
b2EPCollider._temp_edge2 = new b2Vec2();
b2EPCollider.prototype = {
    Collide: function (manifold, edgeA, xfA, polygonB, xfB) {
        this.m_xf.Assign(b2MulT_t_t(xfA, xfB));
        this.m_centroidB.x = (this.m_xf.q.c * polygonB.m_centroid.x - this.m_xf.q.s * polygonB.m_centroid.y) + this.m_xf.p.x;
        this.m_centroidB.y = (this.m_xf.q.s * polygonB.m_centroid.x + this.m_xf.q.c * polygonB.m_centroid.y) + this.m_xf.p.y;
        this.m_v0.x = edgeA.m_vertex0.x;
        this.m_v0.y = edgeA.m_vertex0.y;
        this.m_v1.x = edgeA.m_vertex1.x;
        this.m_v1.y = edgeA.m_vertex1.y;
        this.m_v2.x = edgeA.m_vertex2.x;
        this.m_v2.y = edgeA.m_vertex2.y;
        this.m_v3.x = edgeA.m_vertex3.x;
        this.m_v3.y = edgeA.m_vertex3.y;
        var hasVertex0 = edgeA.m_hasVertex0;
        var hasVertex3 = edgeA.m_hasVertex3;
        b2EPCollider._temp_edge.x = this.m_v2.x - this.m_v1.x;
        b2EPCollider._temp_edge.y = this.m_v2.y - this.m_v1.y;
        b2EPCollider._temp_edge.Normalize();
        this.m_normal1.x = b2EPCollider._temp_edge.y;
        this.m_normal1.y = -b2EPCollider._temp_edge.x;
        var offset1 = this.m_normal1.x * (this.m_centroidB.x - this.m_v1.x) + this.m_normal1.y * (this.m_centroidB.y - this.m_v1.y);
        var offset0 = 0,
            offset2 = 0;
        var convex1 = false,
            convex2 = false;
        if (hasVertex0) {
            b2EPCollider._temp_edge0.x = this.m_v1.x - this.m_v0.x;
            b2EPCollider._temp_edge0.y = this.m_v1.y - this.m_v0.y;
            b2EPCollider._temp_edge0.Normalize();
            this.m_normal0.x = b2EPCollider._temp_edge0.y;
            this.m_normal0.y = -b2EPCollider._temp_edge0.x;
            convex1 = (b2EPCollider._temp_edge0.x * b2EPCollider._temp_edge.y - b2EPCollider._temp_edge0.y * b2EPCollider._temp_edge.x) >= 0;
            offset0 = this.m_normal0.x * (this.m_centroidB.x - this.m_v0.x) + this.m_normal0.y * (this.m_centroidB.y - this.m_v0.y)
        }
        if (hasVertex3) {
            b2EPCollider._temp_edge2.x = this.m_v3.x - this.m_v2.x;
            b2EPCollider._temp_edge2.y = this.m_v3.y - this.m_v2.y;
            b2EPCollider._temp_edge2.Normalize();
            this.m_normal2.x = b2EPCollider._temp_edge2.y;
            this.m_normal2.y = -b2EPCollider._temp_edge2.x;
            convex2 = (b2EPCollider._temp_edge.x * b2EPCollider._temp_edge2.y - b2EPCollider._temp_edge.y * b2EPCollider._temp_edge2.x) > 0;
            offset2 = this.m_normal2.x * (this.m_centroidB.x - this.m_v2.x) + this.m_normal2.y * (this.m_centroidB.y - this.m_v2.y)
        }
        if (hasVertex0 && hasVertex3) {
            if (convex1 && convex2) {
                this.m_front = offset0 >= 0 || offset1 >= 0 || offset2 >= 0;
                if (this.m_front) {
                    this.m_normal.x = this.m_normal1.x;
                    this.m_normal.y = this.m_normal1.y;
                    this.m_lowerLimit.x = this.m_normal0.x;
                    this.m_lowerLimit.y = this.m_normal0.y;
                    this.m_upperLimit.x = this.m_normal2.x;
                    this.m_upperLimit.y = this.m_normal2.y
                } else {
                    this.m_normal.x = -this.m_normal1.x;
                    this.m_normal.y = -this.m_normal1.y;
                    this.m_lowerLimit.x = -this.m_normal1.x;
                    this.m_lowerLimit.y = -this.m_normal1.y;
                    this.m_upperLimit.x = -this.m_normal1.x;
                    this.m_upperLimit.y = -this.m_normal1.y
                }
            } else {
                if (convex1) {
                    this.m_front = offset0 >= 0 || (offset1 >= 0 && offset2 >= 0);
                    if (this.m_front) {
                        this.m_normal.x = this.m_normal1.x;
                        this.m_normal.y = this.m_normal1.y;
                        this.m_lowerLimit.x = this.m_normal0.x;
                        this.m_lowerLimit.y = this.m_normal0.y;
                        this.m_upperLimit.x = this.m_normal1.x;
                        this.m_upperLimit.y = this.m_normal1.y
                    } else {
                        this.m_normal.x = -this.m_normal1.x;
                        this.m_normal.y = -this.m_normal1.y;
                        this.m_lowerLimit.x = -this.m_normal2.x;
                        this.m_lowerLimit.y = -this.m_normal2.y;
                        this.m_upperLimit.x = -this.m_normal1.x;
                        this.m_upperLimit.y = -this.m_normal1.y
                    }
                } else {
                    if (convex2) {
                        this.m_front = offset2 >= 0 || (offset0 >= 0 && offset1 >= 0);
                        if (this.m_front) {
                            this.m_normal.x = this.m_normal1.x;
                            this.m_normal.y = this.m_normal1.y;
                            this.m_lowerLimit.x = this.m_normal1.x;
                            this.m_lowerLimit.y = this.m_normal1.y;
                            this.m_upperLimit.x = this.m_normal2.x;
                            this.m_upperLimit.y = this.m_normal2.y
                        } else {
                            this.m_normal.x = -this.m_normal1.x;
                            this.m_normal.y = -this.m_normal1.y;
                            this.m_lowerLimit.x = -this.m_normal1.x;
                            this.m_lowerLimit.y = -this.m_normal1.y;
                            this.m_upperLimit.x = -this.m_normal0.x;
                            this.m_upperLimit.y = -this.m_normal0.y
                        }
                    } else {
                        this.m_front = offset0 >= 0 && offset1 >= 0 && offset2 >= 0;
                        if (this.m_front) {
                            this.m_normal.x = this.m_normal1.x;
                            this.m_normal.y = this.m_normal1.y;
                            this.m_lowerLimit.x = this.m_normal1.x;
                            this.m_lowerLimit.y = this.m_normal1.y;
                            this.m_upperLimit.x = this.m_normal1.x;
                            this.m_upperLimit.y = this.m_normal1.y
                        } else {
                            this.m_normal.x = -this.m_normal1.x;
                            this.m_normal.y = -this.m_normal1.y;
                            this.m_lowerLimit.x = -this.m_normal2.x;
                            this.m_lowerLimit.y = -this.m_normal2.y;
                            this.m_upperLimit.x = -this.m_normal0.x;
                            this.m_upperLimit.y = -this.m_normal0.y
                        }
                    }
                }
            }
        } else {
            if (hasVertex0) {
                if (convex1) {
                    this.m_front = offset0 >= 0 || offset1 >= 0;
                    if (this.m_front) {
                        this.m_normal.x = this.m_normal1.x;
                        this.m_normal.y = this.m_normal1.y;
                        this.m_lowerLimit.x = this.m_normal0.x;
                        this.m_lowerLimit.y = this.m_normal0.y;
                        this.m_upperLimit.x = -this.m_normal1.x;
                        this.m_upperLimit.y = -this.m_normal1.y
                    } else {
                        this.m_normal.x = -this.m_normal1.x;
                        this.m_normal.y = -this.m_normal1.y;
                        this.m_lowerLimit.x = this.m_normal1.x;
                        this.m_lowerLimit.y = this.m_normal1.y;
                        this.m_upperLimit.x = -this.m_normal1.x;
                        this.m_upperLimit.y = -this.m_normal1.y
                    }
                } else {
                    this.m_front = offset0 >= 0 && offset1 >= 0;
                    if (this.m_front) {
                        this.m_normal.x = this.m_normal1.x;
                        this.m_normal.y = this.m_normal1.y;
                        this.m_lowerLimit.x = this.m_normal1.x;
                        this.m_lowerLimit.y = this.m_normal1.y;
                        this.m_upperLimit.x = -this.m_normal1.x;
                        this.m_upperLimit.y = -this.m_normal1.y
                    } else {
                        this.m_normal.x = -this.m_normal1.x;
                        this.m_normal.y = -this.m_normal1.y;
                        this.m_lowerLimit.x = this.m_normal1.x;
                        this.m_lowerLimit.y = this.m_normal1.y;
                        this.m_upperLimit.x = -this.m_normal0.x;
                        this.m_upperLimit.y = -this.m_normal0.y
                    }
                }
            } else {
                if (hasVertex3) {
                    if (convex2) {
                        this.m_front = offset1 >= 0 || offset2 >= 0;
                        if (this.m_front) {
                            this.m_normal.x = this.m_normal1.x;
                            this.m_normal.y = this.m_normal1.y;
                            this.m_lowerLimit.x = -this.m_normal1.x;
                            this.m_lowerLimit.y = -this.m_normal1.y;
                            this.m_upperLimit.x = this.m_normal2.x;
                            this.m_upperLimit.y = this.m_normal2.y
                        } else {
                            this.m_normal.x = -this.m_normal1.x;
                            this.m_normal.y = -this.m_normal1.y;
                            this.m_lowerLimit.x = -this.m_normal1.x;
                            this.m_lowerLimit.y = -this.m_normal1.y;
                            this.m_upperLimit.x = this.m_normal1.x;
                            this.m_upperLimit.y = this.m_normal1.y
                        }
                    } else {
                        this.m_front = offset1 >= 0 && offset2 >= 0;
                        if (this.m_front) {
                            this.m_normal.x = this.m_normal1.x;
                            this.m_normal.y = this.m_normal1.y;
                            this.m_lowerLimit.x = -this.m_normal1.x;
                            this.m_lowerLimit.y = -this.m_normal1.y;
                            this.m_upperLimit.x = this.m_normal1.x;
                            this.m_upperLimit.y = this.m_normal1.y
                        } else {
                            this.m_normal.x = -this.m_normal1.x;
                            this.m_normal.y = -this.m_normal1.y;
                            this.m_lowerLimit.x = -this.m_normal2.x;
                            this.m_lowerLimit.y = -this.m_normal2.y;
                            this.m_upperLimit.x = this.m_normal1.x;
                            this.m_upperLimit.y = this.m_normal1.y
                        }
                    }
                } else {
                    this.m_front = offset1 >= 0;
                    if (this.m_front) {
                        this.m_normal.x = this.m_normal1.x;
                        this.m_normal.y = this.m_normal1.y;
                        this.m_lowerLimit.x = -this.m_normal1.x;
                        this.m_lowerLimit.y = -this.m_normal1.y;
                        this.m_upperLimit.x = -this.m_normal1.x;
                        this.m_upperLimit.y = -this.m_normal1.y
                    } else {
                        this.m_normal.x = -this.m_normal1.x;
                        this.m_normal.y = -this.m_normal1.y;
                        this.m_lowerLimit.x = this.m_normal1.x;
                        this.m_lowerLimit.y = this.m_normal1.y;
                        this.m_upperLimit.x = this.m_normal1.x;
                        this.m_upperLimit.y = this.m_normal1.y
                    }
                }
            }
        }
        this.m_polygonB.count = polygonB.m_count;
        for (var i = 0; i < polygonB.m_count; ++i) {
            this.m_polygonB.vertices[i] = b2Mul_t_v2(this.m_xf, polygonB.m_vertices[i]);
            this.m_polygonB.normals[i] = b2Mul_r_v2(this.m_xf.q, polygonB.m_normals[i])
        }
        this.m_radius = 2 * b2_polygonRadius;
        manifold.pointCount = 0;
        var edgeAxis = this.ComputeEdgeSeparation();
        if (edgeAxis.type == b2EPAxis.e_unknown) {
            return
        }
        if (edgeAxis.separation > this.m_radius) {
            return
        }
        var polygonAxis = this.ComputePolygonSeparation();
        if (polygonAxis.type != b2EPAxis.e_unknown && polygonAxis.separation > this.m_radius) {
            return
        }
        var k_relativeTol = 0.98;
        var k_absoluteTol = 0.001;
        var primaryAxis = new b2EPAxis();
        if (polygonAxis.type == b2EPAxis.e_unknown) {
            primaryAxis = edgeAxis
        } else {
            if (polygonAxis.separation > k_relativeTol * edgeAxis.separation + k_absoluteTol) {
                primaryAxis = polygonAxis
            } else {
                primaryAxis = edgeAxis
            }
        }
        var ie = new Array(2);
        var rf = new b2ReferenceFace();
        if (primaryAxis.type == b2EPAxis.e_edgeA) {
            manifold.type = b2Manifold.e_faceA;
            var bestIndex = 0;
            var bestValue = this.m_normal.x * this.m_polygonB.normals[0].x + this.m_normal.y * this.m_polygonB.normals[0].y;
            for (var i = 1; i < this.m_polygonB.count; ++i) {
                var value = this.m_normal.x * this.m_polygonB.normals[i].x + this.m_normal.y * this.m_polygonB.normals[i].y;
                if (value < bestValue) {
                    bestValue = value;
                    bestIndex = i
                }
            }
            var i1 = bestIndex;
            var i2 = i1 + 1 < this.m_polygonB.count ? i1 + 1 : 0;
            ie[0] = new b2ClipVertex();
            ie[0].v.x = this.m_polygonB.vertices[i1].x;
            ie[0].v.y = this.m_polygonB.vertices[i1].y;
            ie[0].id.indexA = 0;
            ie[0].id.indexB = i1;
            ie[0].id.typeA = b2ContactID.e_face;
            ie[0].id.typeB = b2ContactID.e_vertex;
            ie[1] = new b2ClipVertex();
            ie[1].v.x = this.m_polygonB.vertices[i2].x;
            ie[1].v.y = this.m_polygonB.vertices[i2].y;
            ie[1].id.indexA = 0;
            ie[1].id.indexB = i2;
            ie[1].id.typeA = b2ContactID.e_face;
            ie[1].id.typeB = b2ContactID.e_vertex;
            if (this.m_front) {
                rf.i1 = 0;
                rf.i2 = 1;
                rf.v1.x = this.m_v1.x;
                rf.v1.y = this.m_v1.y;
                rf.v2.x = this.m_v2.x;
                rf.v2.y = this.m_v2.y;
                rf.normal.x = this.m_normal1.x;
                rf.normal.y = this.m_normal1.y
            } else {
                rf.i1 = 1;
                rf.i2 = 0;
                rf.v1.x = this.m_v2.x;
                rf.v1.y = this.m_v2.y;
                rf.v2.x = this.m_v1.x;
                rf.v2.y = this.m_v1.y;
                rf.normal.x = -this.m_normal1.x;
                rf.normal.y = -this.m_normal1.y
            }
        } else {
            manifold.type = b2Manifold.e_faceB;
            ie[0] = new b2ClipVertex();
            ie[0].v = this.m_v1;
            ie[0].id.indexA = 0;
            ie[0].id.indexB = primaryAxis.index;
            ie[0].id.typeA = b2ContactID.e_vertex;
            ie[0].id.typeB = b2ContactID.e_face;
            ie[1] = new b2ClipVertex();
            ie[1].v = this.m_v2;
            ie[1].id.indexA = 0;
            ie[1].id.indexB = primaryAxis.index;
            ie[1].id.typeA = b2ContactID.e_vertex;
            ie[1].id.typeB = b2ContactID.e_face;
            rf.i1 = primaryAxis.index;
            rf.i2 = rf.i1 + 1 < this.m_polygonB.count ? rf.i1 + 1 : 0;
            rf.v1.x = this.m_polygonB.vertices[rf.i1].x;
            rf.v1.y = this.m_polygonB.vertices[rf.i1].y;
            rf.v2.x = this.m_polygonB.vertices[rf.i2].x;
            rf.v2.y = this.m_polygonB.vertices[rf.i2].y;
            rf.normal.x = this.m_polygonB.normals[rf.i1].x;
            rf.normal.y = this.m_polygonB.normals[rf.i1].y
        }
        rf.sideNormal1.x = rf.normal.y;
        rf.sideNormal1.y = -rf.normal.x;
        rf.sideNormal2.x = -rf.sideNormal1.x;
        rf.sideNormal2.y = -rf.sideNormal1.y;
        rf.sideOffset1 = rf.sideNormal1.x * rf.v1.x + rf.sideNormal1.y * rf.v1.y;
        rf.sideOffset2 = rf.sideNormal2.x * rf.v2.x + rf.sideNormal2.y * rf.v2.y;
        var clipPoints1 = new Array(2);
        var clipPoints2 = new Array(2);
        var np;
        np = b2ClipSegmentToLine(clipPoints1, ie, rf.sideNormal1.x, rf.sideNormal1.y, rf.sideOffset1, rf.i1);
        if (np < b2_maxManifoldPoints) {
            return
        }
        np = b2ClipSegmentToLine(clipPoints2, clipPoints1, rf.sideNormal2.x, rf.sideNormal2.y, rf.sideOffset2, rf.i2);
        if (np < b2_maxManifoldPoints) {
            return
        }
        if (primaryAxis.type == b2EPAxis.e_edgeA) {
            manifold.localNormal.x = rf.normal.x;
            manifold.localNormal.y = rf.normal.y;
            manifold.localPoint.x = rf.v1.x;
            manifold.localPoint.y = rf.v1.y
        } else {
            manifold.localNormal.x = polygonB.m_normals[rf.i1].x;
            manifold.localNormal.y = polygonB.m_normals[rf.i1].y;
            manifold.localPoint.x = polygonB.m_vertices[rf.i1].x;
            manifold.localPoint.y = polygonB.m_vertices[rf.i1].y
        }
        var pointCount = 0;
        for (var i = 0; i < b2_maxManifoldPoints; ++i) {
            var separation = rf.normal.x * (clipPoints2[i].v.x - rf.v1.x) + rf.normal.y * (clipPoints2[i].v.y - rf.v1.y);
            if (separation <= this.m_radius) {
                var cp = manifold.points[pointCount] = new b2ManifoldPoint();
                if (primaryAxis.type == b2EPAxis.e_edgeA) {
                    cp.localPoint.Assign(b2MulT_t_v2(this.m_xf, clipPoints2[i].v));
                    cp.id.Assign(clipPoints2[i].id)
                } else {
                    cp.localPoint.x = clipPoints2[i].v.x;
                    cp.localPoint.y = clipPoints2[i].v.y;
                    cp.id.typeA = clipPoints2[i].id.typeB;
                    cp.id.typeB = clipPoints2[i].id.typeA;
                    cp.id.indexA = clipPoints2[i].id.indexB;
                    cp.id.indexB = clipPoints2[i].id.indexA
                }++pointCount
            }
        }
        manifold.pointCount = pointCount
    },
    ComputeEdgeSeparation: function () {
        var axis = new b2EPAxis();
        axis.type = b2EPAxis.e_edgeA;
        axis.index = this.m_front ? 0 : 1;
        axis.separation = Number.MAX_VALUE;
        for (var i = 0; i < this.m_polygonB.count; ++i) {
            var s = this.m_normal.x * (this.m_polygonB.vertices[i].x - this.m_v1.x) + this.m_normal.y * (this.m_polygonB.vertices[i].y - this.m_v1.y);
            if (s < axis.separation) {
                axis.separation = s
            }
        }
        return axis
    },
    ComputePolygonSeparation: function () {
        var axis = new b2EPAxis();
        axis.type = b2EPAxis.e_unknown;
        axis.index = -1;
        axis.separation = -Number.MAX_VALUE;
        var perpx = -this.m_normal.y;
        var perpy = this.m_normal.x;
        for (var i = 0; i < this.m_polygonB.count; ++i) {
            var nx = -this.m_polygonB.normals[i].x;
            var ny = -this.m_polygonB.normals[i].y;
            var s1 = nx * (this.m_polygonB.vertices[i].x - this.m_v1.x) + ny * (this.m_polygonB.vertices[i].y - this.m_v1.y);
            var s2 = nx * (this.m_polygonB.vertices[i].x - this.m_v2.x) + ny * (this.m_polygonB.vertices[i].y - this.m_v2.y);
            var s = b2Min(s1, s2);
            if (s > this.m_radius) {
                axis.type = b2EPAxis.e_edgeB;
                axis.index = i;
                axis.separation = s;
                return axis
            }
            if (nx * perpx + ny * perpy >= 0) {
                if ((nx - this.m_upperLimit.x) * this.m_normal.x + (ny - this.m_upperLimit.y) * this.m_normal.y < -b2_angularSlop) {
                    continue
                }
            } else {
                if ((nx - this.m_lowerLimit.x) * this.m_normal.x + (ny - this.m_lowerLimit.y) * this.m_normal.y < -b2_angularSlop) {
                    continue
                }
            }
            if (s > axis.separation) {
                axis.type = b2EPAxis.e_edgeB;
                axis.index = i;
                axis.separation = s
            }
        }
        return axis
    }
};
b2EPCollider.e_isolated = 0;
b2EPCollider.e_concave = 1;
b2EPCollider.e_convex = 2;

function b2CollideEdgeAndPolygon(manifold, edgeA, xfA, polygonB, xfB) {
    b2CollideEdgeAndPolygon.collider.Collide(manifold, edgeA, xfA, polygonB, xfB)
}
b2CollideEdgeAndPolygon.collider = new b2EPCollider();

function b2ClipSegmentToLine(vOut, vIn, normalx, normaly, offset, vertexIndexA) {
    var numOut = 0;
    var distance0 = (normalx * vIn[0].v.x + normaly * vIn[0].v.y) - offset;
    var distance1 = (normalx * vIn[1].v.x + normaly * vIn[1].v.y) - offset;
    if (distance0 <= 0) {
        vOut[numOut++] = vIn[0]
    }
    if (distance1 <= 0) {
        vOut[numOut++] = vIn[1]
    }
    if (distance0 * distance1 < 0) {
        var interp = distance0 / (distance0 - distance1);
        vOut[numOut] = new b2ClipVertex();
        vOut[numOut].v.x = vIn[0].v.x + (interp * (vIn[1].v.x - vIn[0].v.x));
        vOut[numOut].v.y = vIn[0].v.y + (interp * (vIn[1].v.y - vIn[0].v.y));
        vOut[numOut].id.indexA = vertexIndexA;
        vOut[numOut].id.indexB = vIn[0].id.indexB;
        vOut[numOut].id.typeA = b2ContactID.e_vertex;
        vOut[numOut].id.typeB = b2ContactID.e_face;
        ++numOut
    }
    return numOut
}

function b2TestShapeOverlap(shapeA, indexA, shapeB, indexB, xfA, xfB) {
    b2TestShapeOverlap.input.proxyA.Set(shapeA, indexA);
    b2TestShapeOverlap.input.proxyB.Set(shapeB, indexB);
    b2TestShapeOverlap.input.transformA = xfA;
    b2TestShapeOverlap.input.transformB = xfB;
    b2TestShapeOverlap.input.useRadii = true;
    b2TestShapeOverlap.cache.count = 0;
    b2DistanceFunc(b2TestShapeOverlap.output, b2TestShapeOverlap.cache, b2TestShapeOverlap.input);
    return b2TestShapeOverlap.output.distance < 10 * b2_epsilon
}
b2TestShapeOverlap.input = new b2DistanceInput();
b2TestShapeOverlap.cache = new b2SimplexCache();
b2TestShapeOverlap.output = new b2DistanceOutput();

function b2TestOverlap(a, b) {
    return !((b.lowerBound.x - a.upperBound.x) > 0 || (b.lowerBound.y - a.upperBound.y) > 0 || (a.lowerBound.x - b.upperBound.x) > 0 || (a.lowerBound.y - b.upperBound.y) > 0)
}
"use strict";
var b2_nullNode = -1;

function b2TreeNode() {
    this.aabb = new b2AABB();
    this.userData = null;
    this.parent = 0;
    this.child1 = this.child2 = this.height = 0
}
b2TreeNode.prototype = {
    IsLeaf: function () {
        return this.child1 == b2_nullNode
    }
};

function b2DynamicTree() {
    this.m_root = b2_nullNode;
    this.m_nodeCapacity = 16;
    this.m_nodeCount = 0;
    this.m_nodes = new Array(this.m_nodeCapacity);
    for (var i = 0; i < this.m_nodeCapacity - 1; ++i) {
        this.m_nodes[i] = new b2TreeNode();
        this.m_nodes[i].parent = i + 1;
        this.m_nodes[i].height = -1
    }
    this.m_nodes[this.m_nodeCapacity - 1] = new b2TreeNode();
    this.m_nodes[this.m_nodeCapacity - 1].parent = b2_nullNode;
    this.m_nodes[this.m_nodeCapacity - 1].height = -1;
    this.m_freeList = 0;
    this.m_path = 0;
    this.m_insertionCount = 0
}
b2DynamicTree.aabbExtensionFattener = new b2Vec2(b2_aabbExtension, b2_aabbExtension);
b2DynamicTree.prototype = {
    CreateProxy: function (aabb, userData) {
        var proxyId = this.AllocateNode();
        this.m_nodes[proxyId].aabb.lowerBound.Assign(b2Vec2.Subtract(aabb.lowerBound, b2DynamicTree.aabbExtensionFattener));
        this.m_nodes[proxyId].aabb.upperBound.Assign(b2Vec2.Add(aabb.upperBound, b2DynamicTree.aabbExtensionFattener));
        this.m_nodes[proxyId].userData = userData;
        this.m_nodes[proxyId].height = 0;
        this.InsertLeaf(proxyId);
        return proxyId
    },
    DestroyProxy: function (proxyId) {
        this.RemoveLeaf(proxyId);
        this.FreeNode(proxyId)
    },
    MoveProxy: function (proxyId, aabb, displacement) {
        if (this.m_nodes[proxyId].aabb.Contains(aabb)) {
            return false
        }
        this.RemoveLeaf(proxyId);
        this.m_nodes[proxyId].aabb.Assign(aabb);
        this.m_nodes[proxyId].aabb.lowerBound.Subtract(b2DynamicTree.aabbExtensionFattener);
        this.m_nodes[proxyId].aabb.upperBound.Add(b2DynamicTree.aabbExtensionFattener);
        var d = b2Vec2.Multiply(b2_aabbMultiplier, displacement);
        if (d.x < 0) {
            this.m_nodes[proxyId].aabb.lowerBound.x += d.x
        } else {
            this.m_nodes[proxyId].aabb.upperBound.x += d.x
        }
        if (d.y < 0) {
            this.m_nodes[proxyId].aabb.lowerBound.y += d.y
        } else {
            this.m_nodes[proxyId].aabb.upperBound.y += d.y
        }
        this.InsertLeaf(proxyId);
        return true
    },
    GetUserData: function (proxyId) {
        return this.m_nodes[proxyId].userData
    },
    GetFatAABB: function (proxyId) {
        return this.m_nodes[proxyId].aabb
    },
    Query: function (callback, aabb) {
        var stack = [];
        stack.push(this.m_root);
        while (stack.length > 0) {
            var nodeId = stack.pop();
            if (nodeId == b2_nullNode) {
                continue
            }
            var node = this.m_nodes[nodeId];
            if (b2TestOverlap(node.aabb, aabb)) {
                if (node.IsLeaf()) {
                    var proceed = callback.QueryCallback(nodeId);
                    if (proceed == false) {
                        return
                    }
                } else {
                    stack.push(node.child1);
                    stack.push(node.child2)
                }
            }
        }
    },
    RayCast: function (callback, input) {
        var p1 = input.p1;
        var p2 = input.p2;
        var r = b2Vec2.Subtract(p2, p1);
        r.Normalize();
        var v = b2Cross_f_v2(1, r);
        var abs_v = b2Abs_v2(v);
        var maxFraction = input.maxFraction;
        var segmentAABB = new b2AABB();
        var t = b2Vec2.Add(p1, b2Vec2.Multiply(maxFraction, b2Vec2.Subtract(p2, p1)));
        segmentAABB.lowerBound.Assign(b2Min_v2(p1, t));
        segmentAABB.upperBound.Assign(b2Max_v2(p1, t));
        var stack = [];
        stack.push(this.m_root);
        while (stack.length > 0) {
            var nodeId = stack.pop();
            if (nodeId == b2_nullNode) {
                continue
            }
            var node = this.m_nodes[nodeId];
            if (b2TestOverlap(node.aabb, segmentAABB) == false) {
                continue
            }
            var c = node.aabb.GetCenter();
            var h = node.aabb.GetExtents();
            var separation = b2Abs(b2Dot_v2_v2(v, b2Vec2.Subtract(p1, c))) - b2Dot_v2_v2(abs_v, h);
            if (separation > 0) {
                continue
            }
            if (node.IsLeaf()) {
                var subInput = new b2RayCastInput();
                subInput.p1.Assign(input.p1);
                subInput.p2.Assign(input.p2);
                subInput.maxFraction = maxFraction;
                var value = callback.RayCastCallback(subInput, nodeId);
                if (value == 0) {
                    return
                }
                if (value > 0) {
                    maxFraction = value;
                    var t = b2Vec2.Add(p1, b2Vec2.Multiply(maxFraction, b2Vec2.Subtract(p2, p1)));
                    segmentAABB.lowerBound.Assign(b2Min_v2(p1, t));
                    segmentAABB.upperBound.Assign(b2Max_v2(p1, t))
                }
            } else {
                stack.push(node.child1);
                stack.push(node.child2)
            }
        }
    },
    Validate: function () {
        this.ValidateStructure(this.m_root);
        this.ValidateMetrics(this.m_root);
        var freeCount = 0;
        var freeIndex = this.m_freeList;
        while (freeIndex != b2_nullNode) {
            freeIndex = this.m_nodes[freeIndex].parent;
            ++freeCount
        }
    },
    GetHeight: function () {
        if (this.m_root == b2_nullNode) {
            return 0
        }
        return this.m_nodes[this.m_root].height
    },
    GetMaxBalance: function () {
        var maxBalance = 0;
        for (var i = 0; i < this.m_nodeCapacity; ++i) {
            var node = this.m_nodes[i];
            if (node.height <= 1) {
                continue
            }
            var child1 = node.child1;
            var child2 = node.child2;
            var balance = b2Abs(this.m_nodes[child2].height - this.m_nodes[child1].height);
            maxBalance = b2Max(maxBalance, balance)
        }
        return maxBalance
    },
    GetAreaRatio: function () {
        if (this.m_root == b2_nullNode) {
            return 0
        }
        var root = this.m_nodes[this.m_root];
        var rootArea = root.aabb.GetPerimeter();
        var totalArea = 0;
        for (var i = 0; i < this.m_nodeCapacity; ++i) {
            var node = this.m_nodes[i];
            if (node.height < 0) {
                continue
            }
            totalArea += node.aabb.GetPerimeter()
        }
        return totalArea / rootArea
    },
    RebuildBottomUp: function () {
        var nodes = new Array(this.m_nodeCount);
        var count = 0;
        for (var i = 0; i < this.m_nodeCapacity; ++i) {
            if (this.m_nodes[i].height < 0) {
                continue
            }
            if (this.m_nodes[i].IsLeaf()) {
                this.m_nodes[i].parent = b2_nullNode;
                nodes[count] = i;
                ++count
            } else {
                this.FreeNode(i)
            }
        }
        while (count > 1) {
            var minCost = b2_maxFloat;
            var iMin = -1,
                jMin = -1;
            for (i = 0; i < count; ++i) {
                var aabbi = this.m_nodes[nodes[i]].aabb;
                for (var j = i + 1; j < count; ++j) {
                    var aabbj = this.m_nodes[nodes[j]].aabb;
                    var b = new b2AABB();
                    b.Combine(aabbi, aabbj);
                    var cost = b.GetPerimeter();
                    if (cost < minCost) {
                        iMin = i;
                        jMin = j;
                        minCost = cost
                    }
                }
            }
            var index1 = nodes[iMin];
            var index2 = nodes[jMin];
            var child1 = this.m_nodes[index1];
            var child2 = this.m_nodes[index2];
            var parentIndex = this.AllocateNode();
            var parent = this.m_nodes[parentIndex];
            parent.child1 = index1;
            parent.child2 = index2;
            parent.height = 1 + b2Max(child1.height, child2.height);
            parent.aabb.Combine(child1.aabb, child2.aabb);
            parent.parent = b2_nullNode;
            child1.parent = parentIndex;
            child2.parent = parentIndex;
            nodes[jMin] = nodes[count - 1];
            nodes[iMin] = parentIndex;
            --count
        }
        this.m_root = nodes[0];
        this.Validate()
    },
    ShiftOrigin: function (newOrigin) {
        for (var i = 0; i < this.m_nodeCapacity; ++i) {
            this.m_nodes[i].aabb.lowerBound.Subtract(newOrigin);
            this.m_nodes[i].aabb.upperBound.Subtract(newOrigin)
        }
    },
    AllocateNode: function () {
        if (this.m_freeList == b2_nullNode) {
            var oldNodes = this.m_nodes;
            this.m_nodeCapacity *= 2;
            this.m_nodes = oldNodes.concat(new Array(this.m_nodeCapacity - this.m_nodeCount));
            for (var i = this.m_nodeCount; i < this.m_nodeCapacity - 1; ++i) {
                this.m_nodes[i] = new b2TreeNode();
                this.m_nodes[i].parent = i + 1;
                this.m_nodes[i].height = -1
            }
            this.m_nodes[this.m_nodeCapacity - 1] = new b2TreeNode();
            this.m_nodes[this.m_nodeCapacity - 1].parent = b2_nullNode;
            this.m_nodes[this.m_nodeCapacity - 1].height = -1;
            this.m_freeList = this.m_nodeCount
        }
        var nodeId = this.m_freeList;
        this.m_freeList = this.m_nodes[nodeId].parent;
        this.m_nodes[nodeId].parent = b2_nullNode;
        this.m_nodes[nodeId].child1 = b2_nullNode;
        this.m_nodes[nodeId].child2 = b2_nullNode;
        this.m_nodes[nodeId].height = 0;
        this.m_nodes[nodeId].userData = null;
        ++this.m_nodeCount;
        return nodeId
    },
    FreeNode: function (nodeId) {
        this.m_nodes[nodeId].parent = this.m_freeList;
        this.m_nodes[nodeId].height = -1;
        this.m_freeList = nodeId;
        --this.m_nodeCount
    },
    InsertLeaf: function (leaf) {
        ++this.m_insertionCount;
        if (this.m_root == b2_nullNode) {
            this.m_root = leaf;
            this.m_nodes[this.m_root].parent = b2_nullNode;
            return
        }
        var leafAABB = this.m_nodes[leaf].aabb;
        var index = this.m_root;
        while (this.m_nodes[index].IsLeaf() == false) {
            var child1 = this.m_nodes[index].child1;
            var child2 = this.m_nodes[index].child2;
            var area = this.m_nodes[index].aabb.GetPerimeter();
            var combinedAABB = new b2AABB();
            combinedAABB.Combine(this.m_nodes[index].aabb, leafAABB);
            var combinedArea = combinedAABB.GetPerimeter();
            var cost = 2 * combinedArea;
            var inheritanceCost = 2 * (combinedArea - area);
            var cost1;
            var aabb;
            if (this.m_nodes[child1].IsLeaf()) {
                aabb = new b2AABB();
                aabb.Combine(leafAABB, this.m_nodes[child1].aabb);
                cost1 = aabb.GetPerimeter() + inheritanceCost
            } else {
                aabb = new b2AABB();
                aabb.Combine(leafAABB, this.m_nodes[child1].aabb);
                var oldArea = this.m_nodes[child1].aabb.GetPerimeter();
                var newArea = aabb.GetPerimeter();
                cost1 = (newArea - oldArea) + inheritanceCost
            }
            var cost2;
            if (this.m_nodes[child2].IsLeaf()) {
                aabb = new b2AABB();
                aabb.Combine(leafAABB, this.m_nodes[child2].aabb);
                cost2 = aabb.GetPerimeter() + inheritanceCost
            } else {
                aabb = new b2AABB();
                aabb.Combine(leafAABB, this.m_nodes[child2].aabb);
                var oldArea = this.m_nodes[child2].aabb.GetPerimeter();
                var newArea = aabb.GetPerimeter();
                cost2 = newArea - oldArea + inheritanceCost
            }
            if (cost < cost1 && cost < cost2) {
                break
            }
            if (cost1 < cost2) {
                index = child1
            } else {
                index = child2
            }
        }
        var sibling = index;
        var oldParent = this.m_nodes[sibling].parent;
        var newParent = this.AllocateNode();
        this.m_nodes[newParent].parent = oldParent;
        this.m_nodes[newParent].userData = null;
        this.m_nodes[newParent].aabb.Combine(leafAABB, this.m_nodes[sibling].aabb);
        this.m_nodes[newParent].height = this.m_nodes[sibling].height + 1;
        if (oldParent != b2_nullNode) {
            if (this.m_nodes[oldParent].child1 == sibling) {
                this.m_nodes[oldParent].child1 = newParent
            } else {
                this.m_nodes[oldParent].child2 = newParent
            }
            this.m_nodes[newParent].child1 = sibling;
            this.m_nodes[newParent].child2 = leaf;
            this.m_nodes[sibling].parent = newParent;
            this.m_nodes[leaf].parent = newParent
        } else {
            this.m_nodes[newParent].child1 = sibling;
            this.m_nodes[newParent].child2 = leaf;
            this.m_nodes[sibling].parent = newParent;
            this.m_nodes[leaf].parent = newParent;
            this.m_root = newParent
        }
        index = this.m_nodes[leaf].parent;
        while (index != b2_nullNode) {
            index = this.Balance(index);
            var child1 = this.m_nodes[index].child1;
            var child2 = this.m_nodes[index].child2;
            this.m_nodes[index].height = 1 + b2Max(this.m_nodes[child1].height, this.m_nodes[child2].height);
            this.m_nodes[index].aabb.Combine(this.m_nodes[child1].aabb, this.m_nodes[child2].aabb);
            index = this.m_nodes[index].parent
        }
    },
    RemoveLeaf: function (leaf) {
        if (leaf == this.m_root) {
            this.m_root = b2_nullNode;
            return
        }
        var parent = this.m_nodes[leaf].parent;
        var grandParent = this.m_nodes[parent].parent;
        var sibling;
        if (this.m_nodes[parent].child1 == leaf) {
            sibling = this.m_nodes[parent].child2
        } else {
            sibling = this.m_nodes[parent].child1
        }
        if (grandParent != b2_nullNode) {
            if (this.m_nodes[grandParent].child1 == parent) {
                this.m_nodes[grandParent].child1 = sibling
            } else {
                this.m_nodes[grandParent].child2 = sibling
            }
            this.m_nodes[sibling].parent = grandParent;
            this.FreeNode(parent);
            var index = grandParent;
            while (index != b2_nullNode) {
                index = this.Balance(index);
                var child1 = this.m_nodes[index].child1;
                var child2 = this.m_nodes[index].child2;
                this.m_nodes[index].aabb.Combine(this.m_nodes[child1].aabb, this.m_nodes[child2].aabb);
                this.m_nodes[index].height = 1 + b2Max(this.m_nodes[child1].height, this.m_nodes[child2].height);
                index = this.m_nodes[index].parent
            }
        } else {
            this.m_root = sibling;
            this.m_nodes[sibling].parent = b2_nullNode;
            this.FreeNode(parent)
        }
    },
    Balance: function (iA) {
        var A = this.m_nodes[iA];
        if (A.IsLeaf() || A.height < 2) {
            return iA
        }
        var iB = A.child1;
        var iC = A.child2;
        var B = this.m_nodes[iB];
        var C = this.m_nodes[iC];
        var balance = C.height - B.height;
        if (balance > 1) {
            var iF = C.child1;
            var iG = C.child2;
            var F = this.m_nodes[iF];
            var G = this.m_nodes[iG];
            C.child1 = iA;
            C.parent = A.parent;
            A.parent = iC;
            if (C.parent != b2_nullNode) {
                if (this.m_nodes[C.parent].child1 == iA) {
                    this.m_nodes[C.parent].child1 = iC
                } else {
                    this.m_nodes[C.parent].child2 = iC
                }
            } else {
                this.m_root = iC
            }
            if (F.height > G.height) {
                C.child2 = iF;
                A.child2 = iG;
                G.parent = iA;
                A.aabb.Combine(B.aabb, G.aabb);
                C.aabb.Combine(A.aabb, F.aabb);
                A.height = 1 + b2Max(B.height, G.height);
                C.height = 1 + b2Max(A.height, F.height)
            } else {
                C.child2 = iG;
                A.child2 = iF;
                F.parent = iA;
                A.aabb.Combine(B.aabb, F.aabb);
                C.aabb.Combine(A.aabb, G.aabb);
                A.height = 1 + b2Max(B.height, F.height);
                C.height = 1 + b2Max(A.height, G.height)
            }
            return iC
        }
        if (balance < -1) {
            var iD = B.child1;
            var iE = B.child2;
            var D = this.m_nodes[iD];
            var E = this.m_nodes[iE];
            B.child1 = iA;
            B.parent = A.parent;
            A.parent = iB;
            if (B.parent != b2_nullNode) {
                if (this.m_nodes[B.parent].child1 == iA) {
                    this.m_nodes[B.parent].child1 = iB
                } else {
                    this.m_nodes[B.parent].child2 = iB
                }
            } else {
                this.m_root = iB
            }
            if (D.height > E.height) {
                B.child2 = iD;
                A.child1 = iE;
                E.parent = iA;
                A.aabb.Combine(C.aabb, E.aabb);
                B.aabb.Combine(A.aabb, D.aabb);
                A.height = 1 + b2Max(C.height, E.height);
                B.height = 1 + b2Max(A.height, D.height)
            } else {
                B.child2 = iE;
                A.child1 = iD;
                D.parent = iA;
                A.aabb.Combine(C.aabb, D.aabb);
                B.aabb.Combine(A.aabb, E.aabb);
                A.height = 1 + b2Max(C.height, D.height);
                B.height = 1 + b2Max(A.height, E.height)
            }
            return iB
        }
        return iA
    },
    ComputeHeight: function (nodeId) {
        if (typeof (nodeId) === "undefined") {
            nodeId = this.m_root
        }
        var node = this.m_nodes[nodeId];
        if (node.IsLeaf()) {
            return 0
        }
        var height1 = this.ComputeHeight(node.child1);
        var height2 = this.ComputeHeight(node.child2);
        return 1 + b2Max(height1, height2)
    },
    ValidateStructure: function (index) {
        if (index == b2_nullNode) {
            return
        }
        var node = this.m_nodes[index];
        var child1 = node.child1;
        var child2 = node.child2;
        if (node.IsLeaf()) {
            return
        }
        this.ValidateStructure(child1);
        this.ValidateStructure(child2)
    },
    ValidateMetrics: function (index) {
        if (index == b2_nullNode) {
            return
        }
        var node = this.m_nodes[index];
        var child1 = node.child1;
        var child2 = node.child2;
        if (node.IsLeaf()) {
            return
        }
        var height1 = this.m_nodes[child1].height;
        var height2 = this.m_nodes[child2].height;
        var height;
        height = 1 + b2Max(height1, height2);
        var aabb = new b2AABB();
        aabb.Combine(this.m_nodes[child1].aabb, this.m_nodes[child2].aabb);
        this.ValidateMetrics(child1);
        this.ValidateMetrics(child2)
    }
};
"use strict";

function b2TOIInput() {
    this.proxyA = new b2DistanceProxy();
    this.proxyB = new b2DistanceProxy();
    this.sweepA = new b2Sweep();
    this.sweepB = new b2Sweep();
    this.tMax = 0
}

function b2TOIOutput() {
    this.state = 0;
    this.t = 0
}
b2TOIOutput.e_unknown = 0;
b2TOIOutput.e_failed = 1;
b2TOIOutput.e_overlapped = 2;
b2TOIOutput.e_touching = 3;
b2TOIOutput.e_separated = 4;

function b2SeparationFunction() {
    this.m_proxyA = null;
    this.m_proxyB = null;
    this.m_sweepA = null;
    this.m_sweepB = null;
    this.m_type = 0;
    this.m_localPoint = new b2Vec2();
    this.m_axis = new b2Vec2()
}
var _local_xfA = new b2Transform();
var _local_xfB = new b2Transform();
b2SeparationFunction.prototype = {
    Initialize: function (cache, proxyA, sweepA, proxyB, sweepB, t1) {
        this.m_proxyA = proxyA;
        this.m_proxyB = proxyB;
        var count = cache.count;
        this.m_sweepA = sweepA;
        this.m_sweepB = sweepB;
        this.m_sweepA.GetTransform(_local_xfA, t1);
        this.m_sweepB.GetTransform(_local_xfB, t1);
        if (count == 1) {
            this.m_type = b2SeparationFunction.e_points;
            var localPointA = this.m_proxyA.GetVertex(cache.indexA[0]);
            var localPointB = this.m_proxyB.GetVertex(cache.indexB[0]);
            var pointAx = (_local_xfA.q.c * localPointA.x - _local_xfA.q.s * localPointA.y) + _local_xfA.p.x;
            var pointAy = (_local_xfA.q.s * localPointA.x + _local_xfA.q.c * localPointA.y) + _local_xfA.p.y;
            var pointBx = (_local_xfB.q.c * localPointB.x - _local_xfB.q.s * localPointB.y) + _local_xfB.p.x;
            var pointBy = (_local_xfB.q.s * localPointB.x + _local_xfB.q.c * localPointB.y) + _local_xfB.p.y;
            this.m_axis.x = pointBx - pointAx;
            this.m_axis.y = pointBy - pointAy;
            var s = this.m_axis.Normalize();
            return s
        } else {
            if (cache.indexA[0] == cache.indexA[1]) {
                this.m_type = b2SeparationFunction.e_faceB;
                var localPointB1 = proxyB.GetVertex(cache.indexB[0]);
                var localPointB2 = proxyB.GetVertex(cache.indexB[1]);
                this.m_axis.x = 1 * (localPointB2.y - localPointB1.y);
                this.m_axis.y = -1 * (localPointB2.x - localPointB1.x);
                this.m_axis.Normalize();
                var normalx = _local_xfB.q.c * this.m_axis.x - _local_xfB.q.s * this.m_axis.y;
                var normaly = _local_xfB.q.s * this.m_axis.x + _local_xfB.q.c * this.m_axis.y;
                this.m_localPoint.x = 0.5 * (localPointB1.x + localPointB2.x);
                this.m_localPoint.y = 0.5 * (localPointB1.y + localPointB2.y);
                var pointBx = (_local_xfB.q.c * this.m_localPoint.x - _local_xfB.q.s * this.m_localPoint.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * this.m_localPoint.x + _local_xfB.q.c * this.m_localPoint.y) + _local_xfB.p.y;
                var localPointA = proxyA.GetVertex(cache.indexA[0]);
                var pointAx = (_local_xfA.q.c * localPointA.x - _local_xfA.q.s * localPointA.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * localPointA.x + _local_xfA.q.c * localPointA.y) + _local_xfA.p.y;
                var s = (pointAx - pointBx) * normalx + (pointAy - pointBy) * normaly;
                if (s < 0) {
                    this.m_axis.x = -this.m_axis.x;
                    this.m_axis.y = -this.m_axis.y;
                    s = -s
                }
                return s
            } else {
                this.m_type = b2SeparationFunction.e_faceA;
                var localPointA1 = this.m_proxyA.GetVertex(cache.indexA[0]);
                var localPointA2 = this.m_proxyA.GetVertex(cache.indexA[1]);
                this.m_axis.x = 1 * (localPointA2.y - localPointA1.y);
                this.m_axis.y = -1 * (localPointA2.x - localPointA1.x);
                this.m_axis.Normalize();
                var normalx = _local_xfA.q.c * this.m_axis.x - _local_xfA.q.s * this.m_axis.y;
                var normaly = _local_xfA.q.s * this.m_axis.x + _local_xfA.q.c * this.m_axis.y;
                this.m_localPoint.x = 0.5 * (localPointA1.x + localPointA2.x);
                this.m_localPoint.y = 0.5 * (localPointA1.y + localPointA2.y);
                var pointAx = (_local_xfA.q.c * this.m_localPoint.x - _local_xfA.q.s * this.m_localPoint.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * this.m_localPoint.x + _local_xfA.q.c * this.m_localPoint.y) + _local_xfA.p.y;
                var localPointB = this.m_proxyB.GetVertex(cache.indexB[0]);
                var pointBx = (_local_xfB.q.c * localPointB.x - _local_xfB.q.s * localPointB.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * localPointB.x + _local_xfB.q.c * localPointB.y) + _local_xfB.p.y;
                var s = (pointBx - pointAx) * normalx + (pointBy - pointAy) * normaly;
                if (s < 0) {
                    this.m_axis.x = -this.m_axis.x;
                    this.m_axis.y = -this.m_axis.y;
                    s = -s
                }
                return s
            }
        }
    },
    FindMinSeparation: function (indices, t) {
        this.m_sweepA.GetTransform(_local_xfA, t);
        this.m_sweepB.GetTransform(_local_xfB, t);
        switch (this.m_type) {
            case b2SeparationFunction.e_points:
                var axisAx = _local_xfA.q.c * this.m_axis.x + _local_xfA.q.s * this.m_axis.y;
                var axisAy = -_local_xfA.q.s * this.m_axis.x + _local_xfA.q.c * this.m_axis.y;
                var axisBx = _local_xfB.q.c * -this.m_axis.x + _local_xfB.q.s * -this.m_axis.y;
                var axisBy = -_local_xfB.q.s * -this.m_axis.x + _local_xfB.q.c * -this.m_axis.y;
                indices[0] = this.m_proxyA.GetSupport(axisAx, axisAy);
                indices[1] = this.m_proxyB.GetSupport(axisBx, axisBy);
                var localPointA = this.m_proxyA.GetVertex(indices[0]);
                var localPointB = this.m_proxyB.GetVertex(indices[1]);
                var pointAx = (_local_xfA.q.c * localPointA.x - _local_xfA.q.s * localPointA.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * localPointA.x + _local_xfA.q.c * localPointA.y) + _local_xfA.p.y;
                var pointBx = (_local_xfB.q.c * localPointB.x - _local_xfB.q.s * localPointB.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * localPointB.x + _local_xfB.q.c * localPointB.y) + _local_xfB.p.y;
                return (pointBx - pointAx) * this.m_axis.x + (pointBy - pointAy) * this.m_axis.y;
            case b2SeparationFunction.e_faceA:
                var normalx = _local_xfA.q.c * this.m_axis.x - _local_xfA.q.s * this.m_axis.y;
                var normaly = _local_xfA.q.s * this.m_axis.x + _local_xfA.q.c * this.m_axis.y;
                var pointAx = (_local_xfA.q.c * this.m_localPoint.x - _local_xfA.q.s * this.m_localPoint.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * this.m_localPoint.x + _local_xfA.q.c * this.m_localPoint.y) + _local_xfA.p.y;
                var axisBx = _local_xfB.q.c * -normalx + _local_xfB.q.s * -normaly;
                var axisBy = -_local_xfB.q.s * -normalx + _local_xfB.q.c * -normaly;
                indices[0] = -1;
                indices[1] = this.m_proxyB.GetSupport(axisBx, axisBy);
                var localPointB = this.m_proxyB.GetVertex(indices[1]);
                var pointBx = (_local_xfB.q.c * localPointB.x - _local_xfB.q.s * localPointB.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * localPointB.x + _local_xfB.q.c * localPointB.y) + _local_xfB.p.y;
                return (pointBx - pointAx) * normalx + (pointBy - pointAy) * normaly;
            case b2SeparationFunction.e_faceB:
                var normalx = _local_xfB.q.c * this.m_axis.x - _local_xfB.q.s * this.m_axis.y;
                var normaly = _local_xfB.q.s * this.m_axis.x + _local_xfB.q.c * this.m_axis.y;
                var pointBx = (_local_xfB.q.c * this.m_localPoint.x - _local_xfB.q.s * this.m_localPoint.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * this.m_localPoint.x + _local_xfB.q.c * this.m_localPoint.y) + _local_xfB.p.y;
                var axisAx = _local_xfA.q.c * -normalx + _local_xfA.q.s * -normaly;
                var axisBy = -_local_xfA.q.s * -normalx + _local_xfA.q.c * -normaly;
                indices[1] = -1;
                indices[0] = this.m_proxyA.GetSupport(axisAx, axisBy);
                var localPointA = this.m_proxyA.GetVertex(indices[0]);
                var pointAx = (_local_xfA.q.c * localPointA.x - _local_xfA.q.s * localPointA.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * localPointA.x + _local_xfA.q.c * localPointA.y) + _local_xfA.p.y;
                return (pointAx - pointBx) * normalx + (pointAy - pointBy) * normaly
        }
    },
    Evaluate: function (indexA, indexB, t) {
        this.m_sweepA.GetTransform(_local_xfA, t);
        this.m_sweepB.GetTransform(_local_xfB, t);
        switch (this.m_type) {
            case b2SeparationFunction.e_points:
                var localPointA = this.m_proxyA.GetVertex(indexA);
                var localPointB = this.m_proxyB.GetVertex(indexB);
                var pointAx = (_local_xfA.q.c * localPointA.x - _local_xfA.q.s * localPointA.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * localPointA.x + _local_xfA.q.c * localPointA.y) + _local_xfA.p.y;
                var pointBx = (_local_xfB.q.c * localPointB.x - _local_xfB.q.s * localPointB.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * localPointB.x + _local_xfB.q.c * localPointB.y) + _local_xfB.p.y;
                var separation = (pointBx - pointAx) * this.m_axis.x + (pointBy - pointAy) * this.m_axis.y;
                return separation;
            case b2SeparationFunction.e_faceA:
                var normalx = _local_xfA.q.c * this.m_axis.x - _local_xfA.q.s * this.m_axis.y;
                var normaly = _local_xfA.q.s * this.m_axis.x + _local_xfA.q.c * this.m_axis.y;
                var pointAx = (_local_xfA.q.c * this.m_localPoint.x - _local_xfA.q.s * this.m_localPoint.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * this.m_localPoint.x + _local_xfA.q.c * this.m_localPoint.y) + _local_xfA.p.y;
                var localPointB = this.m_proxyB.GetVertex(indexB);
                var pointBx = (_local_xfB.q.c * localPointB.x - _local_xfB.q.s * localPointB.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * localPointB.x + _local_xfB.q.c * localPointB.y) + _local_xfB.p.y;
                var separation = (pointBx - pointAx) * normalx + (pointBy - pointAy) * normaly;
                return separation;
            case b2SeparationFunction.e_faceB:
                var normalx = _local_xfB.q.c * this.m_axis.x - _local_xfB.q.s * this.m_axis.y;
                var normaly = _local_xfB.q.s * this.m_axis.x + _local_xfB.q.c * this.m_axis.y;
                var pointBx = (_local_xfB.q.c * this.m_localPoint.x - _local_xfB.q.s * this.m_localPoint.y) + _local_xfB.p.x;
                var pointBy = (_local_xfB.q.s * this.m_localPoint.x + _local_xfB.q.c * this.m_localPoint.y) + _local_xfB.p.y;
                var localPointA = this.m_proxyA.GetVertex(indexA);
                var pointAx = (_local_xfA.q.c * localPointA.x - _local_xfA.q.s * localPointA.y) + _local_xfA.p.x;
                var pointAy = (_local_xfA.q.s * localPointA.x + _local_xfA.q.c * localPointA.y) + _local_xfA.p.y;
                var separation = (pointAx - pointBx) * normalx + (pointAy - pointBy) * normaly;
                return separation
        }
    }
};
b2SeparationFunction.e_points = 0;
b2SeparationFunction.e_faceA = 1;
b2SeparationFunction.e_faceB = 2;
var profile_toi = b2Profiler.create("toi", "solveTOI");

function b2TimeOfImpact(output, input) {
    profile_toi.start();
    ++b2TimeOfImpact.b2_toiCalls;
    output.state = b2TOIOutput.e_unknown;
    output.t = input.tMax;
    var proxyA = input.proxyA;
    var proxyB = input.proxyB;
    b2TimeOfImpact._temp_sweepA.Assign(input.sweepA);
    b2TimeOfImpact._temp_sweepB.Assign(input.sweepB);
    b2TimeOfImpact._temp_sweepA.Normalize();
    b2TimeOfImpact._temp_sweepB.Normalize();
    var tMax = input.tMax;
    var totalRadius = proxyA.m_radius + proxyB.m_radius;
    var target = b2Max(b2_linearSlop, totalRadius - 3 * b2_linearSlop);
    var tolerance = 0.25 * b2_linearSlop;
    var t1 = 0;
    var k_maxIterations = 20;
    var iter = 0;
    var cache = new b2SimplexCache();
    cache.count = 0;
    var distanceInput = new b2DistanceInput();
    distanceInput.proxyA.Assign(input.proxyA);
    distanceInput.proxyB.Assign(input.proxyB);
    distanceInput.useRadii = false;
    for (;;) {
        b2TimeOfImpact._temp_sweepA.GetTransform(distanceInput.transformA, t1);
        b2TimeOfImpact._temp_sweepB.GetTransform(distanceInput.transformB, t1);
        var distanceOutput = new b2DistanceOutput();
        b2DistanceFunc(distanceOutput, cache, distanceInput);
        if (distanceOutput.distance <= 0) {
            output.state = b2TOIOutput.e_overlapped;
            output.t = 0;
            break
        }
        if (distanceOutput.distance < target + tolerance) {
            output.state = b2TOIOutput.e_touching;
            output.t = t1;
            break
        }
        var fcn = new b2SeparationFunction();
        fcn.Initialize(cache, proxyA, b2TimeOfImpact._temp_sweepA, proxyB, b2TimeOfImpact._temp_sweepB, t1);
        var done = false;
        var t2 = tMax;
        var pushBackIter = 0;
        for (;;) {
            var indices = [];
            var s2 = fcn.FindMinSeparation(indices, t2);
            if (s2 > target + tolerance) {
                output.state = b2TOIOutput.e_separated;
                output.t = tMax;
                done = true;
                break
            }
            if (s2 > target - tolerance) {
                t1 = t2;
                break
            }
            var s1 = fcn.Evaluate(indices[0], indices[1], t1);
            if (s1 < target - tolerance) {
                output.state = b2TOIOutput.e_failed;
                output.t = t1;
                done = true;
                break
            }
            if (s1 <= target + tolerance) {
                output.state = b2TOIOutput.e_touching;
                output.t = t1;
                done = true;
                break
            }
            var rootIterCount = 0;
            var a1 = t1,
                a2 = t2;
            for (;;) {
                var t;
                if (rootIterCount & 1) {
                    t = a1 + (target - s1) * (a2 - a1) / (s2 - s1)
                } else {
                    t = 0.5 * (a1 + a2)
                }++rootIterCount;
                ++b2TimeOfImpact.b2_toiRootIters;
                var s = fcn.Evaluate(indices[0], indices[1], t);
                if (b2Abs(s - target) < tolerance) {
                    t2 = t;
                    break
                }
                if (s > target) {
                    a1 = t;
                    s1 = s
                } else {
                    a2 = t;
                    s2 = s
                }
                if (rootIterCount == 50) {
                    break
                }
            }
            b2TimeOfImpact.b2_toiMaxRootIters = b2Max(b2TimeOfImpact.b2_toiMaxRootIters, rootIterCount);
            ++pushBackIter;
            if (pushBackIter == b2_maxPolygonVertices) {
                break
            }
        }++iter;
        ++b2TimeOfImpact.b2_toiIters;
        if (done) {
            break
        }
        if (iter == k_maxIterations) {
            output.state = b2TOIOutput.e_failed;
            output.t = t1;
            break
        }
    }
    b2TimeOfImpact.b2_toiMaxIters = b2Max(b2TimeOfImpact.b2_toiMaxIters, iter);
    profile_toi.stop();
    b2TimeOfImpact.b2_toiMaxTime = b2Max(b2TimeOfImpact.b2_toiMaxTime, profile_toi.elapsedTime);
    b2TimeOfImpact.b2_toiTime += profile_toi.elapsedTime
}
b2TimeOfImpact._temp_sweepA = new b2Sweep();
b2TimeOfImpact._temp_sweepB = new b2Sweep();
b2TimeOfImpact.b2_toiTime = 0;
b2TimeOfImpact.b2_toiMaxTime = 0;
b2TimeOfImpact.b2_toiCalls = 0;
b2TimeOfImpact.b2_toiIters = 0;
b2TimeOfImpact.b2_toiMaxIters = 0;
b2TimeOfImpact.b2_toiRootIters = 0;
b2TimeOfImpact.b2_toiMaxRootIters = 0;
"use strict";

function b2BodyDef() {
    this.type = b2Body.b2_staticBody;
    this.position = new b2Vec2(0, 0);
    this.angle = 0;
    this.linearVelocity = new b2Vec2(0, 0);
    this.angularVelocity = 0;
    this.linearDamping = 0;
    this.angularDamping = 0;
    this.allowSleep = true;
    this.awake = true;
    this.fixedRotation = false;
    this.bullet = false;
    this.active = true;
    this.userData = null;
    this.gravityScale = 1;
    Object.seal(this)
}
b2BodyDef.prototype = {
    _deserialize: function (data) {
        this.type = data.type;
        this.position._deserialize(data.position);
        this.angle = data.angle;
        this.linearVelocity._deserialize(data.linearVelocity);
        this.angularVelocity = data.angularVelocity;
        this.linearDamping = data.linearDamping;
        this.angularDamping = data.angularDamping;
        this.allowSleep = data.allowSleep;
        this.awake = data.awake;
        this.fixedRotation = data.fixedRotation;
        this.bullet = data.bullet;
        this.active = data.active;
        this.gravityScale = data.gravityScale
    }
};

function b2Body(bd, world) {
    this.m_islandIndex = 0;
    this.m_flags = 0;
    if (bd.bullet) {
        this.m_flags |= b2Body.e_bulletFlag
    }
    if (bd.fixedRotation) {
        this.m_flags |= b2Body.e_fixedRotationFlag
    }
    if (bd.allowSleep) {
        this.m_flags |= b2Body.e_autoSleepFlag
    }
    if (bd.awake) {
        this.m_flags |= b2Body.e_awakeFlag
    }
    if (bd.active) {
        this.m_flags |= b2Body.e_activeFlag
    }
    this.m_world = world;
    this.m_xf = new b2Transform();
    this.m_xf.p.Assign(bd.position);
    this.m_xf.q.Set(bd.angle);
    this.m_sweep = new b2Sweep();
    this.m_sweep.localCenter.SetZero();
    this.m_sweep.c0.Assign(this.m_xf.p);
    this.m_sweep.c.Assign(this.m_xf.p);
    this.m_sweep.a0 = bd.angle;
    this.m_sweep.a = bd.angle;
    this.m_sweep.alpha0 = 0;
    this.m_jointList = null;
    this.m_contactList = null;
    this.m_prev = null;
    this.m_next = null;
    this.m_linearVelocity = bd.linearVelocity.Clone();
    this.m_angularVelocity = bd.angularVelocity;
    this.m_linearDamping = bd.linearDamping;
    this.m_angularDamping = bd.angularDamping;
    this.m_gravityScale = bd.gravityScale;
    this.m_force = new b2Vec2();
    this.m_torque = 0;
    this.m_sleepTime = 0;
    this.m_type = bd.type;
    if (this.m_type == b2Body.b2_dynamicBody) {
        this.m_mass = 1;
        this.m_invMass = 1
    } else {
        this.m_mass = 0;
        this.m_invMass = 0
    }
    this.m_I = 0;
    this.m_invI = 0;
    this.m_userData = bd.userData;
    this.m_fixtureList = null;
    this.m_fixtureCount = 0
}
b2Body.b2_staticBody = 0;
b2Body.b2_kinematicBody = 1;
b2Body.b2_dynamicBody = 2;
b2Body.e_islandFlag = 1;
b2Body.e_awakeFlag = 2;
b2Body.e_autoSleepFlag = 4;
b2Body.e_bulletFlag = 8;
b2Body.e_fixedRotationFlag = 16;
b2Body.e_activeFlag = 32;
b2Body.e_toiFlag = 64;
b2Body.m_local_oldCenter = new b2Vec2();
b2Body.m_local_xf1 = new b2Transform();
b2Body.prototype = {
    CreateFixture: function (def, density) {
        if (typeof (density) !== "undefined") {
            var ndef = new b2FixtureDef();
            ndef.shape = def;
            ndef.density = density;
            return this.CreateFixture(ndef)
        }
        if (this.m_world.IsLocked() == true) {
            return null
        }
        var fixture = new b2Fixture();
        fixture.Create(this, def);
        if (this.m_flags & b2Body.e_activeFlag) {
            var broadPhase = this.m_world.m_contactManager.m_broadPhase;
            fixture.CreateProxies(broadPhase, this.m_xf)
        }
        fixture.m_next = this.m_fixtureList;
        this.m_fixtureList = fixture;
        ++this.m_fixtureCount;
        fixture.m_body = this;
        if (fixture.m_density > 0) {
            this.ResetMassData()
        }
        this.m_world.m_flags |= b2World.e_newFixture;
        return fixture
    },
    DestroyFixture: function (fixture) {
        if (this.m_world.IsLocked() == true) {
            return
        }
        var node = this.m_fixtureList;
        var found = false;
        while (node != null) {
            if (node == fixture) {
                this.m_fixtureList = node = fixture.m_next;
                found = true;
                break
            }
            node = node.m_next
        }
        var edge = this.m_contactList;
        while (edge) {
            var c = edge.contact;
            edge = edge.next;
            var fixtureA = c.GetFixtureA();
            var fixtureB = c.GetFixtureB();
            if (fixture == fixtureA || fixture == fixtureB) {
                this.m_world.m_contactManager.Destroy(c)
            }
        }
        if (this.m_flags & b2Body.e_activeFlag) {
            var broadPhase = this.m_world.m_contactManager.m_broadPhase;
            fixture.DestroyProxies(broadPhase)
        }
        fixture.Destroy();
        fixture.m_body = null;
        fixture.m_next = null;
        --this.m_fixtureCount;
        this.ResetMassData()
    },
    SetTransform: function (position, angle) {
        if (this.m_world.IsLocked() == true) {
            return
        }
        this.m_xf.q.Set(angle);
        this.m_xf.p.Assign(position);
        this.m_sweep.c.Assign(b2Mul_t_v2(this.m_xf, this.m_sweep.localCenter));
        this.m_sweep.a = angle;
        this.m_sweep.c0.Assign(this.m_sweep.c);
        this.m_sweep.a0 = angle;
        var broadPhase = this.m_world.m_contactManager.m_broadPhase;
        for (var f = this.m_fixtureList; f; f = f.m_next) {
            f.Synchronize(broadPhase, this.m_xf, this.m_xf)
        }
    },
    GetTransform: function () {
        return this.m_xf
    },
    GetPosition: function () {
        return this.m_xf.p
    },
    GetAngle: function () {
        return this.m_sweep.a
    },
    GetWorldCenter: function () {
        return this.m_sweep.c
    },
    GetLocalCenter: function () {
        return this.m_sweep.localCenter
    },
    SetLinearVelocity: function (v) {
        if (this.m_type == b2Body.b2_staticBody) {
            return
        }
        if (b2Dot_v2_v2(v, v) > 0) {
            this.SetAwake(true)
        }
        this.m_linearVelocity = v
    },
    GetLinearVelocity: function () {
        return this.m_linearVelocity
    },
    SetAngularVelocity: function (w) {
        if (this.m_type == b2Body.b2_staticBody) {
            return
        }
        if (w * w > 0) {
            this.SetAwake(true)
        }
        this.m_angularVelocity = w
    },
    GetAngularVelocity: function () {
        return this.m_angularVelocity
    },
    ApplyForce: function (force, point, wake) {
        if (this.m_type != b2Body.b2_dynamicBody) {
            return
        }
        if (wake && (this.m_flags & b2Body.e_awakeFlag) == 0) {
            this.SetAwake(true)
        }
        if (this.m_flags & b2Body.e_awakeFlag) {
            this.m_force.Add(force);
            this.m_torque += b2Cross_v2_v2(b2Vec2.Subtract(point, this.m_sweep.c), force)
        }
    },
    ApplyForceToCenter: function (force, wake) {
        if (this.m_type != b2Body.b2_dynamicBody) {
            return
        }
        if (wake && (this.m_flags & b2Body.e_awakeFlag) == 0) {
            this.SetAwake(true)
        }
        if (this.m_flags & b2Body.e_awakeFlag) {
            this.m_force.Add(force)
        }
    },
    ApplyTorque: function (torque, wake) {
        if (this.m_type != b2Body.b2_dynamicBody) {
            return
        }
        if (wake && (this.m_flags & b2Body.e_awakeFlag) == 0) {
            this.SetAwake(true)
        }
        if (this.m_flags & b2Body.e_awakeFlag) {
            this.m_torque += torque
        }
    },
    ApplyLinearImpulse: function (impulse, point, wake) {
        if (this.m_type != b2Body.b2_dynamicBody) {
            return
        }
        if (wake && (this.m_flags & b2Body.e_awakeFlag) == 0) {
            this.SetAwake(true)
        }
        if (this.m_flags & b2Body.e_awakeFlag) {
            this.m_linearVelocity.Add(b2Vec2.Multiply(this.m_invMass, impulse));
            this.m_angularVelocity += this.m_invI * b2Cross_v2_v2(b2Vec2.Subtract(point, this.m_sweep.c), impulse)
        }
    },
    ApplyAngularImpulse: function (impulse, wake) {
        if (this.m_type != b2Body.b2_dynamicBody) {
            return
        }
        if (wake && (this.m_flags & b2Body.e_awakeFlag) == 0) {
            this.SetAwake(true)
        }
        if (this.m_flags & b2Body.e_awakeFlag) {
            this.m_angularVelocity += this.m_invI * impulse
        }
    },
    GetMass: function () {
        return this.m_mass
    },
    GetInertia: function () {
        return this.m_I + this.m_mass * b2Dot_v2_v2(this.m_sweep.localCenter, this.m_sweep.localCenter)
    },
    GetMassData: function (data) {
        data.mass = this.m_mass;
        data.I = this.m_I + this.m_mass * b2Dot_v2_v2(this.m_sweep.localCenter, this.m_sweep.localCenter);
        data.center = this.m_sweep.localCenter
    },
    SetMassData: function (massData) {
        if (this.m_world.IsLocked() == true) {
            return
        }
        if (this.m_type != b2Body.b2_dynamicBody) {
            return
        }
        this.m_invMass = 0;
        this.m_I = 0;
        this.m_invI = 0;
        this.m_mass = massData.mass;
        if (this.m_mass <= 0) {
            this.m_mass = 1
        }
        this.m_invMass = 1 / this.m_mass;
        if (massData.I > 0 && (this.m_flags & b2Body.e_fixedRotationFlag) == 0) {
            this.m_I = massData.I - this.m_mass * b2Dot_v2_v2(massData.center, massData.center);
            this.m_invI = 1 / this.m_I
        }
        b2Body.m_local_oldCenter.Assign(this.m_sweep.c);
        this.m_sweep.localCenter.Assign(massData.center);
        this.m_sweep.c0.Assign(b2Mul_t_v2(this.m_xf, this.m_sweep.localCenter));
        this.m_sweep.c.Assign(this.m_sweep.c0);
        this.m_linearVelocity.Add(b2Cross_f_v2(this.m_angularVelocity, b2Vec2.Subtract(this.m_sweep.c, b2Body.m_local_oldCenter)))
    },
    ResetMassData: function () {
        this.m_mass = 0;
        this.m_invMass = 0;
        this.m_I = 0;
        this.m_invI = 0;
        this.m_sweep.localCenter.SetZero();
        if (this.m_type == b2Body.b2_staticBody || this.m_type == b2Body.b2_kinematicBody) {
            this.m_sweep.c0.Assign(this.m_xf.p);
            this.m_sweep.c.Assign(this.m_xf.p);
            this.m_sweep.a0 = this.m_sweep.a;
            return
        }
        var localCenter = new b2Vec2(0, 0);
        for (var f = this.m_fixtureList; f; f = f.m_next) {
            if (f.m_density == 0) {
                continue
            }
            var massData = new b2MassData();
            f.GetMassData(massData);
            this.m_mass += massData.mass;
            localCenter.Add(b2Vec2.Multiply(massData.mass, massData.center));
            this.m_I += massData.I
        }
        if (this.m_mass > 0) {
            this.m_invMass = 1 / this.m_mass;
            localCenter.Multiply(this.m_invMass)
        } else {
            this.m_mass = 1;
            this.m_invMass = 1
        }
        if (this.m_I > 0 && (this.m_flags & b2Body.e_fixedRotationFlag) == 0) {
            this.m_I -= this.m_mass * b2Dot_v2_v2(localCenter, localCenter);
            this.m_invI = 1 / this.m_I
        } else {
            this.m_I = 0;
            this.m_invI = 0
        }
        b2Body.m_local_oldCenter.Assign(this.m_sweep.c);
        this.m_sweep.localCenter.Assign(localCenter);
        this.m_sweep.c0.Assign(b2Mul_t_v2(this.m_xf, this.m_sweep.localCenter));
        this.m_sweep.c.Assign(this.m_sweep.c0);
        this.m_linearVelocity.Add(b2Cross_f_v2(this.m_angularVelocity, b2Vec2.Subtract(this.m_sweep.c, b2Body.m_local_oldCenter)))
    },
    GetWorldPoint: function (localPoint) {
        return b2Mul_t_v2(this.m_xf, localPoint)
    },
    GetWorldVector: function (localVector) {
        return b2Mul_r_v2(this.m_xf.q, localVector)
    },
    GetLocalPoint: function (worldPoint) {
        return b2MulT_t_v2(this.m_xf, worldPoint)
    },
    GetLocalVector: function (worldVector) {
        return b2MulT_r_v2(this.m_xf.q, worldVector)
    },
    GetLinearVelocityFromWorldPoint: function (worldPoint) {
        return b2Vec2.Add(this.m_linearVelocity, b2Cross_f_v2(this.m_angularVelocity, b2Vec2.Subtract(worldPoint, this.m_sweep.c)))
    },
    GetLinearVelocityFromLocalPoint: function (localPoint) {
        return this.GetLinearVelocityFromWorldPoint(this.GetWorldPoint(localPoint))
    },
    GetLinearDamping: function () {
        return this.m_linearDamping
    },
    SetLinearDamping: function (linearDamping) {
        this.m_linearDamping = linearDamping
    },
    GetAngularDamping: function () {
        return this.m_angularDamping
    },
    SetAngularDamping: function (angularDamping) {
        this.m_angularDamping = angularDamping
    },
    GetGravityScale: function () {
        return this.m_gravityScale
    },
    SetGravityScale: function (scale) {
        this.m_gravityScale = scale
    },
    SetType: function (type) {
        if (this.m_world.IsLocked() == true) {
            return
        }
        if (this.m_type == type) {
            return
        }
        this.m_type = type;
        this.ResetMassData();
        if (this.m_type == b2Body.b2_staticBody) {
            this.m_linearVelocity.SetZero();
            this.m_angularVelocity = 0;
            this.m_sweep.a0 = this.m_sweep.a;
            this.m_sweep.c0.Assign(this.m_sweep.c);
            this.SynchronizeFixtures()
        }
        this.SetAwake(true);
        this.m_force.SetZero();
        this.m_torque = 0;
        var ce = this.m_contactList;
        while (ce) {
            var ce0 = ce;
            ce = ce.next;
            this.m_world.m_contactManager.Destroy(ce0.contact)
        }
        this.m_contactList = null;
        var broadPhase = this.m_world.m_contactManager.m_broadPhase;
        for (var f = this.m_fixtureList; f; f = f.m_next) {
            var proxyCount = f.m_proxyCount;
            for (var i = 0; i < proxyCount; ++i) {
                broadPhase.TouchProxy(f.m_proxies[i].proxyId)
            }
        }
    },
    GetType: function () {
        return this.m_type
    },
    SetBullet: function (flag) {
        if (flag) {
            this.m_flags |= b2Body.e_bulletFlag
        } else {
            this.m_flags &= ~b2Body.e_bulletFlag
        }
    },
    IsBullet: function () {
        return (this.m_flags & b2Body.e_bulletFlag) == b2Body.e_bulletFlag
    },
    SetSleepingAllowed: function (flag) {
        if (flag) {
            this.m_flags |= b2Body.e_autoSleepFlag
        } else {
            this.m_flags &= ~b2Body.e_autoSleepFlag;
            this.SetAwake(true)
        }
    },
    IsSleepingAllowed: function () {
        return (this.m_flags & b2Body.e_autoSleepFlag) == b2Body.e_autoSleepFlag
    },
    SetAwake: function (flag) {
        if (flag) {
            if ((this.m_flags & b2Body.e_awakeFlag) == 0) {
                this.m_flags |= b2Body.e_awakeFlag;
                this.m_sleepTime = 0
            }
        } else {
            this.m_flags &= ~b2Body.e_awakeFlag;
            this.m_sleepTime = 0;
            this.m_linearVelocity.SetZero();
            this.m_angularVelocity = 0;
            this.m_force.SetZero();
            this.m_torque = 0
        }
    },
    IsAwake: function () {
        return (this.m_flags & b2Body.e_awakeFlag) == b2Body.e_awakeFlag
    },
    SetActive: function (flag) {
        if (flag == this.IsActive()) {
            return
        }
        if (flag) {
            this.m_flags |= b2Body.e_activeFlag;
            var broadPhase = this.m_world.m_contactManager.m_broadPhase;
            for (var f = this.m_fixtureList; f; f = f.m_next) {
                f.CreateProxies(broadPhase, this.m_xf)
            }
        } else {
            this.m_flags &= ~b2Body.e_activeFlag;
            var broadPhase = this.m_world.m_contactManager.m_broadPhase;
            for (var f = this.m_fixtureList; f; f = f.m_next) {
                f.DestroyProxies(broadPhase)
            }
            var ce = this.m_contactList;
            while (ce) {
                var ce0 = ce;
                ce = ce.next;
                this.m_world.m_contactManager.Destroy(ce0.contact)
            }
            this.m_contactList = null
        }
    },
    IsActive: function () {
        return (this.m_flags & b2Body.e_activeFlag) == b2Body.e_activeFlag
    },
    SetFixedRotation: function (flag) {
        var status = (this.m_flags & b2Body.e_fixedRotationFlag) == b2Body.e_fixedRotationFlag;
        if (status == flag) {
            return
        }
        if (flag) {
            this.m_flags |= b2Body.e_fixedRotationFlag
        } else {
            this.m_flags &= ~b2Body.e_fixedRotationFlag
        }
        this.m_angularVelocity = 0;
        this.ResetMassData()
    },
    IsFixedRotation: function () {
        return (this.m_flags & b2Body.e_fixedRotationFlag) == b2Body.e_fixedRotationFlag
    },
    GetFixtureList: function () {
        return this.m_fixtureList
    },
    GetJointList: function () {
        return this.m_jointList
    },
    GetContactList: function () {
        return this.m_contactList
    },
    GetNext: function () {
        return this.m_next
    },
    GetUserData: function () {
        return this.m_userData
    },
    SetUserData: function (data) {
        this.m_userData = data
    },
    GetWorld: function () {
        return this.m_world
    },
    SynchronizeFixtures: function () {
        b2Body.m_local_xf1.q.Set(this.m_sweep.a0);
        b2Body.m_local_xf1.p.Assign(b2Vec2.Subtract(this.m_sweep.c0, b2Mul_r_v2(b2Body.m_local_xf1.q, this.m_sweep.localCenter)));
        var broadPhase = this.m_world.m_contactManager.m_broadPhase;
        for (var f = this.m_fixtureList; f; f = f.m_next) {
            f.Synchronize(broadPhase, b2Body.m_local_xf1, this.m_xf)
        }
    },
    SynchronizeTransform: function () {
        this.m_xf.q.Set(this.m_sweep.a);
        this.m_xf.p.Assign(b2Vec2.Subtract(this.m_sweep.c, b2Mul_r_v2(this.m_xf.q, this.m_sweep.localCenter)))
    },
    ShouldCollide: function (other) {
        if (this.m_type != b2Body.b2_dynamicBody && other.m_type != b2Body.b2_dynamicBody) {
            return false
        }
        for (var jn = this.m_jointList; jn; jn = jn.next) {
            if (jn.other == other) {
                if (jn.joint.m_collideConnected == false) {
                    return false
                }
            }
        }
        return true
    },
    Advance: function (alpha) {
        this.m_sweep.Advance(alpha);
        this.m_sweep.c.Assign(this.m_sweep.c0);
        this.m_sweep.a = this.m_sweep.a0;
        this.m_xf.q.Set(this.m_sweep.a);
        this.m_xf.p.Assign(b2Vec2.Subtract(this.m_sweep.c, b2Mul_r_v2(this.m_xf.q, this.m_sweep.localCenter)))
    },
    _serialize: function (out) {
        var obj = out || {};
        obj.fixtures = null;
        obj.type = this.m_type;
        obj.position = this.GetPosition()._serialize();
        obj.angle = this.GetAngle();
        obj.linearVelocity = this.GetLinearVelocity()._serialize();
        obj.angularVelocity = this.GetAngularVelocity();
        obj.linearDamping = this.GetLinearDamping();
        obj.angularDamping = this.GetAngularDamping();
        obj.allowSleep = this.IsSleepingAllowed();
        obj.awake = this.IsAwake();
        obj.fixedRotation = this.IsFixedRotation();
        obj.bullet = this.IsBullet();
        obj.active = this.IsActive();
        obj.gravityScale = this.GetGravityScale();
        return obj
    }
};
"use strict";

function b2Filter() {
    this.categoryBits = 1;
    this.maskBits = 65535;
    this.groupIndex = 0
}
b2Filter.prototype = {
    Clone: function () {
        var filter = new b2Filter();
        filter.categoryBits = this.categoryBits;
        filter.maskBits = this.maskBits;
        filter.groupIndex = this.groupIndex;
        return filter
    },
    Assign: function (filter) {
        this.categoryBits = filter.categoryBits;
        this.maskBits = filter.maskBits;
        this.groupIndex = filter.groupIndex
    },
    _serialize: function (out) {
        var obj = out || {};
        obj.categoryBits = this.categoryBits;
        obj.maskBits = this.maskBits;
        obj.groupIndex = this.groupIndex;
        return obj
    },
    _deserialize: function (data) {
        this.categoryBits = data.categoryBits;
        this.maskBits = data.maskBits;
        this.groupIndex = data.groupIndex
    }
};

function b2FixtureDef() {
    this.shape = null;
    this.userData = null;
    this.friction = 0.2;
    this.restitution = 0;
    this.density = 0;
    this.isSensor = false;
    this.filter = new b2Filter();
    Object.seal(this)
}
b2FixtureDef.prototype = {
    _deserialize: function (data) {
        this.friction = data.friction;
        this.restitution = data.restitution;
        this.density = data.density;
        this.isSensor = data.isSensor;
        this.filter._deserialize(data.filter)
    }
};

function b2FixtureProxy() {
    this.aabb = new b2AABB();
    this.fixture = null;
    this.childIndex = 0;
    this.proxyId = 0
}

function b2Fixture() {
    this.m_userData = null;
    this.m_body = null;
    this.m_next = null;
    this.m_proxies = null;
    this.m_proxyCount = 0;
    this.m_shape = null;
    this.m_density = 0;
    this.m_filter = new b2Filter();
    this.m_isSensor = false;
    this.m_friction = 0;
    this.m_restitution = 0
}
b2Fixture.prototype = {
    GetType: function () {
        return this.m_shape.GetType()
    },
    GetShape: function () {
        return this.m_shape
    },
    SetSensor: function (sensor) {
        if (sensor != this.m_isSensor) {
            this.m_body.SetAwake(true);
            this.m_isSensor = sensor
        }
    },
    IsSensor: function () {
        return this.m_isSensor
    },
    SetFilterData: function (filter) {
        this.m_filter = filter;
        this.Refilter()
    },
    GetFilterData: function () {
        return this.m_filter
    },
    Refilter: function () {
        if (this.m_body == null) {
            return
        }
        var edge = this.m_body.GetContactList();
        while (edge) {
            var contact = edge.contact;
            var fixtureA = contact.GetFixtureA();
            var fixtureB = contact.GetFixtureB();
            if (fixtureA == this || fixtureB == this) {
                contact.FlagForFiltering()
            }
            edge = edge.next
        }
        var world = this.m_body.GetWorld();
        if (world == null) {
            return
        }
        var broadPhase = world.m_contactManager.m_broadPhase;
        for (var i = 0; i < this.m_proxyCount; ++i) {
            broadPhase.TouchProxy(this.m_proxies[i].proxyId)
        }
    },
    GetBody: function () {
        return this.m_body
    },
    GetNext: function () {
        return this.m_next
    },
    GetUserData: function () {
        return this.m_userData
    },
    SetUserData: function (data) {
        this.m_userData = data
    },
    TestPoint: function (p) {
        return this.m_shape.TestPoint(this.m_body.GetTransform(), p)
    },
    RayCast: function (output, input, childIndex) {
        return this.m_shape.RayCast(output, input, this.m_body.GetTransform(), childIndex)
    },
    GetMassData: function (massData) {
        this.m_shape.ComputeMass(massData, this.m_density)
    },
    SetDensity: function (density) {
        this.m_density = density
    },
    GetDensity: function () {
        return this.m_density
    },
    GetFriction: function () {
        return this.m_friction
    },
    SetFriction: function (friction) {
        this.m_friction = friction
    },
    GetRestitution: function () {
        return this.m_restitution
    },
    SetRestitution: function (restitution) {
        this.m_restitution = restitution
    },
    GetAABB: function (childIndex) {
        return this.m_proxies[childIndex].aabb
    },
    Create: function (body, def) {
        this.m_userData = def.userData;
        this.m_friction = def.friction;
        this.m_restitution = def.restitution;
        this.m_body = body;
        this.m_next = null;
        this.m_filter.Assign(def.filter);
        this.m_isSensor = def.isSensor;
        this.m_shape = def.shape.Clone();
        var childCount = this.m_shape.GetChildCount();
        this.m_proxies = new Array(childCount);
        for (var i = 0; i < childCount; ++i) {
            this.m_proxies[i] = new b2FixtureProxy();
            this.m_proxies[i].fixture = null;
            this.m_proxies[i].proxyId = b2BroadPhase.e_nullProxy
        }
        this.m_proxyCount = 0;
        this.m_density = def.density
    },
    Destroy: function () {
        this.m_proxies = null;
        this.m_shape = null
    },
    CreateProxies: function (broadPhase, xf) {
        this.m_proxyCount = this.m_shape.GetChildCount();
        for (var i = 0; i < this.m_proxyCount; ++i) {
            var proxy = this.m_proxies[i];
            this.m_shape.ComputeAABB(proxy.aabb, xf, i);
            proxy.proxyId = broadPhase.CreateProxy(proxy.aabb, proxy);
            proxy.fixture = this;
            proxy.childIndex = i
        }
    },
    DestroyProxies: function (broadPhase) {
        for (var i = 0; i < this.m_proxyCount; ++i) {
            var proxy = this.m_proxies[i];
            broadPhase.DestroyProxy(proxy.proxyId);
            proxy.proxyId = b2BroadPhase.e_nullProxy
        }
        this.m_proxyCount = 0
    },
    Synchronize: function (broadPhase, transform1, transform2) {
        if (this.m_proxyCount == 0) {
            return
        }
        for (var i = 0; i < this.m_proxyCount; ++i) {
            var proxy = this.m_proxies[i];
            var aabb1 = new b2AABB(),
                aabb2 = new b2AABB();
            this.m_shape.ComputeAABB(aabb1, transform1, proxy.childIndex);
            this.m_shape.ComputeAABB(aabb2, transform2, proxy.childIndex);
            proxy.aabb.Combine(aabb1, aabb2);
            var displacement = b2Vec2.Subtract(transform2.p, transform1.p);
            broadPhase.MoveProxy(proxy.proxyId, proxy.aabb, displacement)
        }
    },
    _serialize: function (out) {
        var obj = out || {};
        obj.shape = null;
        obj.friction = this.m_friction;
        obj.restitution = this.m_restitution;
        obj.density = this.m_density;
        obj.isSensor = this.m_isSensor;
        obj.filter = this.m_filter._serialize();
        return obj
    }
};
"use strict";

function b2DestructionListener() {}
b2DestructionListener.prototype = {
    SayGoodbyeJoint: function (joint) {},
    SayGoodbyeFixture: function (fixture) {}
};

function b2ContactFilter() {}
b2ContactFilter.prototype = {
    ShouldCollide: function (fixtureA, fixtureB) {
        var filterA = fixtureA.GetFilterData();
        var filterB = fixtureB.GetFilterData();
        if (filterA.groupIndex == filterB.groupIndex && filterA.groupIndex != 0) {
            return filterA.groupIndex > 0
        }
        var collide = (filterA.maskBits & filterB.categoryBits) != 0 && (filterA.categoryBits & filterB.maskBits) != 0;
        return collide
    }
};

function b2ContactImpulse() {
    this.normalImpulses = new Array(b2_maxManifoldPoints);
    this.tangentImpulses = new Array(b2_maxManifoldPoints);
    this.count = 0
}

function b2ContactListener() {}
b2ContactListener.prototype = {
    BeginContact: function (contact) {},
    EndContact: function (contact) {},
    PreSolve: function (contact, oldManifold) {},
    PostSolve: function (contact, impulse) {}
};

function b2QueryCallback() {}
b2QueryCallback.prototype = {
    ReportFixture: function (fixture) {}
};

function b2RayCastCallback() {}
b2RayCastCallback.prototype = {
    ReportFixture: function (fixture, point, normal, fraction) {}
};
"use strict";

function b2TimeStep() {
    this.dt = 0;
    this.inv_dt = 0;
    this.dtRatio = 0;
    this.velocityIterations = 0;
    this.positionIterations = 0;
    this.warmStarting = false
}

function b2Position() {
    this.c = new b2Vec2();
    this.a = 0
}

function b2Velocity() {
    this.v = new b2Vec2();
    this.w = 0
}

function b2SolverData() {
    this.step = new b2TimeStep();
    this.positions = null;
    this.velocities = null
}
"use strict";
var profile_world_step = b2Profiler.create("step");
var profile_world_collide = b2Profiler.create("collide", "step");
var profile_world_solve = b2Profiler.create("solve", "step");
var profile_world_solveTOI = b2Profiler.create("solveTOI", "step");
var profile_world_broadphase = b2Profiler.create("broadphase", "step");

function b2World(gravity) {
    this.m_contactManager = new b2ContactManager();
    this.m_destructionListener = null;
    this.g_debugDraw = null;
    this.m_bodyList = null;
    this.m_jointList = null;
    this.m_bodyCount = 0;
    this.m_jointCount = 0;
    this.m_warmStarting = true;
    this.m_continuousPhysics = true;
    this.m_subStepping = false;
    this.m_stepComplete = true;
    this.m_allowSleep = true;
    this.m_gravity = gravity;
    this.m_flags = b2World.e_clearForces;
    this.m_inv_dt0 = 0;
    this.p_step = new b2TimeStep();
    this.p_island = new b2Island()
}

function b2WorldQueryWrapper() {
    this.broadPhase = null;
    this.callback = null
}
b2WorldQueryWrapper.prototype = {
    QueryCallback: function (proxyId) {
        var proxy = this.broadPhase.GetUserData(proxyId);
        return this.callback.ReportFixture(proxy.fixture)
    }
};

function b2WorldRayCastWrapper() {
    this.broadPhase = null;
    this.callback = null
}
b2WorldRayCastWrapper.prototype = {
    RayCastCallback: function (input, proxyId) {
        var userData = this.broadPhase.GetUserData(proxyId);
        var proxy = userData;
        var fixture = proxy.fixture;
        var index = proxy.childIndex;
        var output = new b2RayCastOutput();
        var hit = fixture.RayCast(output, input, index);
        if (hit) {
            var fraction = output.fraction;
            var point = b2Vec2.Add(b2Vec2.Multiply((1 - fraction), input.p1), b2Vec2.Multiply(fraction, input.p2));
            return this.callback.ReportFixture(fixture, point, output.normal, fraction)
        }
        return input.maxFraction
    }
};
b2World.m_local_sweep_backupA = new b2Sweep();
b2World.m_local_sweep_backupB = new b2Sweep();
b2World.m_local_sweep_backupC = new b2Sweep();
b2World.prototype = {
    Destroy: function () {
        var b = this.m_bodyList;
        while (b) {
            var bNext = b.m_next;
            var f = b.m_fixtureList;
            while (f) {
                var fNext = f.m_next;
                f.m_proxyCount = 0;
                f.Destroy();
                f = fNext
            }
            b = bNext
        }
    },
    SetDestructionListener: function (listener) {
        this.m_destructionListener = listener
    },
    SetContactFilter: function (filter) {
        this.m_contactManager.m_contactFilter = filter
    },
    SetContactListener: function (listener) {
        this.m_contactManager.m_contactListener = listener
    },
    SetDebugDraw: function (debugDraw) {
        this.g_debugDraw = debugDraw
    },
    CreateBody: function (def) {
        if (this.IsLocked()) {
            return null
        }
        var b = new b2Body(def, this);
        b.m_prev = null;
        b.m_next = this.m_bodyList;
        if (this.m_bodyList) {
            this.m_bodyList.m_prev = b
        }
        this.m_bodyList = b;
        ++this.m_bodyCount;
        return b
    },
    DestroyBody: function (b) {
        if (this.IsLocked()) {
            return
        }
        var je = b.m_jointList;
        while (je) {
            var je0 = je;
            je = je.next;
            if (this.m_destructionListener) {
                this.m_destructionListener.SayGoodbyeJoint(je0.joint)
            }
            this.DestroyJoint(je0.joint);
            b.m_jointList = je
        }
        b.m_jointList = null;
        var ce = b.m_contactList;
        while (ce) {
            var ce0 = ce;
            ce = ce.next;
            this.m_contactManager.Destroy(ce0.contact)
        }
        b.m_contactList = null;
        var f = b.m_fixtureList;
        while (f) {
            var f0 = f;
            f = f.m_next;
            if (this.m_destructionListener) {
                this.m_destructionListener.SayGoodbyeFixture(f0)
            }
            f0.DestroyProxies(this.m_contactManager.m_broadPhase);
            f0.Destroy();
            b.m_fixtureList = f;
            b.m_fixtureCount -= 1
        }
        b.m_fixtureList = null;
        b.m_fixtureCount = 0;
        if (b.m_prev) {
            b.m_prev.m_next = b.m_next
        }
        if (b.m_next) {
            b.m_next.m_prev = b.m_prev
        }
        if (b == this.m_bodyList) {
            this.m_bodyList = b.m_next
        }
        b.m_destroyed = true;
        --this.m_bodyCount
    },
    CreateJoint: function (def) {
        if (this.IsLocked()) {
            return null
        }
        var j = b2Joint.Create(def);
        j.m_prev = null;
        j.m_next = this.m_jointList;
        if (this.m_jointList) {
            this.m_jointList.m_prev = j
        }
        this.m_jointList = j;
        ++this.m_jointCount;
        j.m_edgeA.joint = j;
        j.m_edgeA.other = j.m_bodyB;
        j.m_edgeA.prev = null;
        j.m_edgeA.next = j.m_bodyA.m_jointList;
        if (j.m_bodyA.m_jointList) {
            j.m_bodyA.m_jointList.prev = j.m_edgeA
        }
        j.m_bodyA.m_jointList = j.m_edgeA;
        j.m_edgeB.joint = j;
        j.m_edgeB.other = j.m_bodyA;
        j.m_edgeB.prev = null;
        j.m_edgeB.next = j.m_bodyB.m_jointList;
        if (j.m_bodyB.m_jointList) {
            j.m_bodyB.m_jointList.prev = j.m_edgeB
        }
        j.m_bodyB.m_jointList = j.m_edgeB;
        var bodyA = def.bodyA;
        var bodyB = def.bodyB;
        if (def.collideConnected == false) {
            var edge = bodyB.GetContactList();
            while (edge) {
                if (edge.other == bodyA) {
                    edge.contact.FlagForFiltering()
                }
                edge = edge.next
            }
        }
        return j
    },
    DestroyJoint: function (j) {
        if (this.IsLocked()) {
            return
        }
        var collideConnected = j.m_collideConnected;
        if (j.m_prev) {
            j.m_prev.m_next = j.m_next
        }
        if (j.m_next) {
            j.m_next.m_prev = j.m_prev
        }
        if (j == this.m_jointList) {
            this.m_jointList = j.m_next
        }
        var bodyA = j.m_bodyA;
        var bodyB = j.m_bodyB;
        bodyA.SetAwake(true);
        bodyB.SetAwake(true);
        if (j.m_edgeA.prev) {
            j.m_edgeA.prev.next = j.m_edgeA.next
        }
        if (j.m_edgeA.next) {
            j.m_edgeA.next.prev = j.m_edgeA.prev
        }
        if (j.m_edgeA == bodyA.m_jointList) {
            bodyA.m_jointList = j.m_edgeA.next
        }
        j.m_edgeA.prev = null;
        j.m_edgeA.next = null;
        if (j.m_edgeB.prev) {
            j.m_edgeB.prev.next = j.m_edgeB.next
        }
        if (j.m_edgeB.next) {
            j.m_edgeB.next.prev = j.m_edgeB.prev
        }
        if (j.m_edgeB == bodyB.m_jointList) {
            bodyB.m_jointList = j.m_edgeB.next
        }
        j.m_edgeB.prev = null;
        j.m_edgeB.next = null;
        b2Joint.Destroy(j);
        --this.m_jointCount;
        if (collideConnected == false) {
            var edge = bodyB.GetContactList();
            while (edge) {
                if (edge.other == bodyA) {
                    edge.contact.FlagForFiltering()
                }
                edge = edge.next
            }
        }
    },
    Step: function (dt, velocityIterations, positionIterations) {
        profile_world_step.start();
        if (this.m_flags & b2World.e_newFixture) {
            this.m_contactManager.FindNewContacts();
            this.m_flags &= ~b2World.e_newFixture
        }
        this.m_flags |= b2World.e_locked;
        this.p_step.dt = dt;
        this.p_step.velocityIterations = velocityIterations;
        this.p_step.positionIterations = positionIterations;
        if (dt > 0) {
            this.p_step.inv_dt = 1 / dt
        } else {
            this.p_step.inv_dt = 0
        }
        this.p_step.dtRatio = this.m_inv_dt0 * dt;
        this.p_step.warmStarting = this.m_warmStarting;
        profile_world_collide.start();
        this.m_contactManager.Collide();
        profile_world_collide.stop();
        if (this.m_stepComplete && this.p_step.dt > 0) {
            profile_world_solve.start();
            this.Solve(this.p_step);
            profile_world_solve.stop()
        }
        if (this.m_continuousPhysics && this.p_step.dt > 0) {
            profile_world_solveTOI.start();
            this.SolveTOI(this.p_step);
            profile_world_solveTOI.stop()
        }
        if (this.p_step.dt > 0) {
            this.m_inv_dt0 = this.p_step.inv_dt
        }
        if (this.m_flags & b2World.e_clearForces) {
            this.ClearForces()
        }
        this.m_flags &= ~b2World.e_locked;
        profile_world_step.stop()
    },
    ClearForces: function () {
        for (var body = this.m_bodyList; body; body = body.GetNext()) {
            body.m_force.x = body.m_force.y = 0;
            body.m_torque = 0
        }
    },
    DrawDebugData: function () {
        if (this.g_debugDraw == null) {
            return
        }
        var flags = this.g_debugDraw.GetFlags();
        if (flags & b2Draw.e_shapeBit) {
            for (var b = this.m_bodyList; b; b = b.GetNext()) {
                var xf = b.GetTransform();
                for (var f = b.GetFixtureList(); f; f = f.GetNext()) {
                    if (b.IsActive() == false) {
                        this.DrawShape(f, xf, new b2Color(0.5, 0.5, 0.3))
                    } else {
                        if (b.GetType() == b2Body.b2_staticBody) {
                            this.DrawShape(f, xf, new b2Color(0.5, 0.9, 0.5))
                        } else {
                            if (b.GetType() == b2Body.b2_kinematicBody) {
                                this.DrawShape(f, xf, new b2Color(0.5, 0.5, 0.9))
                            } else {
                                if (b.IsAwake() == false) {
                                    this.DrawShape(f, xf, new b2Color(0.6, 0.6, 0.6))
                                } else {
                                    this.DrawShape(f, xf, new b2Color(0.9, 0.7, 0.7))
                                }
                            }
                        }
                    }
                }
            }
        }
        if (flags & b2Draw.e_jointBit) {
            for (var j = this.m_jointList; j; j = j.GetNext()) {
                this.DrawJoint(j)
            }
        }
        if (flags & b2Draw.e_pairBit) {
            var color = new b2Color(0.3, 0.9, 0.9);
            for (var c = this.m_contactManager.m_contactList; c; c = c.GetNext()) {
                var fixtureA = c.GetFixtureA();
                var fixtureB = c.GetFixtureB();
                var cA = fixtureA.GetAABB(c.GetChildIndexA()).GetCenter();
                var cB = fixtureB.GetAABB(c.GetChildIndexB()).GetCenter();
                this.g_debugDraw.DrawSegment(cA, cB, color)
            }
        }
        if (flags & b2Draw.e_aabbBit) {
            var color = new b2Color(0.9, 0.3, 0.9);
            var bp = this.m_contactManager.m_broadPhase;
            for (var b = this.m_bodyList; b; b = b.GetNext()) {
                if (b.IsActive() == false) {
                    continue
                }
                for (var f = b.GetFixtureList(); f; f = f.GetNext()) {
                    for (var i = 0; i < f.m_proxyCount; ++i) {
                        var proxy = f.m_proxies[i];
                        var aabb = bp.GetFatAABB(proxy.proxyId);
                        var vs = [];
                        vs[0] = new b2Vec2(aabb.lowerBound.x, aabb.lowerBound.y);
                        vs[1] = new b2Vec2(aabb.upperBound.x, aabb.lowerBound.y);
                        vs[2] = new b2Vec2(aabb.upperBound.x, aabb.upperBound.y);
                        vs[3] = new b2Vec2(aabb.lowerBound.x, aabb.upperBound.y);
                        this.g_debugDraw.DrawPolygon(vs, 4, color)
                    }
                }
            }
        }
        if (flags & b2Draw.e_centerOfMassBit) {
            for (var b = this.m_bodyList; b; b = b.GetNext()) {
                var xf = b.GetTransform().Clone();
                xf.p = b.GetWorldCenter();
                this.g_debugDraw.DrawTransform(xf)
            }
        }
    },
    QueryAABB: function (callback, aabb) {
        var wrapper = new b2WorldQueryWrapper();
        wrapper.broadPhase = this.m_contactManager.m_broadPhase;
        wrapper.callback = callback;
        this.m_contactManager.m_broadPhase.Query(wrapper, aabb)
    },
    RayCast: function (callback, point1, point2) {
        var wrapper = new b2WorldRayCastWrapper();
        wrapper.broadPhase = this.m_contactManager.m_broadPhase;
        wrapper.callback = callback;
        var input = new b2RayCastInput();
        input.maxFraction = 1;
        input.p1 = point1;
        input.p2 = point2;
        this.m_contactManager.m_broadPhase.RayCast(wrapper, input)
    },
    GetBodyList: function () {
        return this.m_bodyList
    },
    GetJointList: function () {
        return this.m_jointList
    },
    GetContactList: function () {
        return this.m_contactManager.m_contactList
    },
    SetAllowSleeping: function (flag) {
        if (flag == this.m_allowSleep) {
            return
        }
        this.m_allowSleep = flag;
        if (this.m_allowSleep == false) {
            for (var b = this.m_bodyList; b; b = b.m_next) {
                b.SetAwake(true)
            }
        }
    },
    GetAllowSleeping: function () {
        return this.m_allowSleep
    },
    SetWarmStarting: function (flag) {
        this.m_warmStarting = flag
    },
    GetWarmStarting: function () {
        return this.m_warmStarting
    },
    SetContinuousPhysics: function (flag) {
        this.m_continuousPhysics = flag
    },
    GetContinuousPhysics: function () {
        return this.m_continuousPhysics
    },
    SetSubStepping: function (flag) {
        this.m_subStepping = flag
    },
    GetSubStepping: function () {
        return this.m_subStepping
    },
    GetProxyCount: function () {
        return this.m_contactManager.m_broadPhase.GetProxyCount()
    },
    GetBodyCount: function () {
        return this.m_bodyCount
    },
    GetJointCount: function () {
        return this.m_jointCount
    },
    GetContactCount: function () {
        return this.m_contactManager.m_contactCount
    },
    GetTreeHeight: function () {
        return this.m_contactManager.m_broadPhase.GetTreeHeight()
    },
    GetTreeBalance: function () {
        return this.m_contactManager.m_broadPhase.GetTreeBalance()
    },
    GetTreeQuality: function () {
        return this.m_contactManager.m_broadPhase.GetTreeQuality()
    },
    SetGravity: function (gravity) {
        this.m_gravity = gravity
    },
    GetGravity: function () {
        return this.m_gravity
    },
    IsLocked: function () {
        return (this.m_flags & b2World.e_locked) == b2World.e_locked
    },
    SetAutoClearForces: function (flag) {
        if (flag) {
            this.m_flags |= b2World.e_clearForces
        } else {
            this.m_flags &= ~b2World.e_clearForces
        }
    },
    GetAutoClearForces: function () {
        return (this.m_flags & b2World.e_clearForces) == b2World.e_clearForces
    },
    ShiftOrigin: function (newOrigin) {
        if ((this.m_flags & b2World.e_locked) == b2World.e_locked) {
            return
        }
        for (var b = this.m_bodyList; b; b = b.m_next) {
            b.m_xf.p.Subtract(newOrigin);
            b.m_sweep.c0.Subtract(newOrigin);
            b.m_sweep.c.Subtract(newOrigin)
        }
        for (var j = this.m_jointList; j; j = j.m_next) {
            j.ShiftOrigin(newOrigin)
        }
        this.m_contactManager.m_broadPhase.ShiftOrigin(newOrigin)
    },
    GetContactManager: function () {
        return this.m_contactManager
    },
    Solve: function (step) {
        this.p_island.Initialize(this.m_bodyCount, this.m_contactManager.m_contactCount, this.m_jointCount, this.m_contactManager.m_contactListener);
        for (var b = this.m_bodyList; b; b = b.m_next) {
            b.m_flags &= ~b2Body.e_islandFlag
        }
        for (var c = this.m_contactManager.m_contactList; c; c = c.m_next) {
            c.m_flags &= ~b2Contact.e_islandFlag
        }
        for (var j = this.m_jointList; j; j = j.m_next) {
            j.m_islandFlag = false
        }
        var stackSize = this.m_bodyCount;
        var stack = new Array(stackSize);
        for (var seed = this.m_bodyList; seed; seed = seed.m_next) {
            if (seed.m_flags & b2Body.e_islandFlag) {
                continue
            }
            if (seed.IsAwake() == false || seed.IsActive() == false) {
                continue
            }
            if (seed.GetType() == b2Body.b2_staticBody) {
                continue
            }
            this.p_island.Clear();
            var stackCount = 0;
            stack[stackCount++] = seed;
            seed.m_flags |= b2Body.e_islandFlag;
            while (stackCount > 0) {
                var b = stack[--stackCount];
                this.p_island.AddBody(b);
                b.SetAwake(true);
                if (b.GetType() == b2Body.b2_staticBody) {
                    continue
                }
                for (var ce = b.m_contactList; ce; ce = ce.next) {
                    var contact = ce.contact;
                    if (contact.m_flags & b2Contact.e_islandFlag) {
                        continue
                    }
                    if (contact.IsEnabled() == false || contact.IsTouching() == false) {
                        continue
                    }
                    var sensorA = contact.m_fixtureA.m_isSensor;
                    var sensorB = contact.m_fixtureB.m_isSensor;
                    if (sensorA || sensorB) {
                        continue
                    }
                    this.p_island.AddContact(contact);
                    contact.m_flags |= b2Contact.e_islandFlag;
                    var other = ce.other;
                    if (other.m_flags & b2Body.e_islandFlag) {
                        continue
                    }
                    stack[stackCount++] = other;
                    other.m_flags |= b2Body.e_islandFlag
                }
                for (var je = b.m_jointList; je; je = je.next) {
                    if (je.joint.m_islandFlag == true) {
                        continue
                    }
                    var other = je.other;
                    if (other.IsActive() == false) {
                        continue
                    }
                    this.p_island.AddJoint(je.joint);
                    je.joint.m_islandFlag = true;
                    if (other.m_flags & b2Body.e_islandFlag) {
                        continue
                    }
                    stack[stackCount++] = other;
                    other.m_flags |= b2Body.e_islandFlag
                }
            }
            this.p_island.Solve(step, this.m_gravity, this.m_allowSleep);
            for (var i = 0; i < this.p_island.m_bodyCount; ++i) {
                var b = this.p_island.m_bodies[i];
                if (b.GetType() == b2Body.b2_staticBody) {
                    b.m_flags &= ~b2Body.e_islandFlag
                }
            }
        }
        profile_world_broadphase.start();
        for (var b = this.m_bodyList; b; b = b.GetNext()) {
            if ((b.m_flags & b2Body.e_islandFlag) == 0) {
                continue
            }
            if (b.GetType() == b2Body.b2_staticBody) {
                continue
            }
            b.SynchronizeFixtures()
        }
        this.m_contactManager.FindNewContacts();
        profile_world_broadphase.stop()
    },
    SolveTOI: function (step) {
        this.p_island.Initialize(2 * b2_maxTOIContacts, b2_maxTOIContacts, 0, this.m_contactManager.m_contactListener);
        if (this.m_stepComplete) {
            for (var b = this.m_bodyList; b; b = b.m_next) {
                b.m_flags &= ~b2Body.e_islandFlag;
                b.m_sweep.alpha0 = 0
            }
            for (var c = this.m_contactManager.m_contactList; c; c = c.m_next) {
                c.m_flags &= ~(b2Contact.e_toiFlag | b2Contact.e_islandFlag);
                c.m_toiCount = 0;
                c.m_toi = 1
            }
        }
        for (;;) {
            var minContact = null;
            var minAlpha = 1;
            for (var c = this.m_contactManager.m_contactList; c; c = c.m_next) {
                if (c.IsEnabled() == false) {
                    continue
                }
                if (c.m_toiCount > b2_maxSubSteps) {
                    continue
                }
                var alpha = 1;
                if (c.m_flags & b2Contact.e_toiFlag) {
                    alpha = c.m_toi
                } else {
                    var fA = c.GetFixtureA();
                    var fB = c.GetFixtureB();
                    if (fA.IsSensor() || fB.IsSensor()) {
                        continue
                    }
                    var bA = fA.GetBody();
                    var bB = fB.GetBody();
                    var typeA = bA.m_type;
                    var typeB = bB.m_type;
                    var activeA = bA.IsAwake() && typeA != b2Body.b2_staticBody;
                    var activeB = bB.IsAwake() && typeB != b2Body.b2_staticBody;
                    if (activeA == false && activeB == false) {
                        continue
                    }
                    var collideA = bA.IsBullet() || typeA != b2Body.b2_dynamicBody;
                    var collideB = bB.IsBullet() || typeB != b2Body.b2_dynamicBody;
                    if (collideA == false && collideB == false) {
                        continue
                    }
                    var alpha0 = bA.m_sweep.alpha0;
                    if (bA.m_sweep.alpha0 < bB.m_sweep.alpha0) {
                        alpha0 = bB.m_sweep.alpha0;
                        bA.m_sweep.Advance(alpha0)
                    } else {
                        if (bB.m_sweep.alpha0 < bA.m_sweep.alpha0) {
                            alpha0 = bA.m_sweep.alpha0;
                            bB.m_sweep.Advance(alpha0)
                        }
                    }
                    var indexA = c.GetChildIndexA();
                    var indexB = c.GetChildIndexB();
                    var input = new b2TOIInput();
                    input.proxyA.Set(fA.GetShape(), indexA);
                    input.proxyB.Set(fB.GetShape(), indexB);
                    input.sweepA.Assign(bA.m_sweep);
                    input.sweepB.Assign(bB.m_sweep);
                    input.tMax = 1;
                    var output = new b2TOIOutput();
                    b2TimeOfImpact(output, input);
                    var beta = output.t;
                    if (output.state == b2TOIOutput.e_touching) {
                        alpha = b2Min(alpha0 + (1 - alpha0) * beta, 1)
                    } else {
                        alpha = 1
                    }
                    c.m_toi = alpha;
                    c.m_flags |= b2Contact.e_toiFlag
                }
                if (alpha < minAlpha) {
                    minContact = c;
                    minAlpha = alpha
                }
            }
            if (minContact == null || 1 - 10 * b2_epsilon < minAlpha) {
                this.m_stepComplete = true;
                break
            }
            var fA = minContact.GetFixtureA();
            var fB = minContact.GetFixtureB();
            var bA = fA.GetBody();
            var bB = fB.GetBody();
            b2World.m_local_sweep_backupA.Assign(bA.m_sweep);
            b2World.m_local_sweep_backupB.Assign(bB.m_sweep);
            bA.Advance(minAlpha);
            bB.Advance(minAlpha);
            minContact.Update(this.m_contactManager.m_contactListener);
            minContact.m_flags &= ~b2Contact.e_toiFlag;
            ++minContact.m_toiCount;
            if (minContact.IsEnabled() == false || minContact.IsTouching() == false) {
                minContact.SetEnabled(false);
                bA.m_sweep.Assign(b2World.m_local_sweep_backupA);
                bB.m_sweep.Assign(b2World.m_local_sweep_backupB);
                bA.SynchronizeTransform();
                bB.SynchronizeTransform();
                continue
            }
            bA.SetAwake(true);
            bB.SetAwake(true);
            this.p_island.Clear();
            this.p_island.AddBody(bA);
            this.p_island.AddBody(bB);
            this.p_island.AddContact(minContact);
            bA.m_flags |= b2Body.e_islandFlag;
            bB.m_flags |= b2Body.e_islandFlag;
            minContact.m_flags |= b2Contact.e_islandFlag;
            var bodies = [bA, bB];
            for (var i = 0; i < 2; ++i) {
                var body = bodies[i];
                if (body.m_type == b2Body.b2_dynamicBody) {
                    for (var ce = body.m_contactList; ce; ce = ce.next) {
                        if (this.p_island.m_bodyCount == this.p_island.m_bodyCapacity) {
                            break
                        }
                        if (this.p_island.m_contactCount == this.p_island.m_contactCapacity) {
                            break
                        }
                        var contact = ce.contact;
                        if (contact.m_flags & b2Contact.e_islandFlag) {
                            continue
                        }
                        var other = ce.other;
                        if (other.m_type == b2Body.b2_dynamicBody && body.IsBullet() == false && other.IsBullet() == false) {
                            continue
                        }
                        var sensorA = contact.m_fixtureA.m_isSensor;
                        var sensorB = contact.m_fixtureB.m_isSensor;
                        if (sensorA || sensorB) {
                            continue
                        }
                        b2World.m_local_sweep_backupC.Assign(other.m_sweep);
                        if ((other.m_flags & b2Body.e_islandFlag) == 0) {
                            other.Advance(minAlpha)
                        }
                        contact.Update(this.m_contactManager.m_contactListener);
                        if (contact.IsEnabled() == false) {
                            other.m_sweep.Assign(b2World.m_local_sweep_backupC);
                            other.SynchronizeTransform();
                            continue
                        }
                        if (contact.IsTouching() == false) {
                            other.m_sweep.Assign(b2World.m_local_sweep_backupC);
                            other.SynchronizeTransform();
                            continue
                        }
                        contact.m_flags |= b2Contact.e_islandFlag;
                        this.p_island.AddContact(contact);
                        if (other.m_flags & b2Body.e_islandFlag) {
                            continue
                        }
                        other.m_flags |= b2Body.e_islandFlag;
                        if (other.m_type != b2Body.b2_staticBody) {
                            other.SetAwake(true)
                        }
                        this.p_island.AddBody(other)
                    }
                }
            }
            var subStep = new b2TimeStep();
            subStep.dt = (1 - minAlpha) * step.dt;
            subStep.inv_dt = 1 / subStep.dt;
            subStep.dtRatio = 1;
            subStep.positionIterations = 20;
            subStep.velocityIterations = step.velocityIterations;
            subStep.warmStarting = false;
            this.p_island.SolveTOI(subStep, bA.m_islandIndex, bB.m_islandIndex);
            for (var i = 0; i < this.p_island.m_bodyCount; ++i) {
                var body = this.p_island.m_bodies[i];
                body.m_flags &= ~b2Body.e_islandFlag;
                if (body.m_type != b2Body.b2_dynamicBody) {
                    continue
                }
                body.SynchronizeFixtures();
                for (var ce = body.m_contactList; ce; ce = ce.next) {
                    ce.contact.m_flags &= ~(b2Contact.e_toiFlag | b2Contact.e_islandFlag)
                }
            }
            this.m_contactManager.FindNewContacts();
            if (this.m_subStepping) {
                this.m_stepComplete = false;
                break
            }
        }
    },
    DrawJoint: function (joint) {
        var bodyA = joint.GetBodyA();
        var bodyB = joint.GetBodyB();
        var xf1 = bodyA.GetTransform();
        var xf2 = bodyB.GetTransform();
        var x1 = xf1.p;
        var x2 = xf2.p;
        var p1 = joint.GetAnchorA();
        var p2 = joint.GetAnchorB();
        var color = new b2Color(0.5, 0.8, 0.8);
        switch (joint.GetType()) {
            case b2Joint.e_distanceJoint:
                this.g_debugDraw.DrawSegment(p1, p2, color);
                break;
            case b2Joint.e_pulleyJoint:
                var pulley = joint;
                var s1 = pulley.GetGroundAnchorA();
                var s2 = pulley.GetGroundAnchorB();
                this.g_debugDraw.DrawSegment(s1, p1, color);
                this.g_debugDraw.DrawSegment(s2, p2, color);
                this.g_debugDraw.DrawSegment(s1, s2, color);
                break;
            case b2Joint.e_mouseJoint:
                break;
            case b2Joint.e_motorJoint:
                this.g_debugDraw.DrawPoint(joint.GetLinearOffset(), 5, color);
            default:
                this.g_debugDraw.DrawSegment(x1, p1, color);
                this.g_debugDraw.DrawSegment(p1, p2, color);
                this.g_debugDraw.DrawSegment(x2, p2, color)
        }
    },
    DrawShape: function (fixture, xf, color) {
        switch (fixture.GetType()) {
            case b2Shape.e_circle:
                var circle = fixture.GetShape();
                var center = b2Mul_t_v2(xf, circle.m_p);
                var radius = circle.m_radius;
                var axis = b2Mul_r_v2(xf.q, new b2Vec2(1, 0));
                this.g_debugDraw.DrawSolidCircle(center, radius, axis, color);
                break;
            case b2Shape.e_edge:
                var edge = fixture.GetShape();
                var v1 = b2Mul_t_v2(xf, edge.m_vertex1);
                var v2 = b2Mul_t_v2(xf, edge.m_vertex2);
                this.g_debugDraw.DrawSegment(v1, v2, color);
                break;
            case b2Shape.e_chain:
                var chain = fixture.GetShape();
                var count = chain.m_count;
                var vertices = chain.m_vertices;
                var v1 = b2Mul_t_v2(xf, vertices[0]);
                for (var i = 1; i < count; ++i) {
                    var v2 = b2Mul_t_v2(xf, vertices[i]);
                    this.g_debugDraw.DrawSegment(v1, v2, color);
                    v1 = v2
                }
                break;
            case b2Shape.e_polygon:
                var poly = fixture.GetShape();
                var vertexCount = poly.m_count;
                var vertices = new Array(b2_maxPolygonVertices);
                for (var i = 0; i < vertexCount; ++i) {
                    vertices[i] = b2Mul_t_v2(xf, poly.m_vertices[i])
                }
                this.g_debugDraw.DrawSolidPolygon(vertices, vertexCount, color);
                break;
            default:
                break
        }
    }
};
b2World.e_newFixture = 1;
b2World.e_locked = 2;
b2World.e_clearForces = 4;
"use strict";

function b2MixFriction(friction1, friction2) {
    return b2Sqrt(friction1 * friction2)
}

function b2MixRestitution(restitution1, restitution2) {
    return restitution1 > restitution2 ? restitution1 : restitution2
}

function b2ContactRegister() {
    this.fcn = null;
    this.primary = false
}

function b2ContactEdge() {
    this.other = null;
    this.contact = null;
    this.prev = null;
    this.next = null
}

function b2Contact() {
    this.m_nodeA = new b2ContactEdge();
    this.m_nodeB = new b2ContactEdge();
    this.m_manifold = new b2Manifold()
}
b2Contact.m_local_tempManifold = new b2Manifold();
b2Contact.prototype = {
    Create: function (fA, indexA, fB, indexB) {
        this.m_toi = 0;
        this.m_flags = b2Contact.e_enabledFlag;
        this.m_fixtureA = fA || null;
        this.m_fixtureB = fB || null;
        this.m_indexA = indexA || 0;
        this.m_indexB = indexB || 0;
        this.m_manifold.pointCount = 0;
        this.m_prev = null;
        this.m_next = null;
        this.m_nodeA.contact = null;
        this.m_nodeA.prev = null;
        this.m_nodeA.next = null;
        this.m_nodeA.other = null;
        this.m_nodeB.contact = null;
        this.m_nodeB.prev = null;
        this.m_nodeB.next = null;
        this.m_nodeB.other = null;
        this.m_toiCount = 0;
        if (fA) {
            this.m_friction = b2MixFriction(this.m_fixtureA.m_friction, this.m_fixtureB.m_friction);
            this.m_restitution = b2MixRestitution(this.m_fixtureA.m_restitution, this.m_fixtureB.m_restitution)
        } else {
            this.m_friction = 0;
            this.m_restitution = 0
        }
        this.m_tangentSpeed = 0
    },
    GetManifold: function () {
        return this.m_manifold
    },
    GetWorldManifold: function (worldManifold) {
        var bodyA = this.m_fixtureA.GetBody();
        var bodyB = this.m_fixtureB.GetBody();
        var shapeA = this.m_fixtureA.GetShape();
        var shapeB = this.m_fixtureB.GetShape();
        worldManifold.Initialize(this.m_manifold, bodyA.GetTransform(), shapeA.m_radius, bodyB.GetTransform(), shapeB.m_radius)
    },
    IsTouching: function () {
        return (this.m_flags & b2Contact.e_touchingFlag) == b2Contact.e_touchingFlag
    },
    SetEnabled: function (flag) {
        if (flag) {
            this.m_flags |= b2Contact.e_enabledFlag
        } else {
            this.m_flags &= ~b2Contact.e_enabledFlag
        }
    },
    IsEnabled: function () {
        return (this.m_flags & b2Contact.e_enabledFlag) == b2Contact.e_enabledFlag
    },
    GetNext: function () {
        return this.m_next
    },
    GetFixtureA: function () {
        return this.m_fixtureA
    },
    GetChildIndexA: function () {
        return this.m_indexA
    },
    GetFixtureB: function () {
        return this.m_fixtureB
    },
    GetChildIndexB: function () {
        return this.m_indexB
    },
    SetFriction: function (friction) {
        this.m_friction = friction
    },
    GetFriction: function () {
        return this.m_friction
    },
    ResetFriction: function () {
        this.m_friction = b2MixFriction(this.m_fixtureA.m_friction, this.m_fixtureB.m_friction)
    },
    SetRestitution: function (restitution) {
        this.m_restitution = restitution
    },
    GetRestitution: function () {
        return this.m_restitution
    },
    ResetRestitution: function () {
        this.m_restitution = b2MixRestitution(this.m_fixtureA.m_restitution, this.m_fixtureB.m_restitution)
    },
    SetTangentSpeed: function (speed) {
        this.m_tangentSpeed = speed
    },
    GetTangentSpeed: function () {
        return this.m_tangentSpeed
    },
    Evaluate: function (manifold, xfA, xfB) {},
    FlagForFiltering: function () {
        this.m_flags |= b2Contact.e_filterFlag
    },
    m_oldManifold: null,
    Update: function (listener) {
        b2Contact.m_local_tempManifold.Assign(this.m_manifold);
        this.m_flags |= b2Contact.e_enabledFlag;
        var touching = false;
        var wasTouching = (this.m_flags & b2Contact.e_touchingFlag) == b2Contact.e_touchingFlag;
        var sensorA = this.m_fixtureA.IsSensor();
        var sensorB = this.m_fixtureB.IsSensor();
        var sensor = sensorA || sensorB;
        var bodyA = this.m_fixtureA.GetBody();
        var bodyB = this.m_fixtureB.GetBody();
        var xfA = bodyA.GetTransform();
        var xfB = bodyB.GetTransform();
        if (sensor) {
            var shapeA = this.m_fixtureA.GetShape();
            var shapeB = this.m_fixtureB.GetShape();
            touching = b2TestShapeOverlap(shapeA, this.m_indexA, shapeB, this.m_indexB, xfA, xfB);
            this.m_manifold.pointCount = 0
        } else {
            this.Evaluate(this.m_manifold, xfA, xfB);
            touching = this.m_manifold.pointCount > 0;
            for (var i = 0; i < this.m_manifold.pointCount; ++i) {
                var mp2 = this.m_manifold.points[i];
                mp2.normalImpulse = 0;
                mp2.tangentImpulse = 0;
                var id2 = mp2.id;
                for (var j = 0; j < b2Contact.m_local_tempManifold.pointCount; ++j) {
                    var mp1 = b2Contact.m_local_tempManifold.points[j];
                    if (mp1.id.Get() == id2.Get()) {
                        mp2.normalImpulse = mp1.normalImpulse;
                        mp2.tangentImpulse = mp1.tangentImpulse;
                        break
                    }
                }
            }
            if (touching != wasTouching) {
                bodyA.SetAwake(true);
                bodyB.SetAwake(true)
            }
        }
        if (touching) {
            this.m_flags |= b2Contact.e_touchingFlag
        } else {
            this.m_flags &= ~b2Contact.e_touchingFlag
        }
        if (wasTouching == false && touching == true && listener) {
            listener.BeginContact(this)
        }
        if (wasTouching == true && touching == false && listener) {
            listener.EndContact(this)
        }
        if (sensor == false && touching && listener) {
            listener.PreSolve(this, b2Contact.m_local_tempManifold)
        }
    }
};
b2Contact.e_islandFlag = 1;
b2Contact.e_touchingFlag = 2;
b2Contact.e_enabledFlag = 4;
b2Contact.e_filterFlag = 8;
b2Contact.e_bulletHitFlag = 16;
b2Contact.e_toiFlag = 32;

function b2CircleContact() {
    this.parent.call(this)
}
b2CircleContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        b2CollideCircles(manifold, this.m_fixtureA.GetShape(), xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, unused1, fixtureB, unused2) {
        this.parent.prototype.Create.call(this, fixtureA, 0, fixtureB, 0)
    }
};
b2CircleContact._extend(b2Contact);
var _local_temp_edgeShape = new b2EdgeShape();

function b2ChainAndCircleContact() {
    this.parent.call(this)
}
b2ChainAndCircleContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        var chain = this.m_fixtureA.GetShape();
        chain.GetChildEdge(_local_temp_edgeShape, this.m_indexA);
        b2CollideEdgeAndCircle(manifold, _local_temp_edgeShape, xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, indexA, fixtureB, indexB) {
        this.parent.prototype.Create.call(this, fixtureA, indexA, fixtureB, indexB)
    }
};
b2ChainAndCircleContact._extend(b2Contact);

function b2ChainAndPolygonContact() {
    this.parent.call(this)
}
b2ChainAndPolygonContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        var chain = this.m_fixtureA.GetShape();
        chain.GetChildEdge(_local_temp_edgeShape, this.m_indexA);
        b2CollideEdgeAndPolygon(manifold, _local_temp_edgeShape, xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, indexA, fixtureB, indexB) {
        this.parent.prototype.Create.call(this, fixtureA, indexA, fixtureB, indexB)
    }
};
b2ChainAndPolygonContact.Create = function (fixtureA, indexA, fixtureB, indexB) {
    return new b2ChainAndPolygonContact(fixtureA, indexA, fixtureB, indexB)
};
b2ChainAndPolygonContact._extend(b2Contact);

function b2EdgeAndCircleContact() {
    this.parent.call(this)
}
b2EdgeAndCircleContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        b2CollideEdgeAndCircle(manifold, this.m_fixtureA.GetShape(), xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, indexA, fixtureB, indexB) {
        this.parent.prototype.Create.call(this, fixtureA, 0, fixtureB, 0)
    }
};
b2EdgeAndCircleContact.Create = function (fixtureA, indexA, fixtureB, indexB) {
    return new b2EdgeAndCircleContact(fixtureA, fixtureB)
};
b2EdgeAndCircleContact._extend(b2Contact);

function b2EdgeAndPolygonContact() {
    this.parent.call(this)
}
b2EdgeAndPolygonContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        b2CollideEdgeAndPolygon(manifold, this.m_fixtureA.GetShape(), xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, indexA, fixtureB, indexB) {
        this.parent.prototype.Create.call(this, fixtureA, 0, fixtureB, 0)
    }
};
b2EdgeAndPolygonContact.Create = function (fixtureA, indexA, fixtureB, indexB) {
    return new b2EdgeAndPolygonContact(fixtureA, fixtureB)
};
b2EdgeAndPolygonContact._extend(b2Contact);

function b2PolygonAndCircleContact() {
    this.parent.call(this)
}
b2PolygonAndCircleContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        b2CollidePolygonAndCircle(manifold, this.m_fixtureA.GetShape(), xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, indexA, fixtureB, indexB) {
        this.parent.prototype.Create.call(this, fixtureA, 0, fixtureB, 0)
    }
};
b2PolygonAndCircleContact.Create = function (fixtureA, indexA, fixtureB, indexB) {
    return new b2PolygonAndCircleContact(fixtureA, fixtureB)
};
b2PolygonAndCircleContact._extend(b2Contact);

function b2PolygonContact() {
    this.parent.call(this)
}
b2PolygonContact.prototype = {
    Evaluate: function (manifold, xfA, xfB) {
        b2CollidePolygons(manifold, this.m_fixtureA.GetShape(), xfA, this.m_fixtureB.GetShape(), xfB)
    },
    Create: function (fixtureA, indexA, fixtureB, indexB) {
        this.parent.prototype.Create.call(this, fixtureA, 0, fixtureB, 0)
    }
};
b2PolygonContact.Create = function (fixtureA, indexA, fixtureB, indexB) {
    return new b2PolygonContact(fixtureA, fixtureB)
};
b2PolygonContact._extend(b2Contact);
b2Contact.AddType = function (fcn, type1, type2) {
    if (!b2Contact.s_registers[type1]) {
        b2Contact.s_registers[type1] = []
    }
    b2Contact.s_registers[type1][type2] = new b2ContactRegister();
    b2Contact.s_registers[type1][type2].fcn = fcn;
    b2Contact.s_registers[type1][type2].primary = true;
    if (type1 != type2) {
        if (!b2Contact.s_registers[type2]) {
            b2Contact.s_registers[type2] = []
        }
        b2Contact.s_registers[type2][type1] = new b2ContactRegister();
        b2Contact.s_registers[type2][type1].fcn = fcn;
        b2Contact.s_registers[type2][type1].primary = false
    }
    fcn.garbage = [];
    fcn.alloc = 2
};
b2Contact.InitializeRegisters = function () {
    b2Contact.AddType(b2CircleContact, b2Shape.e_circle, b2Shape.e_circle);
    b2Contact.AddType(b2PolygonAndCircleContact, b2Shape.e_polygon, b2Shape.e_circle);
    b2Contact.AddType(b2PolygonContact, b2Shape.e_polygon, b2Shape.e_polygon);
    b2Contact.AddType(b2EdgeAndCircleContact, b2Shape.e_edge, b2Shape.e_circle);
    b2Contact.AddType(b2EdgeAndPolygonContact, b2Shape.e_edge, b2Shape.e_polygon);
    b2Contact.AddType(b2ChainAndCircleContact, b2Shape.e_chain, b2Shape.e_circle);
    b2Contact.AddType(b2ChainAndPolygonContact, b2Shape.e_chain, b2Shape.e_polygon)
};
b2Contact.RetrieveGarbage = function (fcn) {
    var contact;
    if (contact = fcn.garbage.pop()) {
        return contact
    }
    for (var i = 0; i < fcn.alloc - 1; ++i) {
        fcn.garbage.push(new fcn())
    }
    fcn.alloc += 32;
    return new fcn()
};
b2Contact.Create = function (fixtureA, indexA, fixtureB, indexB) {
    if (b2Contact.s_initialized == false) {
        b2Contact.InitializeRegisters();
        b2Contact.s_initialized = true
    }
    var type1 = fixtureA.GetType();
    var type2 = fixtureB.GetType();
    var fcn = b2Contact.s_registers[type1][type2].fcn;
    if (fcn) {
        var contact = b2Contact.RetrieveGarbage(fcn);
        if (b2Contact.s_registers[type1][type2].primary) {
            contact.Create(fixtureA, indexA, fixtureB, indexB)
        } else {
            contact.Create(fixtureB, indexB, fixtureA, indexA)
        }
        return contact
    }
    return null
};
b2Contact.Destroy = function (contact) {
    var fixtureA = contact.m_fixtureA;
    var fixtureB = contact.m_fixtureB;
    if (contact.m_manifold.pointCount > 0 && fixtureA.IsSensor() == false && fixtureB.IsSensor() == false) {
        fixtureA.GetBody().SetAwake(true);
        fixtureB.GetBody().SetAwake(true)
    }
    var typeA = fixtureA.GetType();
    var typeB = fixtureB.GetType();
    b2Contact.s_registers[typeA][typeB].fcn.garbage.push(contact)
};
b2Contact.s_registers = [];
b2Contact.s_initialized = false;
"use strict";
var b2_defaultFilter = new b2ContactFilter();
var b2_defaultListener = new b2ContactListener();

function b2ContactManager() {
    this.m_broadPhase = new b2BroadPhase();
    this.m_contactList = null;
    this.m_contactCount = 0;
    this.m_contactFilter = b2_defaultFilter;
    this.m_contactListener = b2_defaultListener
}
b2ContactManager.prototype = {
    AddPair: function (proxyUserDataA, proxyUserDataB) {
        var proxyA = proxyUserDataA;
        var proxyB = proxyUserDataB;
        var fixtureA = proxyA.fixture;
        var fixtureB = proxyB.fixture;
        var indexA = proxyA.childIndex;
        var indexB = proxyB.childIndex;
        var bodyA = fixtureA.GetBody();
        var bodyB = fixtureB.GetBody();
        if (bodyA == bodyB) {
            return
        }
        var edge = bodyB.GetContactList();
        while (edge) {
            if (edge.other == bodyA) {
                var fA = edge.contact.GetFixtureA();
                var fB = edge.contact.GetFixtureB();
                var iA = edge.contact.GetChildIndexA();
                var iB = edge.contact.GetChildIndexB();
                if (fA == fixtureA && fB == fixtureB && iA == indexA && iB == indexB) {
                    return
                }
                if (fA == fixtureB && fB == fixtureA && iA == indexB && iB == indexA) {
                    return
                }
            }
            edge = edge.next
        }
        if (bodyB.ShouldCollide(bodyA) == false) {
            return
        }
        if (this.m_contactFilter && this.m_contactFilter.ShouldCollide(fixtureA, fixtureB) == false) {
            return
        }
        var c = b2Contact.Create(fixtureA, indexA, fixtureB, indexB);
        if (c == null) {
            return
        }
        fixtureA = c.GetFixtureA();
        fixtureB = c.GetFixtureB();
        indexA = c.GetChildIndexA();
        indexB = c.GetChildIndexB();
        bodyA = fixtureA.GetBody();
        bodyB = fixtureB.GetBody();
        c.m_prev = null;
        c.m_next = this.m_contactList;
        if (this.m_contactList != null) {
            this.m_contactList.m_prev = c
        }
        this.m_contactList = c;
        c.m_nodeA.contact = c;
        c.m_nodeA.other = bodyB;
        c.m_nodeA.prev = null;
        c.m_nodeA.next = bodyA.m_contactList;
        if (bodyA.m_contactList != null) {
            bodyA.m_contactList.prev = c.m_nodeA
        }
        bodyA.m_contactList = c.m_nodeA;
        c.m_nodeB.contact = c;
        c.m_nodeB.other = bodyA;
        c.m_nodeB.prev = null;
        c.m_nodeB.next = bodyB.m_contactList;
        if (bodyB.m_contactList != null) {
            bodyB.m_contactList.prev = c.m_nodeB
        }
        bodyB.m_contactList = c.m_nodeB;
        if (fixtureA.IsSensor() == false && fixtureB.IsSensor() == false) {
            bodyA.SetAwake(true);
            bodyB.SetAwake(true)
        }++this.m_contactCount
    },
    FindNewContacts: function () {
        this.m_broadPhase.UpdatePairs(this)
    },
    Destroy: function (c) {
        var fixtureA = c.GetFixtureA();
        var fixtureB = c.GetFixtureB();
        var bodyA = fixtureA.GetBody();
        var bodyB = fixtureB.GetBody();
        if (this.m_contactListener && c.IsTouching()) {
            this.m_contactListener.EndContact(c)
        }
        if (c.m_prev) {
            c.m_prev.m_next = c.m_next
        }
        if (c.m_next) {
            c.m_next.m_prev = c.m_prev
        }
        if (c == this.m_contactList) {
            this.m_contactList = c.m_next
        }
        if (c.m_nodeA.prev) {
            c.m_nodeA.prev.next = c.m_nodeA.next
        }
        if (c.m_nodeA.next) {
            c.m_nodeA.next.prev = c.m_nodeA.prev
        }
        if (c.m_nodeA == bodyA.m_contactList) {
            bodyA.m_contactList = c.m_nodeA.next
        }
        if (c.m_nodeB.prev) {
            c.m_nodeB.prev.next = c.m_nodeB.next
        }
        if (c.m_nodeB.next) {
            c.m_nodeB.next.prev = c.m_nodeB.prev
        }
        if (c.m_nodeB == bodyB.m_contactList) {
            bodyB.m_contactList = c.m_nodeB.next
        }
        b2Contact.Destroy(c);
        --this.m_contactCount
    },
    Collide: function () {
        var c = this.m_contactList;
        while (c) {
            var fixtureA = c.GetFixtureA();
            var fixtureB = c.GetFixtureB();
            var indexA = c.GetChildIndexA();
            var indexB = c.GetChildIndexB();
            var bodyA = fixtureA.GetBody();
            var bodyB = fixtureB.GetBody();
            if (c.m_flags & b2Contact.e_filterFlag) {
                if (bodyB.ShouldCollide(bodyA) == false) {
                    var cNuke = c;
                    c = cNuke.GetNext();
                    this.Destroy(cNuke);
                    continue
                }
                if (this.m_contactFilter && this.m_contactFilter.ShouldCollide(fixtureA, fixtureB) == false) {
                    var cNuke = c;
                    c = cNuke.GetNext();
                    this.Destroy(cNuke);
                    continue
                }
                c.m_flags &= ~b2Contact.e_filterFlag
            }
            var activeA = bodyA.IsAwake() && bodyA.m_type != b2Body.b2_staticBody;
            var activeB = bodyB.IsAwake() && bodyB.m_type != b2Body.b2_staticBody;
            if (activeA == false && activeB == false) {
                c = c.GetNext();
                continue
            }
            var proxyIdA = fixtureA.m_proxies[indexA].proxyId;
            var proxyIdB = fixtureB.m_proxies[indexB].proxyId;
            var overlap = this.m_broadPhase.TestOverlap(proxyIdA, proxyIdB);
            if (overlap == false) {
                var cNuke = c;
                c = cNuke.GetNext();
                this.Destroy(cNuke);
                continue
            }
            c.Update(this.m_contactListener);
            c = c.GetNext()
        }
    }
};

function b2VelocityConstraintPoint() {
    this.rA = new b2Vec2();
    this.rB = new b2Vec2();
    this.normalImpulse = 0;
    this.tangentImpulse = 0;
    this.normalMass = 0;
    this.tangentMass = 0;
    this.velocityBias = 0
}

function b2ContactPositionConstraint() {
    this.localPoints = new Array(b2_maxManifoldPoints);
    this.localNormal = new b2Vec2();
    this.localPoint = new b2Vec2();
    this.indexA = 0;
    this.indexB = 0;
    this.invMassA = 0, this.invMassB = 0;
    this.localCenterA = new b2Vec2(), this.localCenterB = new b2Vec2();
    this.invIA = 0, this.invIB = 0;
    this.type = 0;
    this.radiusA = 0, this.radiusB = 0;
    this.pointCount = 0
}

function b2ContactVelocityConstraint() {
    this.points = new Array(b2_maxManifoldPoints);
    for (var i = 0; i < this.points.length; ++i) {
        this.points[i] = new b2VelocityConstraintPoint()
    }
    this.normal = new b2Vec2();
    this.normalMass = new b2Mat22();
    this.K = new b2Mat22();
    this.indexA = 0;
    this.indexB = 0;
    this.invMassA = 0, this.invMassB = 0;
    this.invIA = 0, this.invIB = 0;
    this.friction = 0;
    this.restitution = 0;
    this.tangentSpeed = 0;
    this.pointCount = 0;
    this.contactIndex = 0
}

function b2PositionSolverManifold() {
    this.normal = new b2Vec2();
    this.point = new b2Vec2();
    this.separation = 0
}
b2PositionSolverManifold.prototype = {
    Initialize: function (pc, xfA, xfB, index) {
        switch (pc.type) {
            case b2Manifold.e_circles:
                var pointAx = (xfA.q.c * pc.localPoint.x - xfA.q.s * pc.localPoint.y) + xfA.p.x;
                var pointAy = (xfA.q.s * pc.localPoint.x + xfA.q.c * pc.localPoint.y) + xfA.p.y;
                var pointBx = (xfB.q.c * pc.localPoints[0].x - xfB.q.s * pc.localPoints[0].y) + xfB.p.x;
                var pointBy = (xfB.q.s * pc.localPoints[0].x + xfB.q.c * pc.localPoints[0].y) + xfB.p.y;
                this.point.x = 0.5 * (pointAx + pointBx);
                this.point.y = 0.5 * (pointAy + pointBy);
                this.normal.x = pointBx - pointAx;
                this.normal.y = pointBy - pointAy;
                var tempnx = this.normal.x;
                var tempny = this.normal.y;
                this.normal.Normalize();
                this.separation = (tempnx * this.normal.x + tempny * this.normal.y) - pc.radiusA - pc.radiusB;
                break;
            case b2Manifold.e_faceA:
                this.normal.x = xfA.q.c * pc.localNormal.x - xfA.q.s * pc.localNormal.y;
                this.normal.y = xfA.q.s * pc.localNormal.x + xfA.q.c * pc.localNormal.y;
                var planePointx = (xfA.q.c * pc.localPoint.x - xfA.q.s * pc.localPoint.y) + xfA.p.x;
                var planePointy = (xfA.q.s * pc.localPoint.x + xfA.q.c * pc.localPoint.y) + xfA.p.y;
                var clipPointx = (xfB.q.c * pc.localPoints[index].x - xfB.q.s * pc.localPoints[index].y) + xfB.p.x;
                var clipPointy = (xfB.q.s * pc.localPoints[index].x + xfB.q.c * pc.localPoints[index].y) + xfB.p.y;
                this.separation = ((clipPointx - planePointx) * this.normal.x + (clipPointy - planePointy) * this.normal.y) - pc.radiusA - pc.radiusB;
                this.point.x = clipPointx;
                this.point.y = clipPointy;
                break;
            case b2Manifold.e_faceB:
                this.normal.x = xfB.q.c * pc.localNormal.x - xfB.q.s * pc.localNormal.y;
                this.normal.y = xfB.q.s * pc.localNormal.x + xfB.q.c * pc.localNormal.y;
                var planePointx = (xfB.q.c * pc.localPoint.x - xfB.q.s * pc.localPoint.y) + xfB.p.x;
                var planePointy = (xfB.q.s * pc.localPoint.x + xfB.q.c * pc.localPoint.y) + xfB.p.y;
                var clipPointx = (xfA.q.c * pc.localPoints[index].x - xfA.q.s * pc.localPoints[index].y) + xfA.p.x;
                var clipPointy = (xfA.q.s * pc.localPoints[index].x + xfA.q.c * pc.localPoints[index].y) + xfA.p.y;
                this.separation = ((clipPointx - planePointx) * this.normal.x + (clipPointy - planePointy) * this.normal.y) - pc.radiusA - pc.radiusB;
                this.point.x = clipPointx;
                this.point.y = clipPointy;
                this.normal.x = -this.normal.x;
                this.normal.y = -this.normal.y;
                break
        }
    }
};

function b2ContactSolverDef() {
    this.step = new b2TimeStep();
    this.contacts = null;
    this.count = 0;
    this.positions = null;
    this.velocities = null
}

function b2ContactSolver() {
    this.m_positionConstraints = [];
    this.m_velocityConstraints = []
}
b2ContactSolver.cs_xfA = new b2Transform();
b2ContactSolver.cs_xfB = new b2Transform();
b2ContactSolver.temp_solver_manifold = new b2PositionSolverManifold();
b2ContactSolver.prototype = {
    Init: function (def) {
        this.m_step = def.step;
        this.m_count = def.count;
        this.m_positionConstraints.length = this.m_count;
        this.m_velocityConstraints.length = this.m_count;
        this.m_positions = def.positions;
        this.m_velocities = def.velocities;
        this.m_contacts = def.contacts;
        for (var i = 0; i < this.m_count; ++i) {
            var contact = this.m_contacts[i];
            var fixtureA = contact.m_fixtureA;
            var fixtureB = contact.m_fixtureB;
            var shapeA = fixtureA.GetShape();
            var shapeB = fixtureB.GetShape();
            var radiusA = shapeA.m_radius;
            var radiusB = shapeB.m_radius;
            var bodyA = fixtureA.GetBody();
            var bodyB = fixtureB.GetBody();
            var manifold = contact.GetManifold();
            var pointCount = manifold.pointCount;
            var vc = this.m_velocityConstraints[i] || new b2ContactVelocityConstraint();
            vc.friction = contact.m_friction;
            vc.restitution = contact.m_restitution;
            vc.tangentSpeed = contact.m_tangentSpeed;
            vc.indexA = bodyA.m_islandIndex;
            vc.indexB = bodyB.m_islandIndex;
            vc.invMassA = bodyA.m_invMass;
            vc.invMassB = bodyB.m_invMass;
            vc.invIA = bodyA.m_invI;
            vc.invIB = bodyB.m_invI;
            vc.contactIndex = i;
            vc.pointCount = pointCount;
            vc.K.SetZero();
            vc.normalMass.SetZero();
            this.m_velocityConstraints[i] = vc;
            var pc = this.m_positionConstraints[i] || new b2ContactPositionConstraint();
            pc.indexA = bodyA.m_islandIndex;
            pc.indexB = bodyB.m_islandIndex;
            pc.invMassA = bodyA.m_invMass;
            pc.invMassB = bodyB.m_invMass;
            pc.localCenterA.x = bodyA.m_sweep.localCenter.x;
            pc.localCenterA.y = bodyA.m_sweep.localCenter.y;
            pc.localCenterB.x = bodyB.m_sweep.localCenter.x;
            pc.localCenterB.y = bodyB.m_sweep.localCenter.y;
            pc.invIA = bodyA.m_invI;
            pc.invIB = bodyB.m_invI;
            pc.localNormal.x = manifold.localNormal.x;
            pc.localNormal.y = manifold.localNormal.y;
            pc.localPoint.x = manifold.localPoint.x;
            pc.localPoint.y = manifold.localPoint.y;
            pc.pointCount = pointCount;
            pc.radiusA = radiusA;
            pc.radiusB = radiusB;
            pc.type = manifold.type;
            this.m_positionConstraints[i] = pc;
            for (var j = 0; j < pointCount; ++j) {
                var cp = manifold.points[j];
                var vcp = vc.points[j];
                if (this.m_step.warmStarting) {
                    vcp.normalImpulse = this.m_step.dtRatio * cp.normalImpulse;
                    vcp.tangentImpulse = this.m_step.dtRatio * cp.tangentImpulse
                } else {
                    vcp.normalImpulse = 0;
                    vcp.tangentImpulse = 0
                }
                vcp.rA.SetZero();
                vcp.rB.SetZero();
                vcp.normalMass = 0;
                vcp.tangentMass = 0;
                vcp.velocityBias = 0;
                pc.localPoints[j] = cp.localPoint
            }
        }
    },
    InitializeVelocityConstraints: function () {
        for (var i = 0; i < this.m_count; ++i) {
            var vc = this.m_velocityConstraints[i];
            var pc = this.m_positionConstraints[i];
            var radiusA = pc.radiusA;
            var radiusB = pc.radiusB;
            var manifold = this.m_contacts[vc.contactIndex].GetManifold();
            var indexA = vc.indexA;
            var indexB = vc.indexB;
            var mA = vc.invMassA;
            var mB = vc.invMassB;
            var iA = vc.invIA;
            var iB = vc.invIB;
            var localCenterA = pc.localCenterA;
            var localCenterB = pc.localCenterB;
            var cA = this.m_positions[indexA].c;
            var aA = this.m_positions[indexA].a;
            var vA = this.m_velocities[indexA].v;
            var wA = this.m_velocities[indexA].w;
            var cB = this.m_positions[indexB].c;
            var aB = this.m_positions[indexB].a;
            var vB = this.m_velocities[indexB].v;
            var wB = this.m_velocities[indexB].w;
            b2ContactSolver.cs_xfA.q.Set(aA);
            b2ContactSolver.cs_xfB.q.Set(aB);
            b2ContactSolver.cs_xfA.p.x = cA.x - (b2ContactSolver.cs_xfA.q.c * localCenterA.x - b2ContactSolver.cs_xfA.q.s * localCenterA.y);
            b2ContactSolver.cs_xfA.p.y = cA.y - (b2ContactSolver.cs_xfA.q.s * localCenterA.x + b2ContactSolver.cs_xfA.q.c * localCenterA.y);
            b2ContactSolver.cs_xfB.p.x = cB.x - (b2ContactSolver.cs_xfB.q.c * localCenterB.x - b2ContactSolver.cs_xfB.q.s * localCenterB.y);
            b2ContactSolver.cs_xfB.p.y = cB.y - (b2ContactSolver.cs_xfB.q.s * localCenterB.x + b2ContactSolver.cs_xfB.q.c * localCenterB.y);
            var worldManifold = new b2WorldManifold();
            worldManifold.Initialize(manifold, b2ContactSolver.cs_xfA, radiusA, b2ContactSolver.cs_xfB, radiusB);
            vc.normal.x = worldManifold.normal.x;
            vc.normal.y = worldManifold.normal.y;
            var pointCount = vc.pointCount;
            for (var j = 0; j < pointCount; ++j) {
                var vcp = vc.points[j];
                vcp.rA.x = worldManifold.points[j].x - cA.x;
                vcp.rA.y = worldManifold.points[j].y - cA.y;
                vcp.rB.x = worldManifold.points[j].x - cB.x;
                vcp.rB.y = worldManifold.points[j].y - cB.y;
                var rnA = vcp.rA.x * vc.normal.y - vcp.rA.y * vc.normal.x;
                var rnB = vcp.rB.x * vc.normal.y - vcp.rB.y * vc.normal.x;
                var kNormal = mA + mB + iA * rnA * rnA + iB * rnB * rnB;
                vcp.normalMass = kNormal > 0 ? 1 / kNormal : 0;
                var tangentx = 1 * vc.normal.y;
                var tangenty = -1 * vc.normal.x;
                var rtA = vcp.rA.x * tangenty - vcp.rA.y * tangentx;
                var rtB = vcp.rB.x * tangenty - vcp.rB.y * tangentx;
                var kTangent = mA + mB + iA * rtA * rtA + iB * rtB * rtB;
                vcp.tangentMass = kTangent > 0 ? 1 / kTangent : 0;
                vcp.velocityBias = 0;
                var vRel = vc.normal.x * (((vB.x + (-wB * vcp.rB.y)) - vA.x) - (-wA * vcp.rA.y)) + vc.normal.y * (((vB.y + (wB * vcp.rB.x)) - vA.y) - (wA * vcp.rA.x));
                if (vRel < -b2_velocityThreshold) {
                    vcp.velocityBias = -vc.restitution * vRel
                }
            }
            if (vc.pointCount == 2) {
                var vcp1 = vc.points[0];
                var vcp2 = vc.points[1];
                var rn1A = vcp1.rA.x * vc.normal.y - vcp1.rA.y * vc.normal.x;
                var rn1B = vcp1.rB.x * vc.normal.y - vcp1.rB.y * vc.normal.x;
                var rn2A = vcp2.rA.x * vc.normal.y - vcp2.rA.y * vc.normal.x;
                var rn2B = vcp2.rB.x * vc.normal.y - vcp2.rB.y * vc.normal.x;
                var k11 = mA + mB + iA * rn1A * rn1A + iB * rn1B * rn1B;
                var k22 = mA + mB + iA * rn2A * rn2A + iB * rn2B * rn2B;
                var k12 = mA + mB + iA * rn1A * rn2A + iB * rn1B * rn2B;
                var k_maxConditionNumber = 1000;
                if (k11 * k11 < k_maxConditionNumber * (k11 * k22 - k12 * k12)) {
                    vc.K.ex.x = k11;
                    vc.K.ex.y = k12;
                    vc.K.ey.x = k12;
                    vc.K.ey.y = k22;
                    vc.normalMass.Assign(vc.K.GetInverse())
                } else {
                    vc.pointCount = 1
                }
            }
        }
    },
    WarmStart: function () {
        for (var i = 0; i < this.m_count; ++i) {
            var vc = this.m_velocityConstraints[i];
            var indexA = vc.indexA;
            var indexB = vc.indexB;
            var mA = vc.invMassA;
            var iA = vc.invIA;
            var mB = vc.invMassB;
            var iB = vc.invIB;
            var pointCount = vc.pointCount;
            var vA = this.m_velocities[indexA].v;
            var wA = this.m_velocities[indexA].w;
            var vB = this.m_velocities[indexB].v;
            var wB = this.m_velocities[indexB].w;
            var normal = vc.normal;
            var tangentx = 1 * normal.y;
            var tangenty = -1 * normal.x;
            for (var j = 0; j < pointCount; ++j) {
                var vcp = vc.points[j];
                var Px = (vcp.normalImpulse * normal.x) + (vcp.tangentImpulse * tangentx);
                var Py = (vcp.normalImpulse * normal.y) + (vcp.tangentImpulse * tangenty);
                wA -= iA * (vcp.rA.x * Py - vcp.rA.y * Px);
                vA.x -= mA * Px;
                vA.y -= mA * Py;
                wB += iB * (vcp.rB.x * Py - vcp.rB.y * Px);
                vB.x += mB * Px;
                vB.y += mB * Py
            }
            this.m_velocities[indexA].w = wA;
            this.m_velocities[indexB].w = wB
        }
    },
    SolveVelocityConstraints: function () {
        for (var i = 0; i < this.m_count; ++i) {
            var vc = this.m_velocityConstraints[i];
            var indexA = vc.indexA;
            var indexB = vc.indexB;
            var mA = vc.invMassA;
            var iA = vc.invIA;
            var mB = vc.invMassB;
            var iB = vc.invIB;
            var pointCount = vc.pointCount;
            var vA = this.m_velocities[indexA].v;
            var wA = this.m_velocities[indexA].w;
            var vB = this.m_velocities[indexB].v;
            var wB = this.m_velocities[indexB].w;
            var normal = vc.normal;
            var tangentx = 1 * normal.y;
            var tangenty = -1 * normal.x;
            var friction = vc.friction;
            for (var j = 0; j < pointCount; ++j) {
                var vcp = vc.points[j];
                var dvx = vB.x + (-wB * vcp.rB.y) - vA.x - (-wA * vcp.rA.y);
                var dvy = vB.y + (wB * vcp.rB.x) - vA.y - (wA * vcp.rA.x);
                var vt = (dvx * tangentx + dvy * tangenty) - vc.tangentSpeed;
                var lambda = vcp.tangentMass * (-vt);
                var maxFriction = friction * vcp.normalImpulse;
                var newImpulse = b2Clamp(vcp.tangentImpulse + lambda, -maxFriction, maxFriction);
                lambda = newImpulse - vcp.tangentImpulse;
                vcp.tangentImpulse = newImpulse;
                var Px = lambda * tangentx;
                var Py = lambda * tangenty;
                vA.x -= mA * Px;
                vA.y -= mA * Py;
                wA -= iA * (vcp.rA.x * Py - vcp.rA.y * Px);
                vB.x += mB * Px;
                vB.y += mB * Py;
                wB += iB * (vcp.rB.x * Py - vcp.rB.y * Px)
            }
            if (vc.pointCount == 1) {
                vcp = vc.points[0];
                dvx = vB.x + (-wB * vcp.rB.y) - vA.x - (-wA * vcp.rA.y);
                dvy = vB.y + (wB * vcp.rB.x) - vA.y - (wA * vcp.rA.x);
                var vn = dvx * normal.x + dvy * normal.y;
                var lambda = -vcp.normalMass * (vn - vcp.velocityBias);
                var newImpulse = b2Max(vcp.normalImpulse + lambda, 0);
                lambda = newImpulse - vcp.normalImpulse;
                vcp.normalImpulse = newImpulse;
                Px = lambda * normal.x;
                Py = lambda * normal.y;
                vA.x -= mA * Px;
                vA.y -= mA * Py;
                wA -= iA * (vcp.rA.x * Py - vcp.rA.y * Px);
                vB.x += mB * Px;
                vB.y += mB * Py;
                wB += iB * (vcp.rB.x * Py - vcp.rB.y * Px)
            } else {
                var cp1 = vc.points[0];
                var cp2 = vc.points[1];
                var ax = cp1.normalImpulse;
                var ay = cp2.normalImpulse;
                var dv1x = vB.x + (-wB * cp1.rB.y) - vA.x - (-wA * cp1.rA.y);
                var dv1y = vB.y + (wB * cp1.rB.x) - vA.y - (wA * cp1.rA.x);
                var dv2x = vB.x + (-wB * cp2.rB.y) - vA.x - (-wA * cp2.rA.y);
                var dv2y = vB.y + (wB * cp2.rB.x) - vA.y - (wA * cp2.rA.x);
                var vn1 = dv1x * normal.x + dv1y * normal.y;
                var vn2 = dv2x * normal.x + dv2y * normal.y;
                var bx = vn1 - cp1.velocityBias;
                var by = vn2 - cp2.velocityBias;
                bx -= vc.K.ex.x * ax + vc.K.ey.x * ay;
                by -= vc.K.ex.y * ax + vc.K.ey.y * ay;
                for (;;) {
                    var xx = -(vc.normalMass.ex.x * bx + vc.normalMass.ey.x * by);
                    var xy = -(vc.normalMass.ex.y * bx + vc.normalMass.ey.y * by);
                    if (xx >= 0 && xy >= 0) {
                        var dx = xx - ax;
                        var dy = xy - ay;
                        var P1x = dx * normal.x;
                        var P1y = dx * normal.y;
                        var P2x = dy * normal.x;
                        var P2y = dy * normal.y;
                        vA.x -= mA * (P1x + P2x);
                        vA.y -= mA * (P1y + P2y);
                        wA -= iA * ((cp1.rA.x * P1y - cp1.rA.y * P1x) + (cp2.rA.x * P2y - cp2.rA.y * P2x));
                        vB.x += mB * (P1x + P2x);
                        vB.y += mB * (P1y + P2y);
                        wB += iB * ((cp1.rB.x * P1y - cp1.rB.y * P1x) + (cp2.rB.x * P2y - cp2.rB.y * P2x));
                        cp1.normalImpulse = xx;
                        cp2.normalImpulse = xy;
                        break
                    }
                    xx = -cp1.normalMass * bx;
                    xy = 0;
                    vn1 = 0;
                    vn2 = vc.K.ex.y * xx + by;
                    if (xx >= 0 && vn2 >= 0) {
                        dx = xx - ax;
                        dy = xy - ay;
                        P1x = dx * normal.x;
                        P1y = dx * normal.y;
                        P2x = dy * normal.x;
                        P2y = dy * normal.y;
                        vA.x -= mA * (P1x + P2x);
                        vA.y -= mA * (P1y + P2y);
                        wA -= iA * ((cp1.rA.x * P1y - cp1.rA.y * P1x) + (cp2.rA.x * P2y - cp2.rA.y * P2x));
                        vB.x += mB * (P1x + P2x);
                        vB.y += mB * (P1y + P2y);
                        wB += iB * ((cp1.rB.x * P1y - cp1.rB.y * P1x) + (cp2.rB.x * P2y - cp2.rB.y * P2x));
                        cp1.normalImpulse = xx;
                        cp2.normalImpulse = xy;
                        break
                    }
                    xx = 0;
                    xy = -cp2.normalMass * by;
                    vn1 = vc.K.ey.x * xy + bx;
                    vn2 = 0;
                    if (xy >= 0 && vn1 >= 0) {
                        dx = xx - ax;
                        dy = xy - ay;
                        P1x = dx * normal.x;
                        P1y = dx * normal.y;
                        P2x = dy * normal.x;
                        P2y = dy * normal.y;
                        vA.x -= mA * (P1x + P2x);
                        vA.y -= mA * (P1y + P2y);
                        wA -= iA * ((cp1.rA.x * P1y - cp1.rA.y * P1x) + (cp2.rA.x * P2y - cp2.rA.y * P2x));
                        vB.x += mB * (P1x + P2x);
                        vB.y += mB * (P1y + P2y);
                        wB += iB * ((cp1.rB.x * P1y - cp1.rB.y * P1x) + (cp2.rB.x * P2y - cp2.rB.y * P2x));
                        cp1.normalImpulse = xx;
                        cp2.normalImpulse = xy;
                        break
                    }
                    xx = 0;
                    xy = 0;
                    vn1 = bx;
                    vn2 = by;
                    if (vn1 >= 0 && vn2 >= 0) {
                        dx = xx - ax;
                        dy = xy - ay;
                        P1x = dx * normal.x;
                        P1y = dx * normal.y;
                        P2x = dy * normal.x;
                        P2y = dy * normal.y;
                        vA.x -= mA * (P1x + P2x);
                        vA.y -= mA * (P1y + P2y);
                        wA -= iA * ((cp1.rA.x * P1y - cp1.rA.y * P1x) + (cp2.rA.x * P2y - cp2.rA.y * P2x));
                        vB.x += mB * (P1x + P2x);
                        vB.y += mB * (P1y + P2y);
                        wB += iB * ((cp1.rB.x * P1y - cp1.rB.y * P1x) + (cp2.rB.x * P2y - cp2.rB.y * P2x));
                        cp1.normalImpulse = xx;
                        cp2.normalImpulse = xy;
                        break
                    }
                    break
                }
            }
            this.m_velocities[indexA].w = wA;
            this.m_velocities[indexB].w = wB
        }
    },
    StoreImpulses: function () {
        for (var i = 0; i < this.m_count; ++i) {
            var vc = this.m_velocityConstraints[i];
            var manifold = this.m_contacts[vc.contactIndex].GetManifold();
            for (var j = 0; j < vc.pointCount; ++j) {
                manifold.points[j].normalImpulse = vc.points[j].normalImpulse;
                manifold.points[j].tangentImpulse = vc.points[j].tangentImpulse
            }
        }
    },
    SolvePositionConstraints: function () {
        var minSeparation = 0;
        for (var i = 0; i < this.m_count; ++i) {
            var pc = this.m_positionConstraints[i];
            var indexA = pc.indexA;
            var indexB = pc.indexB;
            var localCenterA = pc.localCenterA;
            var mA = pc.invMassA;
            var iA = pc.invIA;
            var localCenterB = pc.localCenterB;
            var mB = pc.invMassB;
            var iB = pc.invIB;
            var pointCount = pc.pointCount;
            var cA = this.m_positions[indexA].c;
            var aA = this.m_positions[indexA].a;
            var cB = this.m_positions[indexB].c;
            var aB = this.m_positions[indexB].a;
            for (var j = 0; j < pointCount; ++j) {
                b2ContactSolver.cs_xfA.q.Set(aA);
                b2ContactSolver.cs_xfB.q.Set(aB);
                b2ContactSolver.cs_xfA.p.x = cA.x - (b2ContactSolver.cs_xfA.q.c * localCenterA.x - b2ContactSolver.cs_xfA.q.s * localCenterA.y);
                b2ContactSolver.cs_xfA.p.y = cA.y - (b2ContactSolver.cs_xfA.q.s * localCenterA.x + b2ContactSolver.cs_xfA.q.c * localCenterA.y);
                b2ContactSolver.cs_xfB.p.x = cB.x - (b2ContactSolver.cs_xfB.q.c * localCenterB.x - b2ContactSolver.cs_xfB.q.s * localCenterB.y);
                b2ContactSolver.cs_xfB.p.y = cB.y - (b2ContactSolver.cs_xfB.q.s * localCenterB.x + b2ContactSolver.cs_xfB.q.c * localCenterB.y);
                b2ContactSolver.temp_solver_manifold.Initialize(pc, b2ContactSolver.cs_xfA, b2ContactSolver.cs_xfB, j);
                var normal = b2ContactSolver.temp_solver_manifold.normal;
                var point = b2ContactSolver.temp_solver_manifold.point;
                var separation = b2ContactSolver.temp_solver_manifold.separation;
                var rAx = point.x - cA.x;
                var rAy = point.y - cA.y;
                var rBx = point.x - cB.x;
                var rBy = point.y - cB.y;
                minSeparation = b2Min(minSeparation, separation);
                var C = b2Clamp(b2_baumgarte * (separation + b2_linearSlop), -b2_maxLinearCorrection, 0);
                var rnA = rAx * normal.y - rAy * normal.x;
                var rnB = rBx * normal.y - rBy * normal.x;
                var K = mA + mB + iA * rnA * rnA + iB * rnB * rnB;
                var impulse = K > 0 ? -C / K : 0;
                var Px = impulse * normal.x;
                var Py = impulse * normal.y;
                cA.x -= mA * Px;
                cA.y -= mA * Py;
                aA -= iA * (rAx * Py - rAy * Px);
                cB.x += mB * Px;
                cB.y += mB * Py;
                aB += iB * (rBx * Py - rBy * Px)
            }
            this.m_positions[indexA].a = aA;
            this.m_positions[indexB].a = aB
        }
        return minSeparation >= -3 * b2_linearSlop
    },
    SolveTOIPositionConstraints: function (toiIndexA, toiIndexB) {
        var minSeparation = 0;
        for (var i = 0; i < this.m_count; ++i) {
            var pc = this.m_positionConstraints[i];
            var indexA = pc.indexA;
            var indexB = pc.indexB;
            var localCenterA = pc.localCenterA;
            var localCenterB = pc.localCenterB;
            var pointCount = pc.pointCount;
            var mA = 0;
            var iA = 0;
            if (indexA == toiIndexA || indexA == toiIndexB) {
                mA = pc.invMassA;
                iA = pc.invIA
            }
            var mB = 0;
            var iB = 0;
            if (indexB == toiIndexA || indexB == toiIndexB) {
                mB = pc.invMassB;
                iB = pc.invIB
            }
            var cA = this.m_positions[indexA].c;
            var aA = this.m_positions[indexA].a;
            var cB = this.m_positions[indexB].c;
            var aB = this.m_positions[indexB].a;
            for (var j = 0; j < pointCount; ++j) {
                b2ContactSolver.cs_xfA.q.Set(aA);
                b2ContactSolver.cs_xfB.q.Set(aB);
                b2ContactSolver.cs_xfA.p.Assign(b2Vec2.Subtract(cA, b2Mul_r_v2(b2ContactSolver.cs_xfA.q, localCenterA)));
                b2ContactSolver.cs_xfB.p.Assign(b2Vec2.Subtract(cB, b2Mul_r_v2(b2ContactSolver.cs_xfB.q, localCenterB)));
                b2ContactSolver.temp_solver_manifold.Initialize(pc, b2ContactSolver.cs_xfA, b2ContactSolver.cs_xfB, j);
                var normal = b2ContactSolver.temp_solver_manifold.normal;
                var point = b2ContactSolver.temp_solver_manifold.point;
                var separation = b2ContactSolver.temp_solver_manifold.separation;
                var rA = b2Vec2.Subtract(point, cA);
                var rB = b2Vec2.Subtract(point, cB);
                minSeparation = b2Min(minSeparation, separation);
                var C = b2Clamp(b2_toiBaugarte * (separation + b2_linearSlop), -b2_maxLinearCorrection, 0);
                var rnA = b2Cross_v2_v2(rA, normal);
                var rnB = b2Cross_v2_v2(rB, normal);
                var K = mA + mB + iA * rnA * rnA + iB * rnB * rnB;
                var impulse = K > 0 ? -C / K : 0;
                var P = b2Vec2.Multiply(impulse, normal);
                cA.Subtract(b2Vec2.Multiply(mA, P));
                aA -= iA * b2Cross_v2_v2(rA, P);
                cB.Add(b2Vec2.Multiply(mB, P));
                aB += iB * b2Cross_v2_v2(rB, P)
            }
            this.m_positions[indexA].a = aA;
            this.m_positions[indexB].a = aB
        }
        return minSeparation >= -1.5 * b2_linearSlop
    }
};
"use strict";

function b2Island() {
    this.m_bodies = [];
    this.m_contacts = [];
    this.m_joints = [];
    this.m_velocities = [];
    this.m_positions = []
}
var profile_solve_init = b2Profiler.create("solve initialization", "solve");
var profile_solve_init_warmStarting = b2Profiler.create("warm starting", "solve initialization");
var profile_solve_velocity = b2Profiler.create("solve velocities", "solve");
var profile_solve_position = b2Profiler.create("solve positions", "solve");
b2Island._solverData = new b2SolverData();
b2Island._solverDef = new b2ContactSolverDef();
b2Island._solver = new b2ContactSolver();
b2Island.prototype = {
    Clear: function () {
        this.m_bodyCount = 0;
        this.m_contactCount = 0;
        this.m_jointCount = 0
    },
    Initialize: function (bodyCapacity, contactCapacity, jointCapacity, listener) {
        this.m_listener = listener;
        this.m_bodyCapacity = bodyCapacity;
        this.m_contactCapacity = contactCapacity;
        this.m_jointCapacity = jointCapacity;
        this.m_bodyCount = 0;
        this.m_contactCount = 0;
        this.m_jointCount = 0;
        this.m_bodies.length = bodyCapacity;
        this.m_contacts.length = contactCapacity;
        this.m_joints.length = jointCapacity;
        this.m_velocities.length = bodyCapacity;
        this.m_positions.length = bodyCapacity
    },
    Solve: function (step, gravity, allowSleep) {
        profile_solve_init.start();
        var h = step.dt;
        for (var i = 0; i < this.m_bodyCount; ++i) {
            var b = this.m_bodies[i];
            this.m_positions[i].c.Assign(b.m_sweep.c);
            var a = b.m_sweep.a;
            this.m_velocities[i].v.Assign(b.m_linearVelocity);
            var w = b.m_angularVelocity;
            b.m_sweep.c0.Assign(b.m_sweep.c);
            b.m_sweep.a0 = b.m_sweep.a;
            if (b.m_type == b2Body.b2_dynamicBody) {
                this.m_velocities[i].v.x += h * ((b.m_gravityScale * gravity.x) + (b.m_invMass * b.m_force.x));
                this.m_velocities[i].v.y += h * ((b.m_gravityScale * gravity.y) + (b.m_invMass * b.m_force.y));
                w += h * b.m_invI * b.m_torque;
                this.m_velocities[i].v.x *= 1 / (1 + h * b.m_linearDamping);
                this.m_velocities[i].v.y *= 1 / (1 + h * b.m_linearDamping);
                w *= 1 / (1 + h * b.m_angularDamping)
            }
            this.m_positions[i].a = a;
            this.m_velocities[i].w = w
        }
        b2Island._solverData.step = step;
        b2Island._solverData.positions = this.m_positions;
        b2Island._solverData.velocities = this.m_velocities;
        b2Island._solverDef.step = step;
        b2Island._solverDef.contacts = this.m_contacts;
        b2Island._solverDef.count = this.m_contactCount;
        b2Island._solverDef.positions = this.m_positions;
        b2Island._solverDef.velocities = this.m_velocities;
        b2Island._solverDef.allocator = this.m_allocator;
        b2Island._solver.Init(b2Island._solverDef);
        b2Island._solver.InitializeVelocityConstraints();
        if (step.warmStarting) {
            profile_solve_init_warmStarting.start();
            b2Island._solver.WarmStart();
            profile_solve_init_warmStarting.stop()
        }
        for (var i = 0; i < this.m_jointCount; ++i) {
            this.m_joints[i].InitVelocityConstraints(b2Island._solverData)
        }
        profile_solve_init.stop();
        profile_solve_velocity.start();
        for (var i = 0; i < step.velocityIterations; ++i) {
            for (var j = 0; j < this.m_jointCount; ++j) {
                this.m_joints[j].SolveVelocityConstraints(b2Island._solverData)
            }
            b2Island._solver.SolveVelocityConstraints()
        }
        b2Island._solver.StoreImpulses();
        profile_solve_velocity.stop();
        profile_solve_position.start();
        for (var i = 0; i < this.m_bodyCount; ++i) {
            var c = this.m_positions[i].c;
            var a = this.m_positions[i].a;
            var v = this.m_velocities[i].v;
            var w = this.m_velocities[i].w;
            var translationx = h * v.x;
            var translationy = h * v.y;
            var translationl = translationx * translationx + translationy * translationy;
            if (translationl > b2_maxTranslationSquared) {
                var ratio = b2_maxTranslation / b2Sqrt(translationl);
                v.x *= ratio;
                v.y *= ratio
            }
            var rotation = h * w;
            if (rotation * rotation > b2_maxRotationSquared) {
                var ratio = b2_maxRotation / b2Abs(rotation);
                w *= ratio
            }
            c.x += h * v.x;
            c.y += h * v.y;
            a += h * w;
            this.m_positions[i].a = a;
            this.m_velocities[i].w = w
        }
        var positionSolved = false;
        for (var i = 0; i < step.positionIterations; ++i) {
            var contactsOkay = b2Island._solver.SolvePositionConstraints();
            var jointsOkay = true;
            for (var j = 0; j < this.m_jointCount; ++j) {
                var jointOkay = this.m_joints[j].SolvePositionConstraints(b2Island._solverData);
                jointsOkay = jointsOkay && jointOkay
            }
            if (contactsOkay && jointsOkay) {
                positionSolved = true;
                break
            }
        }
        for (var i = 0; i < this.m_bodyCount; ++i) {
            var body = this.m_bodies[i];
            body.m_sweep.c.Assign(this.m_positions[i].c);
            body.m_sweep.a = this.m_positions[i].a;
            body.m_linearVelocity.Assign(this.m_velocities[i].v);
            body.m_angularVelocity = this.m_velocities[i].w;
            body.SynchronizeTransform()
        }
        profile_solve_position.stop();
        this.Report(b2Island._solver.m_velocityConstraints);
        if (allowSleep) {
            var minSleepTime = b2_maxFloat;
            var linTolSqr = b2_linearSleepTolerance * b2_linearSleepTolerance;
            var angTolSqr = b2_angularSleepTolerance * b2_angularSleepTolerance;
            for (var i = 0; i < this.m_bodyCount; ++i) {
                var b = this.m_bodies[i];
                if (b.GetType() == b2Body.b2_staticBody) {
                    continue
                }
                if ((b.m_flags & b2Body.e_autoSleepFlag) == 0 || b.m_angularVelocity * b.m_angularVelocity > angTolSqr || b2Dot_v2_v2(b.m_linearVelocity, b.m_linearVelocity) > linTolSqr) {
                    b.m_sleepTime = 0;
                    minSleepTime = 0
                } else {
                    b.m_sleepTime += h;
                    minSleepTime = b2Min(minSleepTime, b.m_sleepTime)
                }
            }
            if (minSleepTime >= b2_timeToSleep && positionSolved) {
                for (var i = 0; i < this.m_bodyCount; ++i) {
                    var b = this.m_bodies[i];
                    b.SetAwake(false)
                }
            }
        }
    },
    SolveTOI: function (subStep, toiIndexA, toiIndexB) {
        for (var i = 0; i < this.m_bodyCount; ++i) {
            var b = this.m_bodies[i];
            this.m_positions[i].c.Assign(b.m_sweep.c);
            this.m_positions[i].a = b.m_sweep.a;
            this.m_velocities[i].v.Assign(b.m_linearVelocity);
            this.m_velocities[i].w = b.m_angularVelocity
        }
        b2Island._solverDef.contacts = this.m_contacts;
        b2Island._solverDef.count = this.m_contactCount;
        b2Island._solverDef.step = subStep;
        b2Island._solverDef.positions = this.m_positions;
        b2Island._solverDef.velocities = this.m_velocities;
        b2Island._solver.Init(b2Island._solverDef);
        for (var i = 0; i < subStep.positionIterations; ++i) {
            var contactsOkay = b2Island._solver.SolveTOIPositionConstraints(toiIndexA, toiIndexB);
            if (contactsOkay) {
                break
            }
        }
        this.m_bodies[toiIndexA].m_sweep.c0.Assign(this.m_positions[toiIndexA].c);
        this.m_bodies[toiIndexA].m_sweep.a0 = this.m_positions[toiIndexA].a;
        this.m_bodies[toiIndexB].m_sweep.c0.Assign(this.m_positions[toiIndexB].c);
        this.m_bodies[toiIndexB].m_sweep.a0 = this.m_positions[toiIndexB].a;
        b2Island._solver.InitializeVelocityConstraints();
        for (var i = 0; i < subStep.velocityIterations; ++i) {
            b2Island._solver.SolveVelocityConstraints()
        }
        var h = subStep.dt;
        for (var i = 0; i < this.m_bodyCount; ++i) {
            var c = this.m_positions[i].c;
            var a = this.m_positions[i].a;
            var v = this.m_velocities[i].v;
            var w = this.m_velocities[i].w;
            var translation = b2Vec2.Multiply(h, v);
            if (b2Dot_v2_v2(translation, translation) > b2_maxTranslationSquared) {
                var ratio = b2_maxTranslation / translation.Length();
                v.Multiply(ratio)
            }
            var rotation = h * w;
            if (rotation * rotation > b2_maxRotationSquared) {
                var ratio = b2_maxRotation / b2Abs(rotation);
                w *= ratio
            }
            c.Add(b2Vec2.Multiply(h, v));
            a += h * w;
            this.m_positions[i].a = a;
            this.m_velocities[i].w = w;
            var body = this.m_bodies[i];
            body.m_sweep.c.Assign(c);
            body.m_sweep.a = a;
            body.m_linearVelocity.Assign(v);
            body.m_angularVelocity = w;
            body.SynchronizeTransform()
        }
        this.Report(b2Island._solver.m_velocityConstraints)
    },
    AddBody: function (body) {
        body.m_islandIndex = this.m_bodyCount;
        this.m_bodies[this.m_bodyCount] = body;
        if (!this.m_positions[this.m_bodyCount]) {
            this.m_positions[this.m_bodyCount] = new b2Position();
            this.m_velocities[this.m_bodyCount] = new b2Velocity()
        }++this.m_bodyCount
    },
    AddContact: function (contact) {
        this.m_contacts[this.m_contactCount++] = contact
    },
    AddJoint: function (joint) {
        this.m_joints[this.m_jointCount++] = joint
    },
    Report: function (constraints) {
        if (this.m_listener == null) {
            return
        }
        for (var i = 0; i < this.m_contactCount; ++i) {
            var c = this.m_contacts[i];
            var vc = constraints[i];
            var impulse = new b2ContactImpulse();
            impulse.count = vc.pointCount;
            for (var j = 0; j < vc.pointCount; ++j) {
                impulse.normalImpulses[j] = vc.points[j].normalImpulse;
                impulse.tangentImpulses[j] = vc.points[j].tangentImpulse
            }
            this.m_listener.PostSolve(c, impulse)
        }
    }
};

function b2Jacobian() {
    this.linear = new b2Vec2();
    this.angularA = 0;
    this.angularB = 0
}

function b2JointEdge() {
    this.other = null;
    this.joint = null;
    this.prev = null;
    this.next = null
}

function b2JointDef() {
    this.type = b2Joint.e_unknownJoint;
    this.userData = null;
    this.bodyA = null;
    this.bodyB = null;
    this.collideConnected = false
}
b2JointDef.prototype = {
    _deserialize: function (data, bodies, joints) {
        this.bodyA = bodies[data.bodyA];
        this.bodyB = bodies[data.bodyB];
        this.collideConnected = data.collideConnected
    }
};

function b2Joint(def) {
    this.m_type = def.type;
    this.m_prev = null;
    this.m_next = null;
    this.m_bodyA = def.bodyA;
    this.m_bodyB = def.bodyB;
    this.m_index = 0;
    this.m_collideConnected = def.collideConnected;
    this.m_islandFlag = false;
    this.m_userData = def.userData;
    this.m_edgeA = new b2JointEdge();
    this.m_edgeA.joint = null;
    this.m_edgeA.other = null;
    this.m_edgeA.prev = null;
    this.m_edgeA.next = null;
    this.m_edgeB = new b2JointEdge();
    this.m_edgeB.joint = null;
    this.m_edgeB.other = null;
    this.m_edgeB.prev = null;
    this.m_edgeB.next = null
}
b2Joint.prototype = {
    GetType: function () {
        return this.m_type
    },
    GetBodyA: function () {
        return this.m_bodyA
    },
    GetBodyB: function () {
        return this.m_bodyB
    },
    GetAnchorA: function () {},
    GetAnchorB: function () {},
    GetReactionForce: function (inv_dt) {},
    GetReactionTorque: function (inv_dt) {},
    GetNext: function () {
        return this.m_next
    },
    GetUserData: function () {
        return this.m_userData
    },
    SetUserData: function (data) {
        this.m_userData = data
    },
    IsActive: function () {
        return this.m_bodyA.IsActive() && this.m_bodyB.IsActive()
    },
    GetCollideConnected: function () {
        return this.m_collideConnected
    },
    ShiftOrigin: function (newOrigin) {},
    InitVelocityConstraints: function (data) {},
    SolveVelocityConstraints: function (data) {},
    SolvePositionConstraints: function (data) {},
    _serialize: function (out) {
        var obj = out || {};
        obj.bodyA = null;
        obj.bodyB = null;
        obj.type = this.m_type;
        obj.collideConnected = this.m_collideConnected;
        return obj
    }
};
b2Joint.e_inactiveLimit = 0;
b2Joint.e_atLowerLimit = 1;
b2Joint.e_atUpperLimit = 2;
b2Joint.e_equalLimits = 3;
b2Joint.e_unknownJoint = 0;
b2Joint.e_revoluteJoint = 1;
b2Joint.e_prismaticJoint = 2;
b2Joint.e_distanceJoint = 3;
b2Joint.e_pulleyJoint = 4;
b2Joint.e_mouseJoint = 5;
b2Joint.e_gearJoint = 6;
b2Joint.e_wheelJoint = 7;
b2Joint.e_weldJoint = 8;
b2Joint.e_frictionJoint = 9;
b2Joint.e_ropeJoint = 10;
b2Joint.e_motorJoint = 11;
b2Joint.Create = function (def) {
    var joint = null;
    switch (def.type) {
        case b2Joint.e_distanceJoint:
            joint = new b2DistanceJoint(def);
            break;
        case b2Joint.e_mouseJoint:
            joint = new b2MouseJoint(def);
            break;
        case b2Joint.e_prismaticJoint:
            joint = new b2PrismaticJoint(def);
            break;
        case b2Joint.e_revoluteJoint:
            joint = new b2RevoluteJoint(def);
            break;
        case b2Joint.e_pulleyJoint:
            joint = new b2PulleyJoint(def);
            break;
        case b2Joint.e_gearJoint:
            joint = new b2GearJoint(def);
            break;
        case b2Joint.e_wheelJoint:
            joint = new b2WheelJoint(def);
            break;
        case b2Joint.e_weldJoint:
            joint = new b2WeldJoint(def);
            break;
        case b2Joint.e_frictionJoint:
            joint = new b2FrictionJoint(def);
            break;
        case b2Joint.e_ropeJoint:
            joint = new b2RopeJoint(def);
            break;
        case b2Joint.e_motorJoint:
            joint = new b2MotorJoint(def);
            break
    }
    return joint
};
b2Joint.Destroy = function (joint) {};

function b2RevoluteJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_revoluteJoint;
    this.localAnchorA = new b2Vec2();
    this.localAnchorB = new b2Vec2();
    this.referenceAngle = 0;
    this.lowerAngle = 0;
    this.upperAngle = 0;
    this.maxMotorTorque = 0;
    this.motorSpeed = 0;
    this.enableLimit = false;
    this.enableMotor = false;
    Object.seal(this)
}
b2RevoluteJointDef.prototype = {
    Initialize: function (bA, bB, anchor) {
        this.bodyA = bA;
        this.bodyB = bB;
        this.localAnchorA = this.bodyA.GetLocalPoint(anchor);
        this.localAnchorB = this.bodyB.GetLocalPoint(anchor);
        this.referenceAngle = this.bodyB.GetAngle() - this.bodyA.GetAngle()
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.referenceAngle = data.referenceAngle;
        this.lowerAngle = data.lowerAngle;
        this.upperAngle = data.upperAngle;
        this.maxMotorTorque = data.maxMotorTorque;
        this.motorSpeed = data.motorSpeed;
        this.enableLimit = data.enableLimit;
        this.enableMotor = data.enableMotor
    }
};
b2RevoluteJointDef._extend(b2JointDef);

function b2RevoluteJoint(def) {
    this.parent.call(this, def);
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_referenceAngle = def.referenceAngle;
    this.m_impulse = new b2Vec3();
    this.m_motorImpulse = 0;
    this.m_lowerAngle = def.lowerAngle;
    this.m_upperAngle = def.upperAngle;
    this.m_maxMotorTorque = def.maxMotorTorque;
    this.m_motorSpeed = def.motorSpeed;
    this.m_enableLimit = def.enableLimit;
    this.m_enableMotor = def.enableMotor;
    this.m_limitState = b2Joint.e_inactiveLimit;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_mass = new b2Mat33();
    this.m_motorMass = 0
}
b2RevoluteJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    GetReferenceAngle: function () {
        return this.m_referenceAngle
    },
    GetJointAngle: function () {
        var bA = this.m_bodyA;
        var bB = this.m_bodyB;
        return bB.m_sweep.a - bA.m_sweep.a - this.m_referenceAngle
    },
    GetJointSpeed: function () {
        var bA = this.m_bodyA;
        var bB = this.m_bodyB;
        return bB.m_angularVelocity - bA.m_angularVelocity
    },
    IsLimitEnabled: function () {
        return this.m_enableLimit
    },
    EnableLimit: function (flag) {
        if (flag != this.m_enableLimit) {
            this.m_bodyA.SetAwake(true);
            this.m_bodyB.SetAwake(true);
            this.m_enableLimit = flag;
            this.m_impulse.z = 0
        }
    },
    GetLowerLimit: function () {
        return this.m_lowerAngle
    },
    GetUpperLimit: function () {
        return this.m_upperAngle
    },
    SetLimits: function (lower, upper) {
        if (lower != this.m_lowerAngle || upper != this.m_upperAngle) {
            this.m_bodyA.SetAwake(true);
            this.m_bodyB.SetAwake(true);
            this.m_impulse.z = 0;
            this.m_lowerAngle = lower;
            this.m_upperAngle = upper
        }
    },
    IsMotorEnabled: function () {
        return this.m_enableMotor
    },
    EnableMotor: function (flag) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_enableMotor = flag
    },
    SetMotorSpeed: function (speed) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_motorSpeed = speed
    },
    GetMotorSpeed: function () {
        return this.m_motorSpeed
    },
    SetMaxMotorTorque: function (torque) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_maxMotorTorque = torque
    },
    GetMaxMotorTorque: function () {
        return this.m_maxMotorTorque
    },
    GetReactionForce: function (inv_dt) {
        var P = new b2Vec2(this.m_impulse.x, this.m_impulse.y);
        return b2Vec2.Multiply(inv_dt, P)
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * this.m_impulse.z
    },
    GetMotorTorque: function (inv_dt) {
        return inv_dt * this.m_motorImpulse
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA = this.m_bodyA.m_sweep.localCenter;
        this.m_localCenterB = this.m_bodyB.m_sweep.localCenter;
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        this.m_rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var fixedRotation = (iA + iB == 0);
        this.m_mass.ex.x = mA + mB + this.m_rA.y * this.m_rA.y * iA + this.m_rB.y * this.m_rB.y * iB;
        this.m_mass.ey.x = -this.m_rA.y * this.m_rA.x * iA - this.m_rB.y * this.m_rB.x * iB;
        this.m_mass.ez.x = -this.m_rA.y * iA - this.m_rB.y * iB;
        this.m_mass.ex.y = this.m_mass.ey.x;
        this.m_mass.ey.y = mA + mB + this.m_rA.x * this.m_rA.x * iA + this.m_rB.x * this.m_rB.x * iB;
        this.m_mass.ez.y = this.m_rA.x * iA + this.m_rB.x * iB;
        this.m_mass.ex.z = this.m_mass.ez.x;
        this.m_mass.ey.z = this.m_mass.ez.y;
        this.m_mass.ez.z = iA + iB;
        this.m_motorMass = iA + iB;
        if (this.m_motorMass > 0) {
            this.m_motorMass = 1 / this.m_motorMass
        }
        if (this.m_enableMotor == false || fixedRotation) {
            this.m_motorImpulse = 0
        }
        if (this.m_enableLimit && fixedRotation == false) {
            var jointAngle = aB - aA - this.m_referenceAngle;
            if (b2Abs(this.m_upperAngle - this.m_lowerAngle) < 2 * b2_angularSlop) {
                this.m_limitState = b2Joint.e_equalLimits
            } else {
                if (jointAngle <= this.m_lowerAngle) {
                    if (this.m_limitState != b2Joint.e_atLowerLimit) {
                        this.m_impulse.z = 0
                    }
                    this.m_limitState = b2Joint.e_atLowerLimit
                } else {
                    if (jointAngle >= this.m_upperAngle) {
                        if (this.m_limitState != b2Joint.e_atUpperLimit) {
                            this.m_impulse.z = 0
                        }
                        this.m_limitState = b2Joint.e_atUpperLimit
                    } else {
                        this.m_limitState = b2Joint.e_inactiveLimit;
                        this.m_impulse.z = 0
                    }
                }
            }
        } else {
            this.m_limitState = b2Joint.e_inactiveLimit
        }
        if (data.step.warmStarting) {
            this.m_impulse.Multiply(data.step.dtRatio);
            this.m_motorImpulse *= data.step.dtRatio;
            var P = new b2Vec2(this.m_impulse.x, this.m_impulse.y);
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * (b2Cross_v2_v2(this.m_rA, P) + this.m_motorImpulse + this.m_impulse.z);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * (b2Cross_v2_v2(this.m_rB, P) + this.m_motorImpulse + this.m_impulse.z)
        } else {
            this.m_impulse.SetZero();
            this.m_motorImpulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var fixedRotation = (iA + iB == 0);
        if (this.m_enableMotor && this.m_limitState != b2Joint.e_equalLimits && fixedRotation == false) {
            var Cdot = wB - wA - this.m_motorSpeed;
            var impulse = -this.m_motorMass * Cdot;
            var oldImpulse = this.m_motorImpulse;
            var maxImpulse = data.step.dt * this.m_maxMotorTorque;
            this.m_motorImpulse = b2Clamp(this.m_motorImpulse + impulse, -maxImpulse, maxImpulse);
            impulse = this.m_motorImpulse - oldImpulse;
            wA -= iA * impulse;
            wB += iB * impulse
        }
        if (this.m_enableLimit && this.m_limitState != b2Joint.e_inactiveLimit && fixedRotation == false) {
            var Cdot1 = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB)), vA), b2Cross_f_v2(wA, this.m_rA));
            var Cdot2 = wB - wA;
            var Cdot = new b2Vec3(Cdot1.x, Cdot1.y, Cdot2);
            var impulse = this.m_mass.Solve33(Cdot).Negate();
            if (this.m_limitState == b2Joint.e_equalLimits) {
                this.m_impulse.Add(impulse)
            } else {
                if (this.m_limitState == b2Joint.e_atLowerLimit) {
                    var newImpulse = this.m_impulse.z + impulse.z;
                    if (newImpulse < 0) {
                        var rhs = b2Vec2.Add(Cdot1.Negate(), b2Vec2.Multiply(this.m_impulse.z, new b2Vec2(this.m_mass.ez.x, this.m_mass.ez.y)));
                        var reduced = this.m_mass.Solve22(rhs);
                        impulse.x = reduced.x;
                        impulse.y = reduced.y;
                        impulse.z = -this.m_impulse.z;
                        this.m_impulse.x += reduced.x;
                        this.m_impulse.y += reduced.y;
                        this.m_impulse.z = 0
                    } else {
                        this.m_impulse.Add(impulse)
                    }
                } else {
                    if (this.m_limitState == b2Joint.e_atUpperLimit) {
                        var newImpulse = this.m_impulse.z + impulse.z;
                        if (newImpulse > 0) {
                            var rhs = b2Vec2.Add(Cdot1.Negate(), b2Vec2.Multiply(this.m_impulse.z, new b2Vec2(this.m_mass.ez.x, this.m_mass.ez.y)));
                            var reduced = this.m_mass.Solve22(rhs);
                            impulse.x = reduced.x;
                            impulse.y = reduced.y;
                            impulse.z = -this.m_impulse.z;
                            this.m_impulse.x += reduced.x;
                            this.m_impulse.y += reduced.y;
                            this.m_impulse.z = 0
                        } else {
                            this.m_impulse.Add(impulse)
                        }
                    }
                }
            }
            var P = new b2Vec2(impulse.x, impulse.y);
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * (b2Cross_v2_v2(this.m_rA, P) + impulse.z);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * (b2Cross_v2_v2(this.m_rB, P) + impulse.z)
        } else {
            var Cdot = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB)), vA), b2Cross_f_v2(wA, this.m_rA));
            var impulse = this.m_mass.Solve22(Cdot.Negate());
            this.m_impulse.x += impulse.x;
            this.m_impulse.y += impulse.y;
            vA.Subtract(b2Vec2.Multiply(mA, impulse));
            wA -= iA * b2Cross_v2_v2(this.m_rA, impulse);
            vB.Add(b2Vec2.Multiply(mB, impulse));
            wB += iB * b2Cross_v2_v2(this.m_rB, impulse)
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var angularError = 0;
        var positionError = 0;
        var fixedRotation = (this.m_invIA + this.m_invIB == 0);
        if (this.m_enableLimit && this.m_limitState != b2Joint.e_inactiveLimit && fixedRotation == false) {
            var angle = aB - aA - this.m_referenceAngle;
            var limitImpulse = 0;
            if (this.m_limitState == b2Joint.e_equalLimits) {
                var C = b2Clamp(angle - this.m_lowerAngle, -b2_maxAngularCorrection, b2_maxAngularCorrection);
                limitImpulse = -this.m_motorMass * C;
                angularError = b2Abs(C)
            } else {
                if (this.m_limitState == b2Joint.e_atLowerLimit) {
                    var C = angle - this.m_lowerAngle;
                    angularError = -C;
                    C = b2Clamp(C + b2_angularSlop, -b2_maxAngularCorrection, 0);
                    limitImpulse = -this.m_motorMass * C
                } else {
                    if (this.m_limitState == b2Joint.e_atUpperLimit) {
                        var C = angle - this.m_upperAngle;
                        angularError = C;
                        C = b2Clamp(C - b2_angularSlop, 0, b2_maxAngularCorrection);
                        limitImpulse = -this.m_motorMass * C
                    }
                }
            }
            aA -= this.m_invIA * limitImpulse;
            aB += this.m_invIB * limitImpulse
        }
        qA.Set(aA);
        qB.Set(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var C = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
        positionError = C.Length();
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var K = new b2Mat22();
        K.ex.x = mA + mB + iA * rA.y * rA.y + iB * rB.y * rB.y;
        K.ex.y = -iA * rA.x * rA.y - iB * rB.x * rB.y;
        K.ey.x = K.ex.y;
        K.ey.y = mA + mB + iA * rA.x * rA.x + iB * rB.x * rB.x;
        var impulse = K.Solve(C).Negate();
        cA.Subtract(b2Vec2.Multiply(mA, impulse));
        aA -= iA * b2Cross_v2_v2(rA, impulse);
        cB.Add(b2Vec2.Multiply(mB, impulse));
        aB += iB * b2Cross_v2_v2(rB, impulse);
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return positionError <= b2_linearSlop && angularError <= b2_angularSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.referenceAngle = this.m_referenceAngle;
        obj.lowerAngle = this.m_lowerAngle;
        obj.upperAngle = this.m_upperAngle;
        obj.maxMotorTorque = this.m_maxMotorTorque;
        obj.motorSpeed = this.m_motorSpeed;
        obj.enableLimit = this.m_enableLimit;
        obj.enableMotor = this.m_enableMotor;
        return obj
    }
};
b2RevoluteJoint._extend(b2Joint);

function b2MouseJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_mouseJoint;
    this.target = new b2Vec2(0, 0);
    this.maxForce = 0;
    this.frequencyHz = 5;
    this.dampingRatio = 0.7;
    Object.seal(this)
}
b2MouseJointDef._extend(b2JointDef);

function b2MouseJoint(def) {
    this.parent.call(this, def);
    this.m_targetA = def.target.Clone();
    this.m_localAnchorB = b2MulT_t_v2(this.m_bodyB.GetTransform(), this.m_targetA);
    this.m_maxForce = def.maxForce;
    this.m_impulse = new b2Vec2();
    this.m_frequencyHz = def.frequencyHz;
    this.m_dampingRatio = def.dampingRatio;
    this.m_beta = 0;
    this.m_gamma = 0;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_rB = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassB = 0;
    this.m_invIB = 0;
    this.m_mass = new b2Mat22();
    this.m_C = new b2Vec2()
}
b2MouseJoint.prototype = {
    GetAnchorA: function () {
        return this.m_targetA
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        return b2Vec2.Multiply(inv_dt, this.m_impulse)
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * 0
    },
    SetTarget: function (target) {
        if (this.m_bodyB.IsAwake() == false) {
            this.m_bodyB.SetAwake(true)
        }
        this.m_targetA.Assign(target)
    },
    GetTarget: function () {
        return this.m_targetA
    },
    SetMaxForce: function (force) {
        this.m_maxForce = force
    },
    GetMaxForce: function () {
        return this.m_maxForce
    },
    SetFrequency: function (hz) {
        this.m_frequencyHz = hz
    },
    GetFrequency: function () {
        return this.m_frequencyHz
    },
    SetDampingRatio: function (ratio) {
        this.m_dampingRatio = ratio
    },
    GetDampingRatio: function () {
        return this.m_dampingRatio
    },
    ShiftOrigin: function (newOrigin) {
        this.m_targetA.Subtract(newOrigin)
    },
    InitVelocityConstraints: function (data) {
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIB = this.m_bodyB.m_invI;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qB = new b2Rot(aB);
        var mass = this.m_bodyB.GetMass();
        var omega = 2 * b2_pi * this.m_frequencyHz;
        var d = 2 * mass * this.m_dampingRatio * omega;
        var k = mass * (omega * omega);
        var h = data.step.dt;
        this.m_gamma = h * (d + h * k);
        if (this.m_gamma != 0) {
            this.m_gamma = 1 / this.m_gamma
        }
        this.m_beta = h * k * this.m_gamma;
        this.m_rB.Assign(b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB)));
        var K = new b2Mat22();
        K.ex.x = this.m_invMassB + this.m_invIB * this.m_rB.y * this.m_rB.y + this.m_gamma;
        K.ex.y = -this.m_invIB * this.m_rB.x * this.m_rB.y;
        K.ey.x = K.ex.y;
        K.ey.y = this.m_invMassB + this.m_invIB * this.m_rB.x * this.m_rB.x + this.m_gamma;
        this.m_mass.Assign(K.GetInverse());
        this.m_C.Assign(b2Vec2.Subtract(b2Vec2.Add(cB, this.m_rB), this.m_targetA));
        this.m_C.Multiply(this.m_beta);
        wB *= 0.98;
        if (data.step.warmStarting) {
            this.m_impulse.Multiply(data.step.dtRatio);
            vB.Add(b2Vec2.Multiply(this.m_invMassB, this.m_impulse));
            wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, this.m_impulse)
        } else {
            this.m_impulse.SetZero()
        }
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var Cdot = b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB));
        var impulse = b2Mul_m22_v2(this.m_mass, (b2Vec2.Add(b2Vec2.Add(Cdot, this.m_C), b2Vec2.Multiply(this.m_gamma, this.m_impulse))).Negate());
        var oldImpulse = this.m_impulse.Clone();
        this.m_impulse.Add(impulse);
        var maxImpulse = data.step.dt * this.m_maxForce;
        if (this.m_impulse.LengthSquared() > maxImpulse * maxImpulse) {
            this.m_impulse.Multiply(maxImpulse / this.m_impulse.Length())
        }
        impulse.Assign(b2Vec2.Subtract(this.m_impulse, oldImpulse));
        vB.Add(b2Vec2.Multiply(this.m_invMassB, impulse));
        wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, impulse);
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        return true
    }
};
b2MouseJoint._extend(b2Joint);

function b2DistanceJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_distanceJoint;
    this.localAnchorA = new b2Vec2(0, 0);
    this.localAnchorB = new b2Vec2(0, 0);
    this.length = 1;
    this.frequencyHz = 0;
    this.dampingRatio = 0;
    Object.seal(this)
}
b2DistanceJointDef.prototype = {
    Initialize: function (b1, b2, anchor1, anchor2) {
        this.bodyA = b1;
        this.bodyB = b2;
        this.localAnchorA = this.bodyA.GetLocalPoint(anchor1);
        this.localAnchorB = this.bodyB.GetLocalPoint(anchor2);
        var d = b2Vec2.Subtract(anchor2, anchor1);
        this.length = d.Length()
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.length = data.length;
        this.frequencyHz = data.frequencyHz;
        this.dampingRatio = data.dampingRatio
    }
};
b2DistanceJointDef._extend(b2JointDef);

function b2DistanceJoint(def) {
    this.parent.call(this, def);
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_length = def.length;
    this.m_frequencyHz = def.frequencyHz;
    this.m_dampingRatio = def.dampingRatio;
    this.m_impulse = 0;
    this.m_gamma = 0;
    this.m_bias = 0;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_u = new b2Vec2();
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_mass = 0
}
b2DistanceJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        var F = b2Vec2.Multiply((inv_dt * this.m_impulse), this.m_u);
        return F
    },
    GetReactionTorque: function (inv_dt) {
        return 0
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    SetLength: function (length) {
        this.m_length = length
    },
    GetLength: function () {
        return this.m_length
    },
    SetFrequency: function (hz) {
        this.m_frequencyHz = hz
    },
    GetFrequency: function () {
        return this.m_frequencyHz
    },
    SetDampingRatio: function (ratio) {
        this.m_dampingRatio = ratio
    },
    GetDampingRatio: function () {
        return this.m_dampingRatio
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        this.m_rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        this.m_u = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, this.m_rB), cA), this.m_rA);
        var length = this.m_u.Length();
        if (length > b2_linearSlop) {
            this.m_u.Multiply(1 / length)
        } else {
            this.m_u.Set(0, 0)
        }
        var crAu = b2Cross_v2_v2(this.m_rA, this.m_u);
        var crBu = b2Cross_v2_v2(this.m_rB, this.m_u);
        var invMass = this.m_invMassA + this.m_invIA * crAu * crAu + this.m_invMassB + this.m_invIB * crBu * crBu;
        this.m_mass = invMass != 0 ? 1 / invMass : 0;
        if (this.m_frequencyHz > 0) {
            var C = length - this.m_length;
            var omega = 2 * b2_pi * this.m_frequencyHz;
            var d = 2 * this.m_mass * this.m_dampingRatio * omega;
            var k = this.m_mass * omega * omega;
            var h = data.step.dt;
            this.m_gamma = h * (d + h * k);
            this.m_gamma = this.m_gamma != 0 ? 1 / this.m_gamma : 0;
            this.m_bias = C * h * k * this.m_gamma;
            invMass += this.m_gamma;
            this.m_mass = invMass != 0 ? 1 / invMass : 0
        } else {
            this.m_gamma = 0;
            this.m_bias = 0
        }
        if (data.step.warmStarting) {
            this.m_impulse *= data.step.dtRatio;
            var P = b2Vec2.Multiply(this.m_impulse, this.m_u);
            vA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
            wA -= this.m_invIA * b2Cross_v2_v2(this.m_rA, P);
            vB.Add(b2Vec2.Multiply(this.m_invMassB, P));
            wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, P)
        } else {
            this.m_impulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var vpA = b2Vec2.Add(vA, b2Cross_f_v2(wA, this.m_rA));
        var vpB = b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB));
        var Cdot = b2Dot_v2_v2(this.m_u, b2Vec2.Subtract(vpB, vpA));
        var impulse = -this.m_mass * (Cdot + this.m_bias + this.m_gamma * this.m_impulse);
        this.m_impulse += impulse;
        var P = b2Vec2.Multiply(impulse, this.m_u);
        vA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
        wA -= this.m_invIA * b2Cross_v2_v2(this.m_rA, P);
        vB.Add(b2Vec2.Multiply(this.m_invMassB, P));
        wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, P);
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        if (this.m_frequencyHz > 0) {
            return true
        }
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var u = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
        var length = u.Normalize();
        var C = length - this.m_length;
        C = b2Clamp(C, -b2_maxLinearCorrection, b2_maxLinearCorrection);
        var impulse = -this.m_mass * C;
        var P = b2Vec2.Multiply(impulse, u);
        cA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
        aA -= this.m_invIA * b2Cross_v2_v2(rA, P);
        cB.Add(b2Vec2.Multiply(this.m_invMassB, P));
        aB += this.m_invIB * b2Cross_v2_v2(rB, P);
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return b2Abs(C) < b2_linearSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.length = this.m_length;
        obj.frequencyHz = this.m_frequencyHz;
        obj.dampingRatio = this.m_dampingRatio;
        return obj
    }
};
b2DistanceJoint._extend(b2Joint);

function b2PrismaticJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_prismaticJoint;
    this.localAnchorA = new b2Vec2();
    this.localAnchorB = new b2Vec2();
    this.localAxisA = new b2Vec2(1, 0);
    this.referenceAngle = 0;
    this.enableLimit = false;
    this.lowerTranslation = 0;
    this.upperTranslation = 0;
    this.enableMotor = false;
    this.maxMotorForce = 0;
    this.motorSpeed = 0;
    Object.seal(this)
}
b2PrismaticJointDef.prototype = {
    Initialize: function (bA, bB, anchor, axis) {
        this.bodyA = bA;
        this.bodyB = bB;
        this.localAnchorA = this.bodyA.GetLocalPoint(anchor);
        this.localAnchorB = this.bodyB.GetLocalPoint(anchor);
        this.localAxisA = this.bodyA.GetLocalVector(axis);
        this.referenceAngle = this.bodyB.GetAngle() - this.bodyA.GetAngle()
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.localAxisA._deserialize(data.localAxisA);
        this.referenceAngle = data.referenceAngle;
        this.enableLimit = data.enableLimit;
        this.lowerTranslation = data.lowerTranslation;
        this.upperTranslation = data.upperTranslation;
        this.enableMotor = data.enableMotor;
        this.maxMotorForce = data.maxMotorForce;
        this.motorSpeed = data.motorSpeed
    }
};
b2PrismaticJointDef._extend(b2JointDef);

function b2PrismaticJoint(def) {
    this.parent.call(this, def);
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_localXAxisA = def.localAxisA.Clone();
    this.m_localXAxisA.Normalize();
    this.m_localYAxisA = b2Cross_f_v2(1, this.m_localXAxisA);
    this.m_referenceAngle = def.referenceAngle;
    this.m_impulse = new b2Vec3();
    this.m_motorMass = 0;
    this.m_motorImpulse = 0;
    this.m_lowerTranslation = def.lowerTranslation;
    this.m_upperTranslation = def.upperTranslation;
    this.m_maxMotorForce = def.maxMotorForce;
    this.m_motorSpeed = def.motorSpeed;
    this.m_enableLimit = def.enableLimit;
    this.m_enableMotor = def.enableMotor;
    this.m_limitState = b2Joint.e_inactiveLimit;
    this.m_axis = new b2Vec2();
    this.m_perp = new b2Vec2();
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_s1 = 0, this.m_s2 = 0;
    this.m_a1 = 0, this.m_a2 = 0;
    this.m_K = new b2Mat33();
    this.m_motorMass = 0
}
b2PrismaticJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        return b2Vec2.Multiply(inv_dt, b2Vec2.Add(b2Vec2.Multiply(this.m_impulse.x, this.m_perp), b2Vec2.Multiply((this.m_motorImpulse + this.m_impulse.z), this.m_axis)))
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * this.m_impulse.y
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    GetLocalAxisA: function () {
        return this.m_localXAxisA
    },
    GetReferenceAngle: function () {
        return this.m_referenceAngle
    },
    GetJointTranslation: function () {
        var pA = this.m_bodyA.GetWorldPoint(this.m_localAnchorA);
        var pB = this.m_bodyB.GetWorldPoint(this.m_localAnchorB);
        var d = b2Vec2.Subtract(pB, pA);
        var axis = this.m_bodyA.GetWorldVector(this.m_localXAxisA);
        var translation = b2Dot_v2_v2(d, axis);
        return translation
    },
    GetJointSpeed: function () {
        var bA = this.m_bodyA;
        var bB = this.m_bodyB;
        var rA = b2Mul_r_v2(bA.m_xf.q, b2Vec2.Subtract(this.m_localAnchorA, bA.m_sweep.localCenter));
        var rB = b2Mul_r_v2(bB.m_xf.q, b2Vec2.Subtract(this.m_localAnchorB, bB.m_sweep.localCenter));
        var p1 = b2Vec2.Add(bA.m_sweep.c, rA);
        var p2 = b2Vec2.Add(bB.m_sweep.c, rB);
        var d = b2Vec2.Subtract(p2, p1);
        var axis = b2Mul_r_v2(bA.m_xf.q, this.m_localXAxisA);
        var vA = bA.m_linearVelocity;
        var vB = bB.m_linearVelocity;
        var wA = bA.m_angularVelocity;
        var wB = bB.m_angularVelocity;
        var speed = b2Dot_v2_v2(d, b2Cross_f_v2(wA, axis)) + b2Dot_v2_v2(axis, b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(vB, b2Cross_f_v2(wB, rB)), vA), b2Cross_f_v2(wA, rA)));
        return speed
    },
    IsLimitEnabled: function () {
        return this.m_enableLimit
    },
    EnableLimit: function (flag) {
        if (flag != this.m_enableLimit) {
            this.m_bodyA.SetAwake(true);
            this.m_bodyB.SetAwake(true);
            this.m_enableLimit = flag;
            this.m_impulse.z = 0
        }
    },
    GetLowerLimit: function () {
        return this.m_lowerTranslation
    },
    GetUpperLimit: function () {
        return this.m_upperTranslation
    },
    SetLimits: function (lower, upper) {
        if (lower != this.m_lowerTranslation || upper != this.m_upperTranslation) {
            this.m_bodyA.SetAwake(true);
            this.m_bodyB.SetAwake(true);
            this.m_lowerTranslation = lower;
            this.m_upperTranslation = upper;
            this.m_impulse.z = 0
        }
    },
    IsMotorEnabled: function () {
        return this.m_enableMotor
    },
    EnableMotor: function (flag) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_enableMotor = flag
    },
    SetMotorSpeed: function (speed) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_motorSpeed = speed
    },
    GetMotorSpeed: function () {
        return this.m_motorSpeed
    },
    SetMaxMotorForce: function (force) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_maxMotorForce = force
    },
    GetMaxMotorForce: function () {
        return this.m_maxMotorForce
    },
    GetMotorForce: function (inv_dt) {
        return inv_dt * this.m_motorImpulse
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA = this.m_bodyA.m_sweep.localCenter;
        this.m_localCenterB = this.m_bodyB.m_sweep.localCenter;
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var d = b2Vec2.Add(b2Vec2.Subtract(cB, cA), b2Vec2.Subtract(rB, rA));
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        this.m_axis = b2Mul_r_v2(qA, this.m_localXAxisA);
        this.m_a1 = b2Cross_v2_v2(b2Vec2.Add(d, rA), this.m_axis);
        this.m_a2 = b2Cross_v2_v2(rB, this.m_axis);
        this.m_motorMass = mA + mB + iA * this.m_a1 * this.m_a1 + iB * this.m_a2 * this.m_a2;
        if (this.m_motorMass > 0) {
            this.m_motorMass = 1 / this.m_motorMass
        }
        this.m_perp = b2Mul_r_v2(qA, this.m_localYAxisA);
        this.m_s1 = b2Cross_v2_v2(b2Vec2.Add(d, rA), this.m_perp);
        this.m_s2 = b2Cross_v2_v2(rB, this.m_perp);
        var k11 = mA + mB + iA * this.m_s1 * this.m_s1 + iB * this.m_s2 * this.m_s2;
        var k12 = iA * this.m_s1 + iB * this.m_s2;
        var k13 = iA * this.m_s1 * this.m_a1 + iB * this.m_s2 * this.m_a2;
        var k22 = iA + iB;
        if (k22 == 0) {
            k22 = 1
        }
        var k23 = iA * this.m_a1 + iB * this.m_a2;
        var k33 = mA + mB + iA * this.m_a1 * this.m_a1 + iB * this.m_a2 * this.m_a2;
        this.m_K.ex.Set(k11, k12, k13);
        this.m_K.ey.Set(k12, k22, k23);
        this.m_K.ez.Set(k13, k23, k33);
        if (this.m_enableLimit) {
            var jointTranslation = b2Dot_v2_v2(this.m_axis, d);
            if (b2Abs(this.m_upperTranslation - this.m_lowerTranslation) < 2 * b2_linearSlop) {
                this.m_limitState = b2Joint.e_equalLimits
            } else {
                if (jointTranslation <= this.m_lowerTranslation) {
                    if (this.m_limitState != b2Joint.e_atLowerLimit) {
                        this.m_limitState = b2Joint.e_atLowerLimit;
                        this.m_impulse.z = 0
                    }
                } else {
                    if (jointTranslation >= this.m_upperTranslation) {
                        if (this.m_limitState != b2Joint.e_atUpperLimit) {
                            this.m_limitState = b2Joint.e_atUpperLimit;
                            this.m_impulse.z = 0
                        }
                    } else {
                        this.m_limitState = b2Joint.e_inactiveLimit;
                        this.m_impulse.z = 0
                    }
                }
            }
        } else {
            this.m_limitState = b2Joint.e_inactiveLimit;
            this.m_impulse.z = 0
        }
        if (this.m_enableMotor == false) {
            this.m_motorImpulse = 0
        }
        if (data.step.warmStarting) {
            this.m_impulse.Multiply(data.step.dtRatio);
            this.m_motorImpulse *= data.step.dtRatio;
            var P = b2Vec2.Add(b2Vec2.Multiply(this.m_impulse.x, this.m_perp), b2Vec2.Multiply((this.m_motorImpulse + this.m_impulse.z), this.m_axis));
            var LA = this.m_impulse.x * this.m_s1 + this.m_impulse.y + (this.m_motorImpulse + this.m_impulse.z) * this.m_a1;
            var LB = this.m_impulse.x * this.m_s2 + this.m_impulse.y + (this.m_motorImpulse + this.m_impulse.z) * this.m_a2;
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * LA;
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * LB
        } else {
            this.m_impulse.SetZero();
            this.m_motorImpulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        if (this.m_enableMotor && this.m_limitState != b2Joint.e_equalLimits) {
            var Cdot = b2Dot_v2_v2(this.m_axis, b2Vec2.Subtract(vB, vA)) + this.m_a2 * wB - this.m_a1 * wA;
            var impulse = this.m_motorMass * (this.m_motorSpeed - Cdot);
            var oldImpulse = this.m_motorImpulse;
            var maxImpulse = data.step.dt * this.m_maxMotorForce;
            this.m_motorImpulse = b2Clamp(this.m_motorImpulse + impulse, -maxImpulse, maxImpulse);
            impulse = this.m_motorImpulse - oldImpulse;
            var P = b2Vec2.Multiply(impulse, this.m_axis);
            var LA = impulse * this.m_a1;
            var LB = impulse * this.m_a2;
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * LA;
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * LB
        }
        var Cdot1 = new b2Vec2();
        Cdot1.x = b2Dot_v2_v2(this.m_perp, b2Vec2.Subtract(vB, vA)) + this.m_s2 * wB - this.m_s1 * wA;
        Cdot1.y = wB - wA;
        if (this.m_enableLimit && this.m_limitState != b2Joint.e_inactiveLimit) {
            var Cdot2;
            Cdot2 = b2Dot_v2_v2(this.m_axis, b2Vec2.Subtract(vB, vA)) + this.m_a2 * wB - this.m_a1 * wA;
            var Cdot = new b2Vec3(Cdot1.x, Cdot1.y, Cdot2);
            var f1 = this.m_impulse.Clone();
            var df = this.m_K.Solve33(Cdot.Negate());
            this.m_impulse.Add(df);
            if (this.m_limitState == b2Joint.e_atLowerLimit) {
                this.m_impulse.z = b2Max(this.m_impulse.z, 0)
            } else {
                if (this.m_limitState == b2Joint.e_atUpperLimit) {
                    this.m_impulse.z = b2Min(this.m_impulse.z, 0)
                }
            }
            var b = b2Vec2.Subtract(Cdot1.Negate(), b2Vec2.Multiply((this.m_impulse.z - f1.z), new b2Vec2(this.m_K.ez.x, this.m_K.ez.y)));
            var f2r = b2Vec2.Add(this.m_K.Solve22(b), new b2Vec2(f1.x, f1.y));
            this.m_impulse.x = f2r.x;
            this.m_impulse.y = f2r.y;
            df = b2Vec3.Subtract(this.m_impulse, f1);
            var P = b2Vec2.Add(b2Vec2.Multiply(df.x, this.m_perp), b2Vec2.Multiply(df.z, this.m_axis));
            var LA = df.x * this.m_s1 + df.y + df.z * this.m_a1;
            var LB = df.x * this.m_s2 + df.y + df.z * this.m_a2;
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * LA;
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * LB
        } else {
            var df = this.m_K.Solve22(Cdot1.Negate());
            this.m_impulse.x += df.x;
            this.m_impulse.y += df.y;
            var P = b2Vec2.Multiply(df.x, this.m_perp);
            var LA = df.x * this.m_s1 + df.y;
            var LB = df.x * this.m_s2 + df.y;
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * LA;
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * LB
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var d = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
        var axis = b2Mul_r_v2(qA, this.m_localXAxisA);
        var a1 = b2Cross_v2_v2(b2Vec2.Add(d, rA), axis);
        var a2 = b2Cross_v2_v2(rB, axis);
        var perp = b2Mul_r_v2(qA, this.m_localYAxisA);
        var s1 = b2Cross_v2_v2(b2Vec2.Add(d, rA), perp);
        var s2 = b2Cross_v2_v2(rB, perp);
        var impulse = new b2Vec3();
        var C1 = new b2Vec2();
        C1.x = b2Dot_v2_v2(perp, d);
        C1.y = aB - aA - this.m_referenceAngle;
        var linearError = b2Abs(C1.x);
        var angularError = b2Abs(C1.y);
        var active = false;
        var C2 = 0;
        if (this.m_enableLimit) {
            var translation = b2Dot_v2_v2(axis, d);
            if (b2Abs(this.m_upperTranslation - this.m_lowerTranslation) < 2 * b2_linearSlop) {
                C2 = b2Clamp(translation, -b2_maxLinearCorrection, b2_maxLinearCorrection);
                linearError = b2Max(linearError, b2Abs(translation));
                active = true
            } else {
                if (translation <= this.m_lowerTranslation) {
                    C2 = b2Clamp(translation - this.m_lowerTranslation + b2_linearSlop, -b2_maxLinearCorrection, 0);
                    linearError = b2Max(linearError, this.m_lowerTranslation - translation);
                    active = true
                } else {
                    if (translation >= this.m_upperTranslation) {
                        C2 = b2Clamp(translation - this.m_upperTranslation - b2_linearSlop, 0, b2_maxLinearCorrection);
                        linearError = b2Max(linearError, translation - this.m_upperTranslation);
                        active = true
                    }
                }
            }
        }
        if (active) {
            var k11 = mA + mB + iA * s1 * s1 + iB * s2 * s2;
            var k12 = iA * s1 + iB * s2;
            var k13 = iA * s1 * a1 + iB * s2 * a2;
            var k22 = iA + iB;
            if (k22 == 0) {
                k22 = 1
            }
            var k23 = iA * a1 + iB * a2;
            var k33 = mA + mB + iA * a1 * a1 + iB * a2 * a2;
            var K = new b2Mat33();
            K.ex.Set(k11, k12, k13);
            K.ey.Set(k12, k22, k23);
            K.ez.Set(k13, k23, k33);
            var C = new b2Vec3();
            C.x = C1.x;
            C.y = C1.y;
            C.z = C2;
            impulse = K.Solve33(C.Negate())
        } else {
            var k11 = mA + mB + iA * s1 * s1 + iB * s2 * s2;
            var k12 = iA * s1 + iB * s2;
            var k22 = iA + iB;
            if (k22 == 0) {
                k22 = 1
            }
            var K = new b2Mat22();
            K.ex.Set(k11, k12);
            K.ey.Set(k12, k22);
            var impulse1 = K.Solve(C1.Negate());
            impulse.x = impulse1.x;
            impulse.y = impulse1.y;
            impulse.z = 0
        }
        var P = b2Vec2.Add(b2Vec2.Multiply(impulse.x, perp), b2Vec2.Multiply(impulse.z, axis));
        var LA = impulse.x * s1 + impulse.y + impulse.z * a1;
        var LB = impulse.x * s2 + impulse.y + impulse.z * a2;
        cA.Subtract(b2Vec2.Multiply(mA, P));
        aA -= iA * LA;
        cB.Add(b2Vec2.Multiply(mB, P));
        aB += iB * LB;
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return linearError <= b2_linearSlop && angularError <= b2_angularSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.localAxisA = this.m_localXAxisA._serialize();
        obj.referenceAngle = this.m_referenceAngle;
        obj.enableLimit = this.m_enableLimit;
        obj.lowerTranslation = this.m_lowerTranslation;
        obj.upperTranslation = this.m_upperTranslation;
        obj.enableMotor = this.m_enableMotor;
        obj.maxMotorForce = this.m_maxMotorForce;
        obj.motorSpeed = this.m_motorSpeed;
        return obj
    }
};
b2PrismaticJoint._extend(b2Joint);

function b2FrictionJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_frictionJoint;
    this.localAnchorA = new b2Vec2();
    this.localAnchorB = new b2Vec2();
    this.maxForce = 0;
    this.maxTorque = 0;
    Object.seal(this)
}
b2FrictionJointDef.prototype = {
    Initialize: function (bA, bB, anchor) {
        this.bodyA = bA;
        this.bodyB = bB;
        this.localAnchorA.Assign(this.bodyA.GetLocalPoint(anchor));
        this.localAnchorB.Assign(this.bodyB.GetLocalPoint(anchor))
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.maxForce = data.maxForce;
        this.maxTorque = data.maxTorque
    }
};
b2FrictionJointDef._extend(b2JointDef);

function b2FrictionJoint(def) {
    this.parent.call(this, def);
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_linearImpulse = new b2Vec2();
    this.m_angularImpulse = 0;
    this.m_maxForce = def.maxForce;
    this.m_maxTorque = def.maxTorque;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_linearMass = new b2Mat22();
    this.m_angularMass = 0
}
b2FrictionJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        return b2Vec2.Multiply(inv_dt, this.m_linearImpulse)
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * this.m_angularImpulse
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    SetMaxForce: function (force) {
        this.m_maxForce = force
    },
    GetMaxForce: function () {
        return this.m_maxForce
    },
    SetMaxTorque: function (torque) {
        this.m_maxTorque = torque
    },
    GetMaxTorque: function () {
        return this.m_maxTorque
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        this.m_rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var K = new b2Mat22();
        K.ex.x = mA + mB + iA * this.m_rA.y * this.m_rA.y + iB * this.m_rB.y * this.m_rB.y;
        K.ex.y = -iA * this.m_rA.x * this.m_rA.y - iB * this.m_rB.x * this.m_rB.y;
        K.ey.x = K.ex.y;
        K.ey.y = mA + mB + iA * this.m_rA.x * this.m_rA.x + iB * this.m_rB.x * this.m_rB.x;
        this.m_linearMass = K.GetInverse();
        this.m_angularMass = iA + iB;
        if (this.m_angularMass > 0) {
            this.m_angularMass = 1 / this.m_angularMass
        }
        if (data.step.warmStarting) {
            this.m_linearImpulse.Multiply(data.step.dtRatio);
            this.m_angularImpulse *= data.step.dtRatio;
            var P = new b2Vec2(this.m_linearImpulse.x, this.m_linearImpulse.y);
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * (b2Cross_v2_v2(this.m_rA, P) + this.m_angularImpulse);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * (b2Cross_v2_v2(this.m_rB, P) + this.m_angularImpulse)
        } else {
            this.m_linearImpulse.SetZero();
            this.m_angularImpulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var h = data.step.dt;
        var Cdot = wB - wA;
        var impulse = -this.m_angularMass * Cdot;
        var oldImpulse = this.m_angularImpulse;
        var maxImpulse = h * this.m_maxTorque;
        this.m_angularImpulse = b2Clamp(this.m_angularImpulse + impulse, -maxImpulse, maxImpulse);
        impulse = this.m_angularImpulse - oldImpulse;
        wA -= iA * impulse;
        wB += iB * impulse;
        var Cdot = b2Vec2.Add(vB, b2Vec2.Subtract(b2Cross_f_v2(wB, this.m_rB), b2Vec2.Subtract(vA, b2Cross_f_v2(wA, this.m_rA))));
        var impulse = b2Mul_m22_v2(this.m_linearMass, Cdot).Negate();
        var oldImpulse = this.m_linearImpulse.Clone();
        this.m_linearImpulse.Add(impulse);
        var maxImpulse = h * this.m_maxForce;
        if (this.m_linearImpulse.LengthSquared() > maxImpulse * maxImpulse) {
            this.m_linearImpulse.Normalize();
            this.m_linearImpulse.Multiply(maxImpulse)
        }
        impulse = b2Vec2.Subtract(this.m_linearImpulse, oldImpulse);
        vA.Subtract(b2Vec2.Multiply(mA, impulse));
        wA -= iA * b2Cross_v2_v2(this.m_rA, impulse);
        vB.Add(b2Vec2.Multiply(mB, impulse));
        wB += iB * b2Cross_v2_v2(this.m_rB, impulse);
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        return true
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.maxForce = this.m_maxForce;
        obj.maxTorque = this.m_maxTorque;
        return obj
    }
};
b2FrictionJoint._extend(b2Joint);

function b2WeldJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_weldJoint;
    this.localAnchorA = new b2Vec2(0, 0);
    this.localAnchorB = new b2Vec2(0, 0);
    this.referenceAngle = 0;
    this.frequencyHz = 0;
    this.dampingRatio = 0;
    Object.seal(this)
}
b2WeldJointDef.prototype = {
    Initialize: function (bA, bB, anchor) {
        this.bodyA = bA;
        this.bodyB = bB;
        this.localAnchorA.Assign(this.bodyA.GetLocalPoint(anchor));
        this.localAnchorB.Assign(this.bodyB.GetLocalPoint(anchor));
        this.referenceAngle = this.bodyB.GetAngle() - this.bodyA.GetAngle()
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.referenceAngle = data.referenceAngle;
        this.frequencyHz = data.frequencyHz;
        this.dampingRatio = data.dampingRatio
    }
};
b2WeldJointDef._extend(b2JointDef);

function b2WeldJoint(def) {
    this.parent.call(this, def);
    this.m_bias = 0;
    this.m_gamma = 0;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_mass = new b2Mat33();
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_referenceAngle = def.referenceAngle;
    this.m_frequencyHz = def.frequencyHz;
    this.m_dampingRatio = def.dampingRatio;
    this.m_impulse = new b2Vec3()
}
b2WeldJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        var P = new b2Vec2(this.m_impulse.x, this.m_impulse.y);
        return b2Vec2.Multiply(inv_dt, P)
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * this.m_impulse.z
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    GetReferenceAngle: function () {
        return this.m_referenceAngle
    },
    SetFrequency: function (hz) {
        this.m_frequencyHz = hz
    },
    GetFrequency: function () {
        return this.m_frequencyHz
    },
    SetDampingRatio: function (ratio) {
        this.m_dampingRatio = ratio
    },
    GetDampingRatio: function () {
        return this.m_dampingRatio
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA.Assign(b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA)));
        this.m_rB.Assign(b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB)));
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var K = new b2Mat33();
        K.ex.x = mA + mB + this.m_rA.y * this.m_rA.y * iA + this.m_rB.y * this.m_rB.y * iB;
        K.ey.x = -this.m_rA.y * this.m_rA.x * iA - this.m_rB.y * this.m_rB.x * iB;
        K.ez.x = -this.m_rA.y * iA - this.m_rB.y * iB;
        K.ex.y = K.ey.x;
        K.ey.y = mA + mB + this.m_rA.x * this.m_rA.x * iA + this.m_rB.x * this.m_rB.x * iB;
        K.ez.y = this.m_rA.x * iA + this.m_rB.x * iB;
        K.ex.z = K.ez.x;
        K.ey.z = K.ez.y;
        K.ez.z = iA + iB;
        if (this.m_frequencyHz > 0) {
            K.GetInverse22(this.m_mass);
            var invM = iA + iB;
            var m = invM > 0 ? 1 / invM : 0;
            var C = aB - aA - this.m_referenceAngle;
            var omega = 2 * b2_pi * this.m_frequencyHz;
            var d = 2 * m * this.m_dampingRatio * omega;
            var k = m * omega * omega;
            var h = data.step.dt;
            this.m_gamma = h * (d + h * k);
            this.m_gamma = this.m_gamma != 0 ? 1 / this.m_gamma : 0;
            this.m_bias = C * h * k * this.m_gamma;
            invM += this.m_gamma;
            this.m_mass.ez.z = invM != 0 ? 1 / invM : 0
        } else {
            K.GetSymInverse33(this.m_mass);
            this.m_gamma = 0;
            this.m_bias = 0
        }
        if (data.step.warmStarting) {
            this.m_impulse.Multiply(data.step.dtRatio);
            var P = new b2Vec2(this.m_impulse.x, this.m_impulse.y);
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * (b2Cross_v2_v2(this.m_rA, P) + this.m_impulse.z);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * (b2Cross_v2_v2(this.m_rB, P) + this.m_impulse.z)
        } else {
            this.m_impulse.SetZero()
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        if (this.m_frequencyHz > 0) {
            var Cdot2 = wB - wA;
            var impulse2 = -this.m_mass.ez.z * (Cdot2 + this.m_bias + this.m_gamma * this.m_impulse.z);
            this.m_impulse.z += impulse2;
            wA -= iA * impulse2;
            wB += iB * impulse2;
            var Cdot1 = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB)), vA), b2Cross_f_v2(wA, this.m_rA));
            var impulse1 = b2Mul22_m33_v2(this.m_mass, Cdot1).Negate();
            this.m_impulse.x += impulse1.x;
            this.m_impulse.y += impulse1.y;
            var P = impulse1.Clone();
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * b2Cross_v2_v2(this.m_rA, P);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * b2Cross_v2_v2(this.m_rB, P)
        } else {
            var Cdot1 = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB)), vA), b2Cross_f_v2(wA, this.m_rA));
            var Cdot2 = wB - wA;
            var Cdot = new b2Vec3(Cdot1.x, Cdot1.y, Cdot2);
            var impulse = b2Mul_m33_v3(this.m_mass, Cdot).Negate();
            this.m_impulse.Add(impulse);
            var P = new b2Vec2(impulse.x, impulse.y);
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * (b2Cross_v2_v2(this.m_rA, P) + impulse.z);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * (b2Cross_v2_v2(this.m_rB, P) + impulse.z)
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var positionError, angularError;
        var K = new b2Mat33();
        K.ex.x = mA + mB + rA.y * rA.y * iA + rB.y * rB.y * iB;
        K.ey.x = -rA.y * rA.x * iA - rB.y * rB.x * iB;
        K.ez.x = -rA.y * iA - rB.y * iB;
        K.ex.y = K.ey.x;
        K.ey.y = mA + mB + rA.x * rA.x * iA + rB.x * rB.x * iB;
        K.ez.y = rA.x * iA + rB.x * iB;
        K.ex.z = K.ez.x;
        K.ey.z = K.ez.y;
        K.ez.z = iA + iB;
        if (this.m_frequencyHz > 0) {
            var C1 = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
            positionError = C1.Length();
            angularError = 0;
            var P = K.Solve22(C1).Negate();
            cA.Subtract(b2Vec2.Multiply(mA, P));
            aA -= iA * b2Cross_v2_v2(rA, P);
            cB.Add(b2Vec2.Multiply(mB, P));
            aB += iB * b2Cross_v2_v2(rB, P)
        } else {
            var C1 = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
            var C2 = aB - aA - this.m_referenceAngle;
            positionError = C1.Length();
            angularError = b2Abs(C2);
            var C = new b2Vec3(C1.x, C1.y, C2);
            var impulse = K.Solve33(C).Negate();
            var P = new b2Vec2(impulse.x, impulse.y);
            cA.Subtract(b2Vec2.Multiply(mA, P));
            aA -= iA * (b2Cross_v2_v2(rA, P) + impulse.z);
            cB.Add(b2Vec2.Multiply(mB, P));
            aB += iB * (b2Cross_v2_v2(rB, P) + impulse.z)
        }
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return positionError <= b2_linearSlop && angularError <= b2_angularSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.referenceAngle = this.m_referenceAngle;
        obj.frequencyHz = this.m_frequencyHz;
        obj.dampingRatio = this.m_dampingRatio;
        return obj
    }
};
b2WeldJoint._extend(b2Joint);

function b2WheelJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_wheelJoint;
    this.localAnchorA = new b2Vec2();
    this.localAnchorB = new b2Vec2();
    this.localAxisA = new b2Vec2(1, 0);
    this.enableMotor = false;
    this.maxMotorTorque = 0;
    this.motorSpeed = 0;
    this.frequencyHz = 2;
    this.dampingRatio = 0.7;
    Object.seal(this)
}
b2WheelJointDef.prototype = {
    Initialize: function (bA, bB, anchor, axis) {
        this.bodyA = bA;
        this.bodyB = bB;
        this.localAnchorA.Assign(this.bodyA.GetLocalPoint(anchor));
        this.localAnchorB.Assign(this.bodyB.GetLocalPoint(anchor));
        this.localAxisA.Assign(this.bodyA.GetLocalVector(axis))
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.localAxisA._deserialize(data.localAxisA);
        this.enableMotor = data.enableMotor;
        this.maxMotorTorque = data.maxMotorTorque;
        this.motorSpeed = data.motorSpeed;
        this.frequencyHz = data.frequencyHz;
        this.dampingRatio = data.dampingRatio
    }
};
b2WheelJointDef._extend(b2JointDef);

function b2WheelJoint(def) {
    this.parent.call(this, def);
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_localXAxisA = def.localAxisA.Clone();
    this.m_localYAxisA = b2Cross_f_v2(1, this.m_localXAxisA);
    this.m_mass = 0;
    this.m_impulse = 0;
    this.m_motorMass = 0;
    this.m_motorImpulse = 0;
    this.m_springMass = 0;
    this.m_springImpulse = 0;
    this.m_maxMotorTorque = def.maxMotorTorque;
    this.m_motorSpeed = def.motorSpeed;
    this.m_enableMotor = def.enableMotor;
    this.m_frequencyHz = def.frequencyHz;
    this.m_dampingRatio = def.dampingRatio;
    this.m_bias = 0;
    this.m_gamma = 0;
    this.m_ax = new b2Vec2();
    this.m_ay = new b2Vec2();
    this.m_sAx = this.m_sBx = 0;
    this.m_sAy = this.m_sBy = 0
}
b2WheelJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        return b2Vec2.Multiply(inv_dt, b2Vec2.Add(b2Vec2.Multiply(this.m_impulse, this.m_ay), b2Vec2.Multiply(this.m_springImpulse, this.m_ax)))
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * this.m_motorImpulse
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    GetLocalAxisA: function () {
        return this.m_localXAxisA
    },
    GetJointTranslation: function () {
        var bA = this.m_bodyA;
        var bB = this.m_bodyB;
        var pA = bA.GetWorldPoint(this.m_localAnchorA);
        var pB = bB.GetWorldPoint(this.m_localAnchorB);
        var d = b2Vec2.Subtract(pB, pA);
        var axis = bA.GetWorldVector(this.m_localXAxisA);
        var translation = b2Dot_v2_v2(d, axis);
        return translation
    },
    GetJointSpeed: function () {
        var wA = this.m_bodyA.m_angularVelocity;
        var wB = this.m_bodyB.m_angularVelocity;
        return wB - wA
    },
    IsMotorEnabled: function () {
        return this.m_enableMotor
    },
    EnableMotor: function (flag) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_enableMotor = flag
    },
    SetMotorSpeed: function (speed) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_motorSpeed = speed
    },
    GetMotorSpeed: function () {
        return this.m_motorSpeed
    },
    SetMaxMotorTorque: function (torque) {
        this.m_bodyA.SetAwake(true);
        this.m_bodyB.SetAwake(true);
        this.m_maxMotorTorque = torque
    },
    GetMaxMotorTorque: function () {
        return this.m_maxMotorTorque
    },
    GetMotorTorque: function (inv_dt) {
        return inv_dt * this.m_motorImpulse
    },
    SetSpringFrequencyHz: function (hz) {
        this.m_frequencyHz = hz
    },
    GetSpringFrequencyHz: function () {
        return this.m_frequencyHz
    },
    SetSpringDampingRatio: function (ratio) {
        this.m_dampingRatio = ratio
    },
    GetSpringDampingRatio: function () {
        return this.m_dampingRatio
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var d = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
        this.m_ay.Assign(b2Mul_r_v2(qA, this.m_localYAxisA));
        this.m_sAy = b2Cross_v2_v2(b2Vec2.Add(d, rA), this.m_ay);
        this.m_sBy = b2Cross_v2_v2(rB, this.m_ay);
        this.m_mass = mA + mB + iA * this.m_sAy * this.m_sAy + iB * this.m_sBy * this.m_sBy;
        if (this.m_mass > 0) {
            this.m_mass = 1 / this.m_mass
        }
        this.m_springMass = 0;
        this.m_bias = 0;
        this.m_gamma = 0;
        if (this.m_frequencyHz > 0) {
            this.m_ax.Assign(b2Mul_r_v2(qA, this.m_localXAxisA));
            this.m_sAx = b2Cross_v2_v2(b2Vec2.Add(d, rA), this.m_ax);
            this.m_sBx = b2Cross_v2_v2(rB, this.m_ax);
            var invMass = mA + mB + iA * this.m_sAx * this.m_sAx + iB * this.m_sBx * this.m_sBx;
            if (invMass > 0) {
                this.m_springMass = 1 / invMass;
                var C = b2Dot_v2_v2(d, this.m_ax);
                var omega = 2 * b2_pi * this.m_frequencyHz;
                var d = 2 * this.m_springMass * this.m_dampingRatio * omega;
                var k = this.m_springMass * omega * omega;
                var h = data.step.dt;
                this.m_gamma = h * (d + h * k);
                if (this.m_gamma > 0) {
                    this.m_gamma = 1 / this.m_gamma
                }
                this.m_bias = C * h * k * this.m_gamma;
                this.m_springMass = invMass + this.m_gamma;
                if (this.m_springMass > 0) {
                    this.m_springMass = 1 / this.m_springMass
                }
            }
        } else {
            this.m_springImpulse = 0
        }
        if (this.m_enableMotor) {
            this.m_motorMass = iA + iB;
            if (this.m_motorMass > 0) {
                this.m_motorMass = 1 / this.m_motorMass
            }
        } else {
            this.m_motorMass = 0;
            this.m_motorImpulse = 0
        }
        if (data.step.warmStarting) {
            this.m_impulse *= data.step.dtRatio;
            this.m_springImpulse *= data.step.dtRatio;
            this.m_motorImpulse *= data.step.dtRatio;
            var P = b2Vec2.Add(b2Vec2.Multiply(this.m_impulse, this.m_ay), b2Vec2.Multiply(this.m_springImpulse, this.m_ax));
            var LA = this.m_impulse * this.m_sAy + this.m_springImpulse * this.m_sAx + this.m_motorImpulse;
            var LB = this.m_impulse * this.m_sBy + this.m_springImpulse * this.m_sBx + this.m_motorImpulse;
            vA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
            wA -= this.m_invIA * LA;
            vB.Add(b2Vec2.Multiply(this.m_invMassB, P));
            wB += this.m_invIB * LB
        } else {
            this.m_impulse = 0;
            this.m_springImpulse = 0;
            this.m_motorImpulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var Cdot = b2Dot_v2_v2(this.m_ax, b2Vec2.Subtract(vB, vA)) + this.m_sBx * wB - this.m_sAx * wA;
        var impulse = -this.m_springMass * (Cdot + this.m_bias + this.m_gamma * this.m_springImpulse);
        this.m_springImpulse += impulse;
        var P = b2Vec2.Multiply(impulse, this.m_ax);
        var LA = impulse * this.m_sAx;
        var LB = impulse * this.m_sBx;
        vA.Subtract(b2Vec2.Multiply(mA, P));
        wA -= iA * LA;
        vB.Add(b2Vec2.Multiply(mB, P));
        wB += iB * LB;
        var Cdot = wB - wA - this.m_motorSpeed;
        var impulse = -this.m_motorMass * Cdot;
        var oldImpulse = this.m_motorImpulse;
        var maxImpulse = data.step.dt * this.m_maxMotorTorque;
        this.m_motorImpulse = b2Clamp(this.m_motorImpulse + impulse, -maxImpulse, maxImpulse);
        impulse = this.m_motorImpulse - oldImpulse;
        wA -= iA * impulse;
        wB += iB * impulse;
        var Cdot = b2Dot_v2_v2(this.m_ay, b2Vec2.Subtract(vB, vA)) + this.m_sBy * wB - this.m_sAy * wA;
        var impulse = -this.m_mass * Cdot;
        this.m_impulse += impulse;
        var P = b2Vec2.Multiply(impulse, this.m_ay);
        var LA = impulse * this.m_sAy;
        var LB = impulse * this.m_sBy;
        vA.Subtract(b2Vec2.Multiply(mA, P));
        wA -= iA * LA;
        vB.Add(b2Vec2.Multiply(mB, P));
        wB += iB * LB;
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var d = b2Vec2.Add(b2Vec2.Subtract(cB, cA), b2Vec2.Subtract(rB, rA));
        var ay = b2Mul_r_v2(qA, this.m_localYAxisA);
        var sAy = b2Cross_v2_v2(b2Vec2.Add(d, rA), ay);
        var sBy = b2Cross_v2_v2(rB, ay);
        var C = b2Dot_v2_v2(d, ay);
        var k = this.m_invMassA + this.m_invMassB + this.m_invIA * this.m_sAy * this.m_sAy + this.m_invIB * this.m_sBy * this.m_sBy;
        var impulse;
        if (k != 0) {
            impulse = -C / k
        } else {
            impulse = 0
        }
        var P = b2Vec2.Multiply(impulse, ay);
        var LA = impulse * sAy;
        var LB = impulse * sBy;
        cA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
        aA -= this.m_invIA * LA;
        cB.Add(b2Vec2.Multiply(this.m_invMassB, P));
        aB += this.m_invIB * LB;
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return b2Abs(C) <= b2_linearSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.localAxisA = this.m_localAxisA._serialize();
        obj.enableMotor = this.m_enableMotor;
        obj.maxMotorTorque = this.m_maxMotorTorque;
        obj.motorSpeed = this.m_motorSpeed;
        obj.frequencyHz = this.m_frequencyHz;
        obj.dampingRatio = this.m_dampingRatio;
        return obj
    }
};
b2WheelJoint._extend(b2Joint);

function b2GearJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_gearJoint;
    this.joint1 = null;
    this.joint2 = null;
    this.ratio = 1;
    Object.seal(this)
}
b2GearJointDef.prototype = {
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.joint1 = data.joint1;
        this.joint2 = data.joint2;
        this.ratio = data.ratio
    }
};
b2GearJointDef._extend(b2JointDef);

function b2GearJoint(def) {
    this.parent.call(this, def);
    this.m_joint1 = def.joint1;
    this.m_joint2 = def.joint2;
    this.m_typeA = this.m_joint1.GetType();
    this.m_typeB = this.m_joint2.GetType();
    var coordinateA, coordinateB;
    this.m_bodyC = this.m_joint1.GetBodyA();
    this.m_bodyA = this.m_joint1.GetBodyB();
    var xfA = this.m_bodyA.m_xf;
    var aA = this.m_bodyA.m_sweep.a;
    var xfC = this.m_bodyC.m_xf;
    var aC = this.m_bodyC.m_sweep.a;
    this.m_localAnchorA = new b2Vec2();
    this.m_localAnchorB = new b2Vec2();
    this.m_localAnchorC = new b2Vec2();
    this.m_localAnchorD = new b2Vec2();
    this.m_localAxisC = new b2Vec2();
    this.m_localAxisD = new b2Vec2();
    if (this.m_typeA == b2Joint.e_revoluteJoint) {
        var revolute = def.joint1;
        this.m_localAnchorC.Assign(revolute.m_localAnchorA);
        this.m_localAnchorA.Assign(revolute.m_localAnchorB);
        this.m_referenceAngleA = revolute.m_referenceAngle;
        this.m_localAxisC.SetZero();
        coordinateA = aA - aC - this.m_referenceAngleA
    } else {
        var prismatic = def.joint1;
        this.m_localAnchorC.Assign(prismatic.m_localAnchorA);
        this.m_localAnchorA.Assign(prismatic.m_localAnchorB);
        this.m_referenceAngleA = prismatic.m_referenceAngle;
        this.m_localAxisC.Assign(prismatic.m_localXAxisA);
        var pC = this.m_localAnchorC;
        var pA = b2MulT_r_v2(xfC.q, b2Vec2.Add(b2Mul_r_v2(xfA.q, this.m_localAnchorA), b2Vec2.Subtract(xfA.p, xfC.p)));
        coordinateA = b2Dot_v2_v2(b2Vec2.Subtract(pA, pC), this.m_localAxisC)
    }
    this.m_bodyD = this.m_joint2.GetBodyA();
    this.m_bodyB = this.m_joint2.GetBodyB();
    var xfB = this.m_bodyB.m_xf;
    var aB = this.m_bodyB.m_sweep.a;
    var xfD = this.m_bodyD.m_xf;
    var aD = this.m_bodyD.m_sweep.a;
    if (this.m_typeB == b2Joint.e_revoluteJoint) {
        var revolute = def.joint2;
        this.m_localAnchorD.Assign(revolute.m_localAnchorA);
        this.m_localAnchorB.Assign(revolute.m_localAnchorB);
        this.m_referenceAngleB = revolute.m_referenceAngle;
        this.m_localAxisD.SetZero();
        coordinateB = aB - aD - this.m_referenceAngleB
    } else {
        var prismatic = def.joint2;
        this.m_localAnchorD.Assign(prismatic.m_localAnchorA);
        this.m_localAnchorB.Assign(prismatic.m_localAnchorB);
        this.m_referenceAngleB = prismatic.m_referenceAngle;
        this.m_localAxisD.Assign(prismatic.m_localXAxisA);
        var pD = this.m_localAnchorD;
        var pB = b2MulT_r_v2(xfD.q, b2Vec2.Add(b2Mul_r_v2(xfB.q, this.m_localAnchorB), b2Vec2.Subtract(xfB.p, xfD.p)));
        coordinateB = b2Dot_v2_v2(b2Vec2.Subtract(pB, pD), this.m_localAxisD)
    }
    this.m_ratio = def.ratio;
    this.m_constant = coordinateA + this.m_ratio * coordinateB;
    this.m_impulse = 0;
    this.m_indexA = this.m_indexB = this.m_indexC = this.m_indexD = 0;
    this.m_lcA = new b2Vec2();
    this.m_lcB = new b2Vec2();
    this.m_lcC = new b2Vec2();
    this.m_lcD = new b2Vec2();
    this.m_mA = this.m_mB = this.m_mC = this.m_mD = 0;
    this.m_iA = this.m_iB = this.m_iC = this.m_iD = 0;
    this.m_JvAC = new b2Vec2(), this.m_JvBD = new b2Vec2();
    this.m_JwA = this.m_JwB = this.m_JwC = this.m_JwD = 0;
    this.m_mass = 0
}
b2GearJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        var P = b2Vec2.Multiply(this.m_impulse, this.m_JvAC);
        return b2Vec2.Multiply(inv_dt, P)
    },
    GetReactionTorque: function (inv_dt) {
        var L = this.m_impulse * this.m_JwA;
        return inv_dt * L
    },
    GetJoint1: function () {
        return this.m_joint1
    },
    GetJoint2: function () {
        return this.m_joint2
    },
    SetRatio: function (ratio) {
        this.m_ratio = ratio
    },
    GetRatio: function () {
        return this.m_ratio
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_indexC = this.m_bodyC.m_islandIndex;
        this.m_indexD = this.m_bodyD.m_islandIndex;
        this.m_lcA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_lcB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_lcC.Assign(this.m_bodyC.m_sweep.localCenter);
        this.m_lcD.Assign(this.m_bodyD.m_sweep.localCenter);
        this.m_mA = this.m_bodyA.m_invMass;
        this.m_mB = this.m_bodyB.m_invMass;
        this.m_mC = this.m_bodyC.m_invMass;
        this.m_mD = this.m_bodyD.m_invMass;
        this.m_iA = this.m_bodyA.m_invI;
        this.m_iB = this.m_bodyB.m_invI;
        this.m_iC = this.m_bodyC.m_invI;
        this.m_iD = this.m_bodyD.m_invI;
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var aC = data.positions[this.m_indexC].a;
        var vC = data.velocities[this.m_indexC].v.Clone();
        var wC = data.velocities[this.m_indexC].w;
        var aD = data.positions[this.m_indexD].a;
        var vD = data.velocities[this.m_indexD].v.Clone();
        var wD = data.velocities[this.m_indexD].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB),
            qC = new b2Rot(aC),
            qD = new b2Rot(aD);
        this.m_mass = 0;
        if (this.m_typeA == b2Joint.e_revoluteJoint) {
            this.m_JvAC.SetZero();
            this.m_JwA = 1;
            this.m_JwC = 1;
            this.m_mass += this.m_iA + this.m_iC
        } else {
            var u = b2Mul_r_v2(qC, this.m_localAxisC);
            var rC = b2Mul_r_v2(qC, b2Vec2.Subtract(this.m_localAnchorC, this.m_lcC));
            var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_lcA));
            this.m_JvAC.Assign(u);
            this.m_JwC = b2Cross_v2_v2(rC, u);
            this.m_JwA = b2Cross_v2_v2(rA, u);
            this.m_mass += this.m_mC + this.m_mA + this.m_iC * this.m_JwC * this.m_JwC + this.m_iA * this.m_JwA * this.m_JwA
        }
        if (this.m_typeB == b2Joint.e_revoluteJoint) {
            this.m_JvBD.SetZero();
            this.m_JwB = this.m_ratio;
            this.m_JwD = this.m_ratio;
            this.m_mass += this.m_ratio * this.m_ratio * (this.m_iB + this.m_iD)
        } else {
            var u = b2Mul_r_v2(qD, this.m_localAxisD);
            var rD = b2Mul_r_v2(qD, b2Vec2.Subtract(this.m_localAnchorD, this.m_lcD));
            var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_lcB));
            this.m_JvBD.Assign(b2Vec2.Multiply(this.m_ratio, u));
            this.m_JwD = this.m_ratio * b2Cross_v2_v2(rD, u);
            this.m_JwB = this.m_ratio * b2Cross_v2_v2(rB, u);
            this.m_mass += this.m_ratio * this.m_ratio * (this.m_mD + this.m_mB) + this.m_iD * this.m_JwD * this.m_JwD + this.m_iB * this.m_JwB * this.m_JwB
        }
        this.m_mass = this.m_mass > 0 ? 1 / this.m_mass : 0;
        if (data.step.warmStarting) {
            vA.Add(b2Vec2.Multiply((this.m_mA * this.m_impulse), this.m_JvAC));
            wA += this.m_iA * this.m_impulse * this.m_JwA;
            vB.Add(b2Vec2.Multiply((this.m_mB * this.m_impulse), this.m_JvBD));
            wB += this.m_iB * this.m_impulse * this.m_JwB;
            vC.Subtract(b2Vec2.Multiply((this.m_mC * this.m_impulse), this.m_JvAC));
            wC -= this.m_iC * this.m_impulse * this.m_JwC;
            vD.Subtract(b2Vec2.Multiply((this.m_mD * this.m_impulse), this.m_JvBD));
            wD -= this.m_iD * this.m_impulse * this.m_JwD
        } else {
            this.m_impulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB;
        data.velocities[this.m_indexC].v.Assign(vC);
        data.velocities[this.m_indexC].w = wC;
        data.velocities[this.m_indexD].v.Assign(vD);
        data.velocities[this.m_indexD].w = wD
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var vC = data.velocities[this.m_indexC].v.Clone();
        var wC = data.velocities[this.m_indexC].w;
        var vD = data.velocities[this.m_indexD].v.Clone();
        var wD = data.velocities[this.m_indexD].w;
        var Cdot = b2Dot_v2_v2(this.m_JvAC, b2Vec2.Subtract(vA, vC)) + b2Dot_v2_v2(this.m_JvBD, b2Vec2.Subtract(vB, vD));
        Cdot += (this.m_JwA * wA - this.m_JwC * wC) + (this.m_JwB * wB - this.m_JwD * wD);
        var impulse = -this.m_mass * Cdot;
        this.m_impulse += impulse;
        vA.Add(b2Vec2.Multiply((this.m_mA * impulse), this.m_JvAC));
        wA += this.m_iA * impulse * this.m_JwA;
        vB.Add(b2Vec2.Multiply((this.m_mB * impulse), this.m_JvBD));
        wB += this.m_iB * impulse * this.m_JwB;
        vC.Subtract(b2Vec2.Multiply((this.m_mC * impulse), this.m_JvAC));
        wC -= this.m_iC * impulse * this.m_JwC;
        vD.Subtract(b2Vec2.Multiply((this.m_mD * impulse), this.m_JvBD));
        wD -= this.m_iD * impulse * this.m_JwD;
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB;
        data.velocities[this.m_indexC].v.Assign(vC);
        data.velocities[this.m_indexC].w = wC;
        data.velocities[this.m_indexD].v.Assign(vD);
        data.velocities[this.m_indexD].w = wD
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var cC = data.positions[this.m_indexC].c.Clone();
        var aC = data.positions[this.m_indexC].a;
        var cD = data.positions[this.m_indexD].c.Clone();
        var aD = data.positions[this.m_indexD].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB),
            qC = new b2Rot(aC),
            qD = new b2Rot(aD);
        var linearError = 0;
        var coordinateA, coordinateB;
        var JvAC = new b2Vec2(),
            JvBD = new b2Vec2();
        var JwA, JwB, JwC, JwD;
        var mass = 0;
        if (this.m_typeA == b2Joint.e_revoluteJoint) {
            JvAC.SetZero();
            JwA = 1;
            JwC = 1;
            mass += this.m_iA + this.m_iC;
            coordinateA = aA - aC - this.m_referenceAngleA
        } else {
            var u = b2Mul_r_v2(qC, this.m_localAxisC);
            var rC = b2Mul_r_v2(qC, b2Vec2.Subtract(this.m_localAnchorC, this.m_lcC));
            var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_lcA));
            JvAC.Assign(u);
            JwC = b2Cross_v2_v2(rC, u);
            JwA = b2Cross_v2_v2(rA, u);
            mass += this.m_mC + this.m_mA + this.m_iC * JwC * JwC + this.m_iA * JwA * JwA;
            var pC = b2Vec2.Subtract(this.m_localAnchorC, this.m_lcC);
            var pA = b2MulT_r_v2(qC, b2Vec2.Add(rA, b2Vec2.Subtract(cA, cC)));
            coordinateA = b2Dot_v2_v2(b2Vec2.Subtract(pA, pC), this.m_localAxisC)
        }
        if (this.m_typeB == b2Joint.e_revoluteJoint) {
            JvBD.SetZero();
            JwB = this.m_ratio;
            JwD = this.m_ratio;
            mass += this.m_ratio * this.m_ratio * (this.m_iB + this.m_iD);
            coordinateB = aB - aD - this.m_referenceAngleB
        } else {
            var u = b2Mul_r_v2(qD, this.m_localAxisD);
            var rD = b2Mul_r_v2(qD, b2Vec2.Subtract(this.m_localAnchorD, this.m_lcD));
            var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_lcB));
            JvBD.Assign(b2Vec2.Multiply(this.m_ratio, u));
            JwD = this.m_ratio * b2Cross_v2_v2(rD, u);
            JwB = this.m_ratio * b2Cross_v2_v2(rB, u);
            mass += this.m_ratio * this.m_ratio * (this.m_mD + this.m_mB) + this.m_iD * JwD * JwD + this.m_iB * JwB * JwB;
            var pD = b2Vec2.Subtract(this.m_localAnchorD, this.m_lcD);
            var pB = b2MulT_r_v2(qD, b2Vec2.Add(rB, b2Vec2.Subtract(cB, cD)));
            coordinateB = b2Dot_v2_v2(b2Vec2.Subtract(pB, pD), this.m_localAxisD)
        }
        var C = (coordinateA + this.m_ratio * coordinateB) - this.m_constant;
        var impulse = 0;
        if (mass > 0) {
            impulse = -C / mass
        }
        cA.Add(b2Vec2.Multiply(this.m_mA, b2Vec2.Multiply(impulse, JvAC)));
        aA += this.m_iA * impulse * JwA;
        cB.Add(b2Vec2.Multiply(this.m_mB, b2Vec2.Multiply(impulse, JvBD)));
        aB += this.m_iB * impulse * JwB;
        cC.Subtract(b2Vec2.Multiply(this.m_mC, b2Vec2.Multiply(impulse, JvAC)));
        aC -= this.m_iC * impulse * JwC;
        cD.Subtract(b2Vec2.Multiply(this.m_mD, b2Vec2.Multiply(impulse, JvBD)));
        aD -= this.m_iD * impulse * JwD;
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        data.positions[this.m_indexC].c.Assign(cC);
        data.positions[this.m_indexC].a = aC;
        data.positions[this.m_indexD].c.Assign(cD);
        data.positions[this.m_indexD].a = aD;
        return linearError < b2_linearSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.joint1 = this.m_joint1.__temp_joint_id;
        obj.joint2 = this.m_joint2.__temp_joint_id;
        obj.ratio = this.m_ratio;
        return obj
    }
};
b2GearJoint._extend(b2Joint);

function b2MotorJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_motorJoint;
    this.linearOffset = new b2Vec2();
    this.angularOffset = 0;
    this.maxForce = 1;
    this.maxTorque = 1;
    this.correctionFactor = 0.3;
    Object.seal(this)
}
b2MotorJointDef.prototype = {
    Initialize: function (bA, bB) {
        this.bodyA = bA;
        this.bodyB = bB;
        var xB = this.bodyB.GetPosition();
        this.linearOffset.Assign(this.bodyA.GetLocalPoint(xB));
        var angleA = this.bodyA.GetAngle();
        var angleB = this.bodyB.GetAngle();
        this.angularOffset = angleB - angleA
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.linearOffset._deserialize(data.linearOffset);
        this.angularOffset = data.angularOffset;
        this.maxForce = data.maxForce;
        this.maxTorque = data.maxTorque;
        this.correctionFactor = data.correctionFactor
    }
};
b2MotorJointDef._extend(b2JointDef);

function b2MotorJoint(def) {
    this.parent.call(this, def);
    this.m_linearOffset = def.linearOffset.Clone();
    this.m_angularOffset = def.angularOffset;
    this.m_linearImpulse = new b2Vec2();
    this.m_angularImpulse = 0;
    this.m_maxForce = def.maxForce;
    this.m_maxTorque = def.maxTorque;
    this.m_correctionFactor = def.correctionFactor;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_linearError = new b2Vec2();
    this.m_angularError = 0;
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_linearMass = new b2Mat22();
    this.m_angularMass = 0
}
b2MotorJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetPosition()
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetPosition()
    },
    GetReactionForce: function (inv_dt) {
        return b2Vec2.Multiply(inv_dt, this.m_linearImpulse)
    },
    GetReactionTorque: function (inv_dt) {
        return inv_dt * this.m_angularImpulse
    },
    SetLinearOffset: function (linearOffset) {
        if (linearOffset.x != this.m_linearOffset.x || linearOffset.y != this.m_linearOffset.y) {
            this.m_bodyA.SetAwake(true);
            this.m_bodyB.SetAwake(true);
            this.m_linearOffset.Assign(linearOffset)
        }
    },
    GetLinearOffset: function () {
        return this.m_linearOffset
    },
    SetAngularOffset: function (angularOffset) {
        if (angularOffset != this.m_angularOffset) {
            this.m_bodyA.SetAwake(true);
            this.m_bodyB.SetAwake(true);
            this.m_angularOffset = angularOffset
        }
    },
    GetAngularOffset: function () {
        return this.m_angularOffset
    },
    SetMaxForce: function (force) {
        this.m_maxForce = force
    },
    GetMaxForce: function () {
        return this.m_maxForce
    },
    SetMaxTorque: function (torque) {
        this.m_maxTorque = torque
    },
    GetMaxTorque: function () {
        return this.m_maxTorque
    },
    SetCorrectionFactor: function (factor) {
        this.m_correctionFactor = factor
    },
    GetCorrectionFactor: function () {
        return this.m_correctionFactor
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA.Assign(b2Mul_r_v2(qA, this.m_localCenterA.Negate()));
        this.m_rB.Assign(b2Mul_r_v2(qB, this.m_localCenterB.Negate()));
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var K = new b2Mat22();
        K.ex.x = mA + mB + iA * this.m_rA.y * this.m_rA.y + iB * this.m_rB.y * this.m_rB.y;
        K.ex.y = -iA * this.m_rA.x * this.m_rA.y - iB * this.m_rB.x * this.m_rB.y;
        K.ey.x = K.ex.y;
        K.ey.y = mA + mB + iA * this.m_rA.x * this.m_rA.x + iB * this.m_rB.x * this.m_rB.x;
        this.m_linearMass.Assign(K.GetInverse());
        this.m_angularMass = iA + iB;
        if (this.m_angularMass > 0) {
            this.m_angularMass = 1 / this.m_angularMass
        }
        this.m_linearError.Assign(b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, this.m_rB), cA), this.m_rA), b2Mul_r_v2(qA, this.m_linearOffset)));
        this.m_angularError = aB - aA - this.m_angularOffset;
        if (data.step.warmStarting) {
            this.m_linearImpulse.Multiply(data.step.dtRatio);
            this.m_angularImpulse *= data.step.dtRatio;
            var P = new b2Vec2(this.m_linearImpulse.x, this.m_linearImpulse.y);
            vA.Subtract(b2Vec2.Multiply(mA, P));
            wA -= iA * (b2Cross_v2_v2(this.m_rA, P) + this.m_angularImpulse);
            vB.Add(b2Vec2.Multiply(mB, P));
            wB += iB * (b2Cross_v2_v2(this.m_rB, P) + this.m_angularImpulse)
        } else {
            this.m_linearImpulse.SetZero();
            this.m_angularImpulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var mA = this.m_invMassA,
            mB = this.m_invMassB;
        var iA = this.m_invIA,
            iB = this.m_invIB;
        var h = data.step.dt;
        var inv_h = data.step.inv_dt;
        var Cdot = wB - wA + inv_h * this.m_correctionFactor * this.m_angularError;
        var impulse = -this.m_angularMass * Cdot;
        var oldImpulse = this.m_angularImpulse;
        var maxImpulse = h * this.m_maxTorque;
        this.m_angularImpulse = b2Clamp(this.m_angularImpulse + impulse, -maxImpulse, maxImpulse);
        impulse = this.m_angularImpulse - oldImpulse;
        wA -= iA * impulse;
        wB += iB * impulse;
        var Cdot = b2Vec2.Add(b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB)), vA), b2Cross_f_v2(wA, this.m_rA)), b2Vec2.Multiply(inv_h, b2Vec2.Multiply(this.m_correctionFactor, this.m_linearError)));
        var impulse = b2Mul_m22_v2(this.m_linearMass, Cdot).Negate();
        var oldImpulse = this.m_linearImpulse;
        this.m_linearImpulse.Add(impulse);
        var maxImpulse = h * this.m_maxForce;
        if (this.m_linearImpulse.LengthSquared() > maxImpulse * maxImpulse) {
            this.m_linearImpulse.Normalize();
            this.m_linearImpulse.Multiply(maxImpulse)
        }
        impulse.Assign(b2Vec2.Subtract(this.m_linearImpulse, oldImpulse));
        vA.Subtract(b2Vec2.Multiply(mA, impulse));
        wA -= iA * b2Cross_v2_v2(this.m_rA, impulse);
        vB.Add(b2Vec2.Multiply(mB, impulse));
        wB += iB * b2Cross_v2_v2(this.m_rB, impulse);
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        return true
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.linearOffset = this.m_linearOffset._serialize();
        obj.angularOffset = this.m_angularOffset;
        obj.maxForce = this.m_maxForce;
        obj.maxTorque = this.m_maxTorque;
        obj.correctionFactor = this.m_correctionFactor;
        return obj
    }
};
b2MotorJoint._extend(b2Joint);
var b2_minPulleyLength = 2;

function b2PulleyJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_pulleyJoint;
    this.groundAnchorA = new b2Vec2(-1, 1);
    this.groundAnchorB = new b2Vec2(1, 1);
    this.localAnchorA = new b2Vec2(-1, 0);
    this.localAnchorB = new b2Vec2(1, 0);
    this.lengthA = 0;
    this.lengthB = 0;
    this.ratio = 1;
    this.collideConnected = true;
    Object.seal(this)
}
b2PulleyJointDef.prototype = {
    Initialize: function (bA, bB, groundA, groundB, anchorA, anchorB, r) {
        this.bodyA = bA;
        this.bodyB = bB;
        this.groundAnchorA.Assign(groundA);
        this.groundAnchorB.Assign(groundB);
        this.localAnchorA.Assign(this.bodyA.GetLocalPoint(anchorA));
        this.localAnchorB.Assign(this.bodyB.GetLocalPoint(anchorB));
        var dA = b2Vec2.Subtract(anchorA, groundA);
        this.lengthA = dA.Length();
        var dB = b2Vec2.Subtract(anchorB, groundB);
        this.lengthB = dB.Length();
        this.ratio = r
    },
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.groundAnchorA._deserialize(data.groundAnchorA);
        this.groundAnchorB._deserialize(data.groundAnchorB);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.lengthA = data.lengthA;
        this.lengthB = data.lengthB;
        this.ratio = data.ratio
    }
};
b2PulleyJointDef._extend(b2JointDef);

function b2PulleyJoint(def) {
    this.parent.call(this, def);
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_uA = new b2Vec2();
    this.m_uB = new b2Vec2();
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0;
    this.m_mass = 0;
    this.m_groundAnchorA = def.groundAnchorA.Clone();
    this.m_groundAnchorB = def.groundAnchorB.Clone();
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_lengthA = def.lengthA;
    this.m_lengthB = def.lengthB;
    this.m_ratio = def.ratio;
    this.m_constant = def.lengthA + this.m_ratio * def.lengthB;
    this.m_impulse = 0
}
b2PulleyJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        var P = b2Vec2.Multiply(this.m_impulse, this.m_uB);
        return b2Vec2.Multiply(inv_dt, P)
    },
    GetReactionTorque: function (inv_dt) {
        return 0
    },
    GetGroundAnchorA: function () {
        return this.m_groundAnchorA
    },
    GetGroundAnchorB: function () {
        return this.m_groundAnchorB
    },
    GetLengthA: function () {
        return this.m_lengthA
    },
    GetLengthB: function () {
        return this.m_lengthB
    },
    GetRatio: function () {
        return this.m_ratio
    },
    GetCurrentLengthA: function () {
        var p = this.m_bodyA.GetWorldPoint(this.m_localAnchorA);
        var s = this.m_groundAnchorA;
        var d = b2Vec2.Subtract(p, s);
        return d.Length()
    },
    GetCurrentLengthB: function () {
        var p = this.m_bodyB.GetWorldPoint(this.m_localAnchorB);
        var s = this.m_groundAnchorB;
        var d = b2Vec2.Subtract(p, s);
        return d.Length()
    },
    ShiftOrigin: function (newOrigin) {
        this.m_groundAnchorA.Subtract(newOrigin);
        this.m_groundAnchorB.Subtract(newOrigin)
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA.Assign(b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA)));
        this.m_rB.Assign(b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB)));
        this.m_uA.Assign(b2Vec2.Add(cA, b2Vec2.Subtract(this.m_rA, this.m_groundAnchorA)));
        this.m_uB.Assign(b2Vec2.Add(cB, b2Vec2.Subtract(this.m_rB, this.m_groundAnchorB)));
        var lengthA = this.m_uA.Length();
        var lengthB = this.m_uB.Length();
        if (lengthA > 10 * b2_linearSlop) {
            this.m_uA.Multiply(1 / lengthA)
        } else {
            this.m_uA.SetZero()
        }
        if (lengthB > 10 * b2_linearSlop) {
            this.m_uB.Multiply(1 / lengthB)
        } else {
            this.m_uB.SetZero()
        }
        var ruA = b2Cross_v2_v2(this.m_rA, this.m_uA);
        var ruB = b2Cross_v2_v2(this.m_rB, this.m_uB);
        var mA = this.m_invMassA + this.m_invIA * ruA * ruA;
        var mB = this.m_invMassB + this.m_invIB * ruB * ruB;
        this.m_mass = mA + this.m_ratio * this.m_ratio * mB;
        if (this.m_mass > 0) {
            this.m_mass = 1 / this.m_mass
        }
        if (data.step.warmStarting) {
            this.m_impulse *= data.step.dtRatio;
            var PA = b2Vec2.Multiply(-(this.m_impulse), this.m_uA);
            var PB = b2Vec2.Multiply((-this.m_ratio * this.m_impulse), this.m_uB);
            vA.Add(b2Vec2.Multiply(this.m_invMassA, PA));
            wA += this.m_invIA * b2Cross_v2_v2(this.m_rA, PA);
            vB.Add(b2Vec2.Multiply(this.m_invMassB, PB));
            wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, PB)
        } else {
            this.m_impulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var vpA = b2Vec2.Add(vA, b2Cross_f_v2(wA, this.m_rA));
        var vpB = b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB));
        var Cdot = -b2Dot_v2_v2(this.m_uA, vpA) - this.m_ratio * b2Dot_v2_v2(this.m_uB, vpB);
        var impulse = -this.m_mass * Cdot;
        this.m_impulse += impulse;
        var PA = b2Vec2.Multiply(-impulse, this.m_uA);
        var PB = b2Vec2.Multiply(-this.m_ratio, b2Vec2.Multiply(impulse, this.m_uB));
        vA.Add(b2Vec2.Multiply(this.m_invMassA, PA));
        wA += this.m_invIA * b2Cross_v2_v2(this.m_rA, PA);
        vB.Add(b2Vec2.Multiply(this.m_invMassB, PB));
        wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, PB);
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var uA = b2Vec2.Add(cA, b2Vec2.Subtract(rA, this.m_groundAnchorA));
        var uB = b2Vec2.Add(cB, b2Vec2.Subtract(rB, this.m_groundAnchorB));
        var lengthA = uA.Length();
        var lengthB = uB.Length();
        if (lengthA > 10 * b2_linearSlop) {
            uA.Multiply(1 / lengthA)
        } else {
            uA.SetZero()
        }
        if (lengthB > 10 * b2_linearSlop) {
            uB.Multiply(1 / lengthB)
        } else {
            uB.SetZero()
        }
        var ruA = b2Cross_v2_v2(rA, uA);
        var ruB = b2Cross_v2_v2(rB, uB);
        var mA = this.m_invMassA + this.m_invIA * ruA * ruA;
        var mB = this.m_invMassB + this.m_invIB * ruB * ruB;
        var mass = mA + this.m_ratio * this.m_ratio * mB;
        if (mass > 0) {
            mass = 1 / mass
        }
        var C = this.m_constant - lengthA - this.m_ratio * lengthB;
        var linearError = b2Abs(C);
        var impulse = -mass * C;
        var PA = b2Vec2.Multiply(-impulse, uA);
        var PB = b2Vec2.Multiply(-this.m_ratio, b2Vec2.Multiply(impulse, uB));
        cA.Add(b2Vec2.Multiply(this.m_invMassA, PA));
        aA += this.m_invIA * b2Cross_v2_v2(rA, PA);
        cB.Add(b2Vec2.Multiply(this.m_invMassB, PB));
        aB += this.m_invIB * b2Cross_v2_v2(rB, PB);
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return linearError < b2_linearSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.groundAnchorA = this.m_groundAnchorA._serialize();
        obj.groundAnchorB = this.m_groundAnchorB._serialize();
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.lengthA = this.m_lengthA;
        obj.lengthB = this.m_lengthB;
        obj.ratio = this.m_ratio;
        return obj
    }
};
b2PulleyJoint._extend(b2Joint);

function b2RopeJointDef() {
    this.parent.call(this);
    this.type = b2Joint.e_ropeJoint;
    this.localAnchorA = new b2Vec2(-1, 0);
    this.localAnchorB = new b2Vec2(1, 0);
    this.maxLength = 0;
    Object.seal(this)
}
b2RopeJointDef.prototype = {
    _deserialize: function (data, bodies, joints) {
        this.parent.prototype._deserialize.call(this, data, bodies, joints);
        this.localAnchorA._deserialize(data.localAnchorA);
        this.localAnchorB._deserialize(data.localAnchorB);
        this.maxLength = data.maxLength
    }
};
b2RopeJointDef._extend(b2JointDef);

function b2RopeJoint(def) {
    this.parent.call(this, def);
    this.m_localAnchorA = def.localAnchorA.Clone();
    this.m_localAnchorB = def.localAnchorB.Clone();
    this.m_maxLength = def.maxLength;
    this.m_mass = 0;
    this.m_impulse = 0;
    this.m_state = b2Joint.e_inactiveLimit;
    this.m_length = 0;
    this.m_indexA = 0;
    this.m_indexB = 0;
    this.m_u = new b2Vec2();
    this.m_rA = new b2Vec2();
    this.m_rB = new b2Vec2();
    this.m_localCenterA = new b2Vec2();
    this.m_localCenterB = new b2Vec2();
    this.m_invMassA = 0;
    this.m_invMassB = 0;
    this.m_invIA = 0;
    this.m_invIB = 0
}
b2RopeJoint.prototype = {
    GetAnchorA: function () {
        return this.m_bodyA.GetWorldPoint(this.m_localAnchorA)
    },
    GetAnchorB: function () {
        return this.m_bodyB.GetWorldPoint(this.m_localAnchorB)
    },
    GetReactionForce: function (inv_dt) {
        var F = b2Vec2.Multiply((inv_dt * this.m_impulse), this.m_u);
        return F
    },
    GetReactionTorque: function (inv_dt) {
        return 0
    },
    GetLocalAnchorA: function () {
        return this.m_localAnchorA
    },
    GetLocalAnchorB: function () {
        return this.m_localAnchorB
    },
    SetMaxLength: function (length) {
        this.m_maxLength = length
    },
    GetMaxLength: function () {
        return this.m_maxLength
    },
    GetLimitState: function () {
        return this.m_state
    },
    InitVelocityConstraints: function (data) {
        this.m_indexA = this.m_bodyA.m_islandIndex;
        this.m_indexB = this.m_bodyB.m_islandIndex;
        this.m_localCenterA.Assign(this.m_bodyA.m_sweep.localCenter);
        this.m_localCenterB.Assign(this.m_bodyB.m_sweep.localCenter);
        this.m_invMassA = this.m_bodyA.m_invMass;
        this.m_invMassB = this.m_bodyB.m_invMass;
        this.m_invIA = this.m_bodyA.m_invI;
        this.m_invIB = this.m_bodyB.m_invI;
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        this.m_rA.Assign(b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA)));
        this.m_rB.Assign(b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB)));
        this.m_u.Assign(b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, this.m_rB), cA), this.m_rA));
        this.m_length = this.m_u.Length();
        var C = this.m_length - this.m_maxLength;
        if (C > 0) {
            this.m_state = b2Joint.e_atUpperLimit
        } else {
            this.m_state = b2Joint.e_inactiveLimit
        }
        if (this.m_length > b2_linearSlop) {
            this.m_u.Multiply(1 / this.m_length)
        } else {
            this.m_u.SetZero();
            this.m_mass = 0;
            this.m_impulse = 0;
            return
        }
        var crA = b2Cross_v2_v2(this.m_rA, this.m_u);
        var crB = b2Cross_v2_v2(this.m_rB, this.m_u);
        var invMass = this.m_invMassA + this.m_invIA * crA * crA + this.m_invMassB + this.m_invIB * crB * crB;
        this.m_mass = invMass != 0 ? 1 / invMass : 0;
        if (data.step.warmStarting) {
            this.m_impulse *= data.step.dtRatio;
            var P = b2Vec2.Multiply(this.m_impulse, this.m_u);
            vA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
            wA -= this.m_invIA * b2Cross_v2_v2(this.m_rA, P);
            vB.Add(b2Vec2.Multiply(this.m_invMassB, P));
            wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, P)
        } else {
            this.m_impulse = 0
        }
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolveVelocityConstraints: function (data) {
        var vA = data.velocities[this.m_indexA].v.Clone();
        var wA = data.velocities[this.m_indexA].w;
        var vB = data.velocities[this.m_indexB].v.Clone();
        var wB = data.velocities[this.m_indexB].w;
        var vpA = b2Vec2.Add(vA, b2Cross_f_v2(wA, this.m_rA));
        var vpB = b2Vec2.Add(vB, b2Cross_f_v2(wB, this.m_rB));
        var C = this.m_length - this.m_maxLength;
        var Cdot = b2Dot_v2_v2(this.m_u, b2Vec2.Subtract(vpB, vpA));
        if (C < 0) {
            Cdot += data.step.inv_dt * C
        }
        var impulse = -this.m_mass * Cdot;
        var oldImpulse = this.m_impulse;
        this.m_impulse = b2Min(0, this.m_impulse + impulse);
        impulse = this.m_impulse - oldImpulse;
        var P = b2Vec2.Multiply(impulse, this.m_u);
        vA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
        wA -= this.m_invIA * b2Cross_v2_v2(this.m_rA, P);
        vB.Add(b2Vec2.Multiply(this.m_invMassB, P));
        wB += this.m_invIB * b2Cross_v2_v2(this.m_rB, P);
        data.velocities[this.m_indexA].v.Assign(vA);
        data.velocities[this.m_indexA].w = wA;
        data.velocities[this.m_indexB].v.Assign(vB);
        data.velocities[this.m_indexB].w = wB
    },
    SolvePositionConstraints: function (data) {
        var cA = data.positions[this.m_indexA].c.Clone();
        var aA = data.positions[this.m_indexA].a;
        var cB = data.positions[this.m_indexB].c.Clone();
        var aB = data.positions[this.m_indexB].a;
        var qA = new b2Rot(aA),
            qB = new b2Rot(aB);
        var rA = b2Mul_r_v2(qA, b2Vec2.Subtract(this.m_localAnchorA, this.m_localCenterA));
        var rB = b2Mul_r_v2(qB, b2Vec2.Subtract(this.m_localAnchorB, this.m_localCenterB));
        var u = b2Vec2.Subtract(b2Vec2.Subtract(b2Vec2.Add(cB, rB), cA), rA);
        var length = u.Normalize();
        var C = length - this.m_maxLength;
        C = b2Clamp(C, 0, b2_maxLinearCorrection);
        var impulse = -this.m_mass * C;
        var P = b2Vec2.Multiply(impulse, u);
        cA.Subtract(b2Vec2.Multiply(this.m_invMassA, P));
        aA -= this.m_invIA * b2Cross_v2_v2(rA, P);
        cB.Add(b2Vec2.Multiply(this.m_invMassB, P));
        aB += this.m_invIB * b2Cross_v2_v2(rB, P);
        data.positions[this.m_indexA].c.Assign(cA);
        data.positions[this.m_indexA].a = aA;
        data.positions[this.m_indexB].c.Assign(cB);
        data.positions[this.m_indexB].a = aB;
        return length - this.m_maxLength < b2_linearSlop
    },
    _serialize: function (out) {
        var obj = out || {};
        this.parent.prototype._serialize.call(this, obj);
        obj.localAnchorA = this.m_localAnchorA._serialize();
        obj.localAnchorB = this.m_localAnchorB._serialize();
        obj.maxLength = this.m_maxLength;
        return obj
    }
};
b2RopeJoint._extend(b2Joint);
var expf = Math.exp;

function b2RopeDef() {
    this.vertices = null;
    this.count = 0;
    this.masses = null;
    this.gravity = new b2Vec2();
    this.damping = 0.1;
    this.k2 = 0.9;
    this.k3 = 0.1
}

function b2Rope() {
    this.m_count = 0;
    this.m_ps = null;
    this.m_p0s = null;
    this.m_vs = null;
    this.m_ims = null;
    this.m_Ls = null;
    this.m_as = null;
    this.m_damping = 0;
    this.m_gravity = new b2Vec2();
    this.m_k2 = 1;
    this.m_k3 = 0.1
}
b2Rope.prototype = {
    Initialize: function (def) {
        this.m_count = def.count;
        this.m_ps = new Array(this.m_count);
        this.m_p0s = new Array(this.m_count);
        this.m_vs = new Array(this.m_count);
        this.m_ims = new Array(this.m_count);
        for (var i = 0; i < this.m_count; ++i) {
            this.m_ps[i] = def.vertices[i].Clone();
            this.m_p0s[i] = def.vertices[i].Clone();
            this.m_vs[i] = new b2Vec2();
            var m = def.masses[i];
            if (m > 0) {
                this.m_ims[i] = 1 / m
            } else {
                this.m_ims[i] = 0
            }
        }
        var count2 = this.m_count - 1;
        var count3 = this.m_count - 2;
        this.m_Ls = new Array(count2);
        this.m_as = new Array(count3);
        for (var i = 0; i < count2; ++i) {
            var p1 = this.m_ps[i];
            var p2 = this.m_ps[i + 1];
            this.m_Ls[i] = b2Distance(p1, p2)
        }
        for (var i = 0; i < count3; ++i) {
            var p1 = this.m_ps[i];
            var p2 = this.m_ps[i + 1];
            var p3 = this.m_ps[i + 2];
            var d1 = b2Vec2.Subtract(p2, p1);
            var d2 = b2Vec2.Subtract(p3, p2);
            var a = b2Cross_v2_v2(d1, d2);
            var b = b2Dot_v2_v2(d1, d2);
            this.m_as[i] = b2Atan2(a, b)
        }
        this.m_gravity = def.gravity.Clone();
        this.m_damping = def.damping;
        this.m_k2 = def.k2;
        this.m_k3 = def.k3
    },
    Step: function (h, iterations) {
        if (h == 0) {
            return
        }
        var d = expf(-h * this.m_damping);
        for (var i = 0; i < this.m_count; ++i) {
            this.m_p0s[i].Assign(this.m_ps[i]);
            if (this.m_ims[i] > 0) {
                this.m_vs[i].Add(b2Vec2.Multiply(h, this.m_gravity))
            }
            this.m_vs[i].Multiply(d);
            this.m_ps[i].Add(b2Vec2.Multiply(h, this.m_vs[i]))
        }
        for (var i = 0; i < iterations; ++i) {
            this.SolveC2();
            this.SolveC3();
            this.SolveC2()
        }
        var inv_h = 1 / h;
        for (var i = 0; i < this.m_count; ++i) {
            this.m_vs[i] = b2Vec2.Multiply(inv_h, b2Vec2.Subtract(this.m_ps[i], this.m_p0s[i]))
        }
    },
    GetVertexCount: function () {
        return this.m_count
    },
    GetVertices: function () {
        return this.m_ps
    },
    Draw: function (draw) {
        var c = new b2Color(0.4, 0.5, 0.7);
        for (var i = 0; i < this.m_count - 1; ++i) {
            draw.DrawSegment(this.m_ps[i], this.m_ps[i + 1], c)
        }
    },
    SetAngle: function (angle) {
        var count3 = this.m_count - 2;
        for (var i = 0; i < count3; ++i) {
            this.m_as[i] = angle
        }
    },
    SolveC2: function () {
        var count2 = this.m_count - 1;
        for (var i = 0; i < count2; ++i) {
            var p1 = this.m_ps[i];
            var p2 = this.m_ps[i + 1];
            var d = b2Vec2.Subtract(p2, p1);
            var L = d.Normalize();
            var im1 = this.m_ims[i];
            var im2 = this.m_ims[i + 1];
            if (im1 + im2 == 0) {
                continue
            }
            var s1 = im1 / (im1 + im2);
            var s2 = im2 / (im1 + im2);
            p1.Subtract(b2Vec2.Multiply(this.m_k2 * s1 * (this.m_Ls[i] - L), d));
            p2.Add(b2Vec2.Multiply(this.m_k2 * s2 * (this.m_Ls[i] - L), d))
        }
    },
    SolveC3: function () {
        var count3 = this.m_count - 2;
        for (var i = 0; i < count3; ++i) {
            var p1 = this.m_ps[i];
            var p2 = this.m_ps[i + 1];
            var p3 = this.m_ps[i + 2];
            var m1 = this.m_ims[i];
            var m2 = this.m_ims[i + 1];
            var m3 = this.m_ims[i + 2];
            var d1 = b2Vec2.Subtract(p2, p1);
            var d2 = b2Vec2.Subtract(p3, p2);
            var L1sqr = d1.LengthSquared();
            var L2sqr = d2.LengthSquared();
            if (L1sqr * L2sqr == 0) {
                continue
            }
            var a = b2Cross_v2_v2(d1, d2);
            var b = b2Dot_v2_v2(d1, d2);
            var angle = b2Atan2(a, b);
            var Jd1 = b2Vec2.Multiply((-1 / L1sqr), d1.Skew());
            var Jd2 = b2Vec2.Multiply((1 / L2sqr), d2.Skew());
            var J1 = b2Vec2.Negate(Jd1);
            var J2 = b2Vec2.Subtract(Jd1, Jd2);
            var J3 = Jd2;
            var mass = m1 * b2Dot_v2_v2(J1, J1) + m2 * b2Dot_v2_v2(J2, J2) + m3 * b2Dot_v2_v2(J3, J3);
            if (mass == 0) {
                continue
            }
            mass = 1 / mass;
            var C = angle - this.m_as[i];
            while (C > b2_pi) {
                angle -= 2 * b2_pi;
                C = angle - this.m_as[i]
            }
            while (C < -b2_pi) {
                angle += 2 * b2_pi;
                C = angle - this.m_as[i]
            }
            var impulse = -this.m_k3 * mass * C;
            p1.Add(b2Vec2.Multiply((m1 * impulse), J1));
            p2.Add(b2Vec2.Multiply((m2 * impulse), J2));
            p3.Add(b2Vec2.Multiply((m3 * impulse), J3))
        }
    }
};
var b2JsonSerializer = {
    serialize: function (world) {
        var shapes = [];
        var i;
        var serialized;
        var b;
        var f;
        var shape;
        for (b = world.GetBodyList(); b; b = b.GetNext()) {
            for (f = b.GetFixtureList(); f; f = f.GetNext()) {
                shape = f.GetShape();
                f.__temp_shape_id = shapes.length;
                shapes.push(shape._serialize())
            }
        }
        var fixtures = [];
        for (b = world.GetBodyList(); b; b = b.GetNext()) {
            b.__temp_fixture_ids = [];
            for (f = b.GetFixtureList(); f; f = f.GetNext()) {
                serialized = f._serialize();
                serialized.shape = f.__temp_shape_id;
                delete f.__temp_shape_id;
                b.__temp_fixture_ids.push(fixtures.length);
                fixtures.push(serialized)
            }
        }
        var bodies = [];
        for (b = world.GetBodyList(); b; b = b.GetNext()) {
            serialized = b._serialize();
            serialized.fixtures = [];
            for (i = 0; i < b.__temp_fixture_ids.length; ++i) {
                serialized.fixtures.push(b.__temp_fixture_ids[i])
            }
            delete b.__temp_fixture_ids;
            b.__temp_body_id = bodies.length;
            bodies.push(serialized)
        }
        var joints = [];
        var j;
        for (j = world.GetJointList(), i = 0; j; j = j.GetNext(), ++i) {
            j.__temp_joint_id = i
        }
        for (j = world.GetJointList(); j; j = j.GetNext()) {
            if (j.GetType() === b2Joint.e_mouseJoint) {
                continue
            }
            serialized = j._serialize();
            serialized.bodyA = j.GetBodyA().__temp_body_id;
            serialized.bodyB = j.GetBodyB().__temp_body_id;
            joints.push(serialized)
        }
        for (j = world.GetJointList(); j; j = j.GetNext()) {
            delete j.__temp_joint_id
        }
        for (b = world.GetBodyList(); b; b = b.GetNext()) {
            delete b.__temp_body_id
        }
        return {
            shapes: shapes,
            fixtures: fixtures,
            bodies: bodies,
            joints: joints
        }
    },
    deserialize: function (serialized, world, clear) {
        var deserialized = JSON.parse(serialized);
        if (clear) {
            for (var b = world.GetBodyList(); b;) {
                var next = b.GetNext();
                world.DestroyBody(b);
                b = next
            }
            for (var j = world.GetJointList(); j;) {
                var next = j.GetNext();
                world.DestroyJoint(j);
                j = next
            }
        }
        var shapes = [];
        for (var i = 0; i < deserialized.shapes.length; ++i) {
            var shapeData = deserialized.shapes[i];
            var shape;
            switch (shapeData.m_type) {
                case b2Shape.e_circle:
                    shape = new b2CircleShape();
                    break;
                case b2Shape.e_edge:
                    shape = new b2EdgeShape();
                    break;
                case b2Shape.e_chain:
                    shape = new b2ChainShape();
                    break;
                case b2Shape.e_polygon:
                    shape = new b2PolygonShape();
                    break
            }
            shape._deserialize(shapeData);
            shapes.push(shape)
        }
        var fixtures = [];
        for (i = 0; i < deserialized.fixtures.length; ++i) {
            var fixtureData = deserialized.fixtures[i];
            var fixture = new b2FixtureDef();
            fixture._deserialize(fixtureData);
            fixture.shape = shapes[fixtureData.shape];
            fixtures.push(fixture)
        }
        var bodies = [];
        for (i = 0; i < deserialized.bodies.length; ++i) {
            var bodyData = deserialized.bodies[i];
            var def = new b2BodyDef();
            def._deserialize(bodyData);
            var body = world.CreateBody(def);
            for (var x = 0; x < bodyData.fixtures.length; ++x) {
                body.CreateFixture(fixtures[bodyData.fixtures[x]])
            }
            bodies.push(body)
        }
        var joints = [];
        var gears = [];
        for (i = 0; i < deserialized.joints.length; ++i) {
            var jointData = deserialized.joints[i];
            var jointDef;
            switch (jointData.type) {
                case b2Joint.e_revoluteJoint:
                    jointDef = new b2RevoluteJointDef();
                    break;
                case b2Joint.e_prismaticJoint:
                    jointDef = new b2PrismaticJointDef();
                    break;
                case b2Joint.e_distanceJoint:
                    jointDef = new b2DistanceJointDef();
                    break;
                case b2Joint.e_pulleyJoint:
                    jointDef = new b2PulleyJointDef();
                    break;
                case b2Joint.e_gearJoint:
                    jointDef = new b2GearJointDef();
                    break;
                case b2Joint.e_wheelJoint:
                    jointDef = new b2WheelJointDef();
                    break;
                case b2Joint.e_weldJoint:
                    jointDef = new b2WeldJointDef();
                    break;
                case b2Joint.e_frictionJoint:
                    jointDef = new b2FrictionJointDef();
                    break;
                case b2Joint.e_ropeJoint:
                    jointDef = new b2RopeJointDef();
                    break;
                case b2Joint.e_motorJoint:
                    jointDef = new b2MotorJointDef();
                    break;
                default:
                    throw new Error("unknown joint")
            }
            jointDef._deserialize(jointData, bodies);
            if (jointData.type === b2Joint.e_gearJoint) {
                gears.push([jointDef, joints.length]);
                joints.push(null)
            } else {
                var joint = world.CreateJoint(jointDef);
                joints.push(joint)
            }
        }
        for (i = 0; i < gears.length; ++i) {
            gears[i][0].joint1 = joints[gears[i][0].joint1];
            gears[i][0].joint2 = joints[gears[i][0].joint2];
            joint = world.CreateJoint(gears[i][0]);
            joints[gears[i][1]] = joint
        }
    }
};
var b2RUBELoader = (function () {
    function parseVector(obj) {
        return new b2Vec2(obj ? (obj.x || 0) : 0, obj ? (obj.y || 0) : 0)
    }

    function parseVectorArray(obj) {
        var vals = new Array(obj.x.length);
        for (var i = 0; i < vals.length; ++i) {
            vals[i] = new b2Vec2(obj.x[i], obj.y[i])
        }
        return vals
    }

    function parseProperty(obj, instance) {
        var name = obj.name;
        var val;
        if (typeof (obj["int"]) !== "undefined") {
            val = obj["int"]
        } else {
            if (typeof (obj["float"]) !== "undefined") {
                val = obj["float"]
            } else {
                if (typeof (obj.string) !== "undefined") {
                    val = obj.string
                } else {
                    if (typeof (obj.bool) !== "undefined") {
                        val = obj.bool
                    } else {
                        if (typeof (obj.vec2) !== "undefined") {
                            val = parseVector(obj.vec2)
                        } else {
                            throw new Error("unknown property type")
                        }
                    }
                }
            }
        }
        if (instance.hasOwnProperty(name)) {
            throw new Error("custom property possibly overwriting an existing one")
        }
        instance[name] = val
    }

    function parseFixture(obj, body) {
        var def = new b2FixtureDef();
        def.density = obj.density || 0;
        def.filter.categoryBits = typeof (obj["filter-categoryBits"]) === "undefined" ? 1 : obj["filter-categoryBits"];
        def.filter.maskBits = typeof (obj["filter-maskBits"]) === "undefined" ? 65535 : obj["filter-maskBits"];
        def.filter.groupIndex = typeof (obj["filter-groupIndex"]) === "undefined" ? 0 : obj["filter-groupIndex"];
        def.friction = obj.friction || 0;
        def.restitution = obj.restitution || 0;
        def.isSensor = obj.sensor || 0;
        var shape;
        if (typeof (obj.circle) !== "undefined") {
            shape = new b2CircleShape();
            shape.m_p = parseVector(obj.circle.center);
            shape.m_radius = obj.circle.radius || 0
        } else {
            if (typeof (obj.polygon) !== "undefined") {
                var vertices = parseVectorArray(obj.polygon.vertices);
                shape = new b2PolygonShape();
                shape.Set(vertices, vertices.length)
            } else {
                if (typeof (obj.chain) !== "undefined") {
                    var vertices = parseVectorArray(obj.chain.vertices);
                    shape = new b2ChainShape();
                    shape.m_count = vertices.length;
                    shape.m_vertices = vertices;
                    if (shape.m_hasNextVertex = obj.chain.hasNextVertex) {
                        shape.m_nextVertex = parseVector(obj.chain.nextVertex)
                    }
                    if (shape.m_hasPrevVertex = obj.chain.hasPrevVertex) {
                        shape.m_prevVertex = parseVector(obj.chain.prevVertex)
                    }
                } else {
                    throw new Error("unknown shape type")
                }
            }
        }
        def.shape = shape;
        var fixture = body.CreateFixture(def);
        fixture.name = obj.name;
        if (obj.customProperties) {
            for (var i = 0; i < obj.customProperties.length; ++i) {
                parseProperty(obj, fixture)
            }
        }
    }

    function parseBody(obj, world) {
        var def = new b2BodyDef();
        def.type = obj.type || b2Body.b2_staticBody;
        def.angle = obj.angle || 0;
        def.angularDamping = obj.angularDamping || 0;
        def.angularVelocity = obj.angularVelocity || 0;
        def.awake = obj.awake || false;
        def.bullet = obj.bullet || false;
        def.fixedRotation = obj.fixedRotation || false;
        def.linearDamping = obj.linearDamping || false;
        def.linearVelocity = parseVector(obj.linearVelocity);
        def.gravityScale = typeof (obj.gravityScale) !== "undefined" ? obj.gravityScale : 1;
        var md = new b2MassData();
        md.mass = obj["massData-mass"] || 0;
        md.center = parseVector(obj["massData-center"]);
        md.I = obj["massData-I"] || 0;
        def.position = parseVector(obj.position);
        var body = world.CreateBody(def);
        body.name = obj.name;
        body.SetMassData(md);
        if (obj.fixture) {
            for (var i = 0; i < obj.fixture.length; ++i) {
                parseFixture(obj.fixture[i], body)
            }
        }
        if (obj.customProperties) {
            for (i = 0; i < obj.customProperties.length; ++i) {
                parseProperty(obj, body)
            }
        }
        return body
    }
    var jointsList = {
        revolute: b2RevoluteJointDef,
        distance: b2DistanceJointDef,
        prismatic: b2PrismaticJointDef,
        wheel: b2WheelJointDef,
        rope: b2RopeJointDef,
        motor: b2MotorJointDef,
        weld: b2WeldJointDef,
        friction: b2FrictionJointDef
    };

    function parseJoint(obj, world, bodies) {
        if (!jointsList[obj.type]) {
            throw new Error("unknown joint type")
        }
        var jd = new jointsList[obj.type]();
        switch (jd.type) {
            case b2Joint.e_revoluteJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.enableLimit = obj.enableLimit || false;
                jd.enableMotor = obj.enableMotor || false;
                jd.lowerAngle = obj.lowerLimit || 0;
                jd.maxMotorTorque = obj.maxMotorTorque || 0;
                jd.motorSpeed = obj.motorSpeed || 0;
                jd.referenceAngle = obj.refAngle || 0;
                jd.upperAngle = obj.upperLimit || 0;
                break;
            case b2Joint.e_distanceJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.dampingRatio = obj.dampingRatio || 0;
                jd.frequencyHz = obj.frequency || 0;
                jd.length = obj.length || 0;
                break;
            case b2Joint.e_prismaticJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.enableLimit = obj.enableLimit || false;
                jd.enableMotor = obj.enableMotor || false;
                jd.localAxisA = parseVector(obj.localAxisA);
                jd.lowerTranslation = obj.lowerLimit || 0;
                jd.maxMotorForce = obj.maxMotorForce || 0;
                jd.motorSpeed = obj.motorSpeed || 0;
                jd.referenceAngle = obj.refAngle || 0;
                jd.upperTranslation = obj.upperLimit || 0;
                break;
            case b2Joint.e_wheelJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.enableMotor = obj.enableMotor || false;
                jd.localAxisA = parseVector(obj.localAxisA);
                jd.maxMotorTorque = obj.maxMotorTorque || 0;
                jd.motorSpeed = obj.motorSpeed || 0;
                jd.dampingRatio = obj.springDampingRatio || 0;
                jd.frequencyHz = obj.springFrequency || 0;
                break;
            case b2Joint.e_ropeJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.maxLength = obj.maxLength || 0;
                break;
            case b2Joint.e_motorJoint:
                jd.linearOffset = parseVector(obj.anchorA);
                jd.angularOffset = obj.refAngle || 0;
                jd.maxForce = obj.maxForce || 0;
                jd.maxTorque = obj.maxTorque || 0;
                jd.correctionFactor = obj.correctionFactor || 0;
                break;
            case b2Joint.e_weldJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.referenceAngle = obj.refAngle || 0;
                jd.dampingRatio = obj.dampingRatio || 0;
                jd.frequencyHz = obj.frequencyHz || 0;
                break;
            case b2Joint.e_frictionJoint:
                jd.localAnchorA = parseVector(obj.anchorA);
                jd.localAnchorB = parseVector(obj.anchorB);
                jd.maxForce = obj.maxForce || 0;
                jd.maxTorque = obj.maxTorque || 0;
                break;
            default:
                throw new Error("wat?")
        }
        jd.bodyA = bodies[obj.bodyA || 0];
        jd.bodyB = bodies[obj.bodyB || 0];
        jd.collideConnected = obj.collideConnected || false;
        var joint = world.CreateJoint(jd);
        joint.name = obj.name;
        if (obj.customProperties) {
            for (var i = 0; i < obj.customProperties.length; ++i) {
                parseProperty(obj, joint)
            }
        }
        return joint
    }

    function b2RubeParameters() {
        this.world = null;
        this.positionIterations = 0;
        this.velocityIterations = 0;
        this.stepsPerSecond = 0;
        this.fixtures = {};
        this.bodies = {};
        this.joints = {};
        Object.seal(this)
    }

    function parseWorld(obj, world) {
        var params = new b2RubeParameters();
        params.world = world = world || new b2World(new b2Vec2(0, 0));
        params.positionIterations = obj.positionIterations || 0;
        params.velocityIterations = obj.velocityIterations || 0;
        params.stepsPerSecond = obj.stepsPerSecond || 0;
        if (obj.gravity) {
            world.SetGravity(parseVector(obj.gravity))
        }
        world.SetAllowSleeping(obj.allowSleep || false);
        world.SetAutoClearForces(obj.autoClearForces || false);
        world.SetWarmStarting(obj.warmStarting || false);
        world.SetContinuousPhysics(obj.continuousPhysics || false);
        world.SetSubStepping(obj.subStepping || false);
        var bodies = [];
        var bl = obj.body;
        if (bl) {
            for (var i = 0; i < bl.length; ++i) {
                var body = parseBody(bl[i], world);
                bodies.push(body);
                for (var f = body.GetFixtureList(); f; f = f.GetNext()) {
                    if (!params.fixtures[f.name]) {
                        params.fixtures[f.name] = []
                    }
                    params.fixtures[f.name].push(f)
                }
                if (!params.bodies[body.name]) {
                    params.bodies[body.name] = []
                }
                params.bodies[body.name].push(body)
            }
        }
        var joints = [];
        var jl = obj.joint;
        if (jl) {
            for (i = 0; i < jl.length; ++i) {
                var joint = parseJoint(jl[i], world, bodies);
                joints.push(joint);
                if (!params.joints[joint.name]) {
                    params.joints[joint.name] = []
                }
                params.joints[joint.name].push(joint)
            }
        }
        return params
    }
    return {
        parseWorld: parseWorld
    }
})();
var mappings = [{
    trimmed: "version",
    name: "b2_version",
    def: b2_version
}, {
    trimmed: "Vec2",
    name: "b2Vec2",
    def: b2Vec2
}, {
    trimmed: "Vec3",
    name: "b2Vec3",
    def: b2Vec3
}, {
    trimmed: "Mat22",
    name: "b2Mat22",
    def: b2Mat22
}, {
    trimmed: "Mat33",
    name: "b2Mat33",
    def: b2Mat33
}, {
    trimmed: "Rot",
    name: "b2Rot",
    def: b2Rot
}, {
    trimmed: "Transform",
    name: "b2Transform",
    def: b2Transform
}, {
    trimmed: "Sweep",
    name: "b2Sweep",
    def: b2Sweep
}, {
    trimmed: "Dot_v2_v2",
    name: "b2Dot_v2_v2",
    def: b2Dot_v2_v2
}, {
    trimmed: "Cross_v2_v2",
    name: "b2Cross_v2_v2",
    def: b2Cross_v2_v2
}, {
    trimmed: "Cross_v2_f",
    name: "b2Cross_v2_f",
    def: b2Cross_v2_f
}, {
    trimmed: "Cross_f_v2",
    name: "b2Cross_f_v2",
    def: b2Cross_f_v2
}, {
    trimmed: "Mul_m22_v2",
    name: "b2Mul_m22_v2",
    def: b2Mul_m22_v2
}, {
    trimmed: "MulT_m22_v2",
    name: "b2MulT_m22_v2",
    def: b2MulT_m22_v2
}, {
    trimmed: "Distance",
    name: "b2Distance",
    def: b2Distance
}, {
    trimmed: "DistanceSquared",
    name: "b2DistanceSquared",
    def: b2DistanceSquared
}, {
    trimmed: "Dot_v3_v3",
    name: "b2Dot_v3_v3",
    def: b2Dot_v3_v3
}, {
    trimmed: "Cross_v3_v3",
    name: "b2Cross_v3_v3",
    def: b2Cross_v3_v3
}, {
    trimmed: "Mul_m22_m22",
    name: "b2Mul_m22_m22",
    def: b2Mul_m22_m22
}, {
    trimmed: "MulT_m22_m22",
    name: "b2MulT_m22_m22",
    def: b2MulT_m22_m22
}, {
    trimmed: "Mul_m33_v3",
    name: "b2Mul_m33_v3",
    def: b2Mul_m33_v3
}, {
    trimmed: "Mul22_m33_v2",
    name: "b2Mul22_m33_v2",
    def: b2Mul22_m33_v2
}, {
    trimmed: "Mul_r_r",
    name: "b2Mul_r_r",
    def: b2Mul_r_r
}, {
    trimmed: "MulT_r_r",
    name: "b2MulT_r_r",
    def: b2MulT_r_r
}, {
    trimmed: "Mul_r_v2",
    name: "b2Mul_r_v2",
    def: b2Mul_r_v2
}, {
    trimmed: "MulT_r_v2",
    name: "b2MulT_r_v2",
    def: b2MulT_r_v2
}, {
    trimmed: "Mul_t_v2",
    name: "b2Mul_t_v2",
    def: b2Mul_t_v2
}, {
    trimmed: "Min_v2",
    name: "b2Min_v2",
    def: b2Min_v2
}, {
    trimmed: "Max_v2",
    name: "b2Max_v2",
    def: b2Max_v2
}, {
    trimmed: "Clamp",
    name: "b2Clamp",
    def: b2Clamp
}, {
    trimmed: "MulT_t_v2",
    name: "b2MulT_t_v2",
    def: b2MulT_t_v2
}, {
    trimmed: "Mul_t_t",
    name: "b2Mul_t_t",
    def: b2Mul_t_t
}, {
    trimmed: "MulT_t_t",
    name: "b2MulT_t_t",
    def: b2MulT_t_t
}, {
    trimmed: "Clamp_v2",
    name: "b2Clamp_v2",
    def: b2Clamp_v2
}, {
    trimmed: "NextPowerOfTwo",
    name: "b2NextPowerOfTwo",
    def: b2NextPowerOfTwo
}, {
    trimmed: "Abs_v2",
    name: "b2Abs_v2",
    def: b2Abs_v2
}, {
    trimmed: "Abs_m22",
    name: "b2Abs_m22",
    def: b2Abs_m22
}, {
    trimmed: "IsPowerOfTwo",
    name: "b2IsPowerOfTwo",
    def: b2IsPowerOfTwo
}, {
    trimmed: "RandomFloat",
    name: "b2RandomFloat",
    def: b2RandomFloat
}, {
    trimmed: "Timer",
    name: "b2Timer",
    def: b2Timer
}, {
    trimmed: "Color",
    name: "b2Color",
    def: b2Color
}, {
    trimmed: "Draw",
    name: "b2Draw",
    def: b2Draw
}, {
    trimmed: "ContactID",
    name: "b2ContactID",
    def: b2ContactID
}, {
    trimmed: "ManifoldPoint",
    name: "b2ManifoldPoint",
    def: b2ManifoldPoint
}, {
    trimmed: "Manifold",
    name: "b2Manifold",
    def: b2Manifold
}, {
    trimmed: "WorldManifold",
    name: "b2WorldManifold",
    def: b2WorldManifold
}, {
    trimmed: "GetPointStates",
    name: "b2GetPointStates",
    def: b2GetPointStates
}, {
    trimmed: "ClipVertex",
    name: "b2ClipVertex",
    def: b2ClipVertex
}, {
    trimmed: "RayCastInput",
    name: "b2RayCastInput",
    def: b2RayCastInput
}, {
    trimmed: "RayCastOutput",
    name: "b2RayCastOutput",
    def: b2RayCastOutput
}, {
    trimmed: "AABB",
    name: "b2AABB",
    def: b2AABB
}, {
    trimmed: "CollideCircles",
    name: "b2CollideCircles",
    def: b2CollideCircles
}, {
    trimmed: "CollidePolygonAndCircle",
    name: "b2CollidePolygonAndCircle",
    def: b2CollidePolygonAndCircle
}, {
    trimmed: "FindMaxSeparation",
    name: "b2FindMaxSeparation",
    def: b2FindMaxSeparation
}, {
    trimmed: "FindIncidentEdge",
    name: "b2FindIncidentEdge",
    def: b2FindIncidentEdge
}, {
    trimmed: "CollidePolygons",
    name: "b2CollidePolygons",
    def: b2CollidePolygons
}, {
    trimmed: "CollideEdgeAndCircle",
    name: "b2CollideEdgeAndCircle",
    def: b2CollideEdgeAndCircle
}, {
    trimmed: "EPAxis",
    name: "b2EPAxis",
    def: b2EPAxis
}, {
    trimmed: "TempPolygon",
    name: "b2TempPolygon",
    def: b2TempPolygon
}, {
    trimmed: "ReferenceFace",
    name: "b2ReferenceFace",
    def: b2ReferenceFace
}, {
    trimmed: "EPCollider",
    name: "b2EPCollider",
    def: b2EPCollider
}, {
    trimmed: "CollideEdgeAndPolygon",
    name: "b2CollideEdgeAndPolygon",
    def: b2CollideEdgeAndPolygon
}, {
    trimmed: "ClipSegmentToLine",
    name: "b2ClipSegmentToLine",
    def: b2ClipSegmentToLine
}, {
    trimmed: "TestShapeOverlap",
    name: "b2TestShapeOverlap",
    def: b2TestShapeOverlap
}, {
    trimmed: "TestOverlap",
    name: "b2TestOverlap",
    def: b2TestOverlap
}, {
    trimmed: "Shape",
    name: "b2Shape",
    def: b2Shape
}, {
    trimmed: "CircleShape",
    name: "b2CircleShape",
    def: b2CircleShape
}, {
    trimmed: "EdgeShape",
    name: "b2EdgeShape",
    def: b2EdgeShape
}, {
    trimmed: "ChainShape",
    name: "b2ChainShape",
    def: b2ChainShape
}, {
    trimmed: "PolygonShape",
    name: "b2PolygonShape",
    def: b2PolygonShape
}, {
    trimmed: "Pair",
    name: "b2Pair",
    def: b2Pair
}, {
    trimmed: "PairLessThan",
    name: "b2PairLessThan",
    def: b2PairLessThan
}, {
    trimmed: "BroadPhase",
    name: "b2BroadPhase",
    def: b2BroadPhase
}, {
    trimmed: "DistanceProxy",
    name: "b2DistanceProxy",
    def: b2DistanceProxy
}, {
    trimmed: "SimplexCache",
    name: "b2SimplexCache",
    def: b2SimplexCache
}, {
    trimmed: "DistanceInput",
    name: "b2DistanceInput",
    def: b2DistanceInput
}, {
    trimmed: "DistanceOutput",
    name: "b2DistanceOutput",
    def: b2DistanceOutput
}, {
    trimmed: "SimplexVertex",
    name: "b2SimplexVertex",
    def: b2SimplexVertex
}, {
    trimmed: "Simplex",
    name: "b2Simplex",
    def: b2Simplex
}, {
    trimmed: "DistanceFunc",
    name: "b2DistanceFunc",
    def: b2DistanceFunc
}, {
    trimmed: "TreeNode",
    name: "b2TreeNode",
    def: b2TreeNode
}, {
    trimmed: "DynamicTree",
    name: "b2DynamicTree",
    def: b2DynamicTree
}, {
    trimmed: "TOIInput",
    name: "b2TOIInput",
    def: b2TOIInput
}, {
    trimmed: "TOIOutput",
    name: "b2TOIOutput",
    def: b2TOIOutput
}, {
    trimmed: "SeparationFunction",
    name: "b2SeparationFunction",
    def: b2SeparationFunction
}, {
    trimmed: "TimeOfImpact",
    name: "b2TimeOfImpact",
    def: b2TimeOfImpact
}, {
    trimmed: "BodyDef",
    name: "b2BodyDef",
    def: b2BodyDef
}, {
    trimmed: "Body",
    name: "b2Body",
    def: b2Body
}, {
    trimmed: "Filter",
    name: "b2Filter",
    def: b2Filter
}, {
    trimmed: "FixtureDef",
    name: "b2FixtureDef",
    def: b2FixtureDef
}, {
    trimmed: "Fixture",
    name: "b2Fixture",
    def: b2Fixture
}, {
    trimmed: "DestructionListener",
    name: "b2DestructionListener",
    def: b2DestructionListener
}, {
    trimmed: "ContactFilter",
    name: "b2ContactFilter",
    def: b2ContactFilter
}, {
    trimmed: "ContactImpulse",
    name: "b2ContactImpulse",
    def: b2ContactImpulse
}, {
    trimmed: "ContactListener",
    name: "b2ContactListener",
    def: b2ContactListener
}, {
    trimmed: "QueryCallback",
    name: "b2QueryCallback",
    def: b2QueryCallback
}, {
    trimmed: "RayCastCallback",
    name: "b2RayCastCallback",
    def: b2RayCastCallback
}, {
    trimmed: "TimeStep",
    name: "b2TimeStep",
    def: b2TimeStep
}, {
    trimmed: "Position",
    name: "b2Position",
    def: b2Position
}, {
    trimmed: "Velocity",
    name: "b2Velocity",
    def: b2Velocity
}, {
    trimmed: "SolverData",
    name: "b2SolverData",
    def: b2SolverData
}, {
    trimmed: "World",
    name: "b2World",
    def: b2World
}, {
    trimmed: "MixFriction",
    name: "b2MixFriction",
    def: b2MixFriction
}, {
    trimmed: "MixRestitution",
    name: "b2MixRestitution",
    def: b2MixRestitution
}, {
    trimmed: "ContactRegister",
    name: "b2ContactRegister",
    def: b2ContactRegister
}, {
    trimmed: "ContactEdge",
    name: "b2ContactEdge",
    def: b2ContactEdge
}, {
    trimmed: "Contact",
    name: "b2Contact",
    def: b2Contact
}, {
    trimmed: "CircleContact",
    name: "b2CircleContact",
    def: b2CircleContact
}, {
    trimmed: "PolygonContact",
    name: "b2PolygonContact",
    def: b2PolygonContact
}, {
    trimmed: "ChainAndCircleContact",
    name: "b2ChainAndCircleContact",
    def: b2ChainAndCircleContact
}, {
    trimmed: "ChainAndPolygonContact",
    name: "b2ChainAndPolygonContact",
    def: b2ChainAndPolygonContact
}, {
    trimmed: "EdgeAndCircleContact",
    name: "b2EdgeAndCircleContact",
    def: b2EdgeAndCircleContact
}, {
    trimmed: "EdgeAndPolygonContact",
    name: "b2EdgeAndPolygonContact",
    def: b2EdgeAndPolygonContact
}, {
    trimmed: "PolygonAndCircleContact",
    name: "b2PolygonAndCircleContact",
    def: b2PolygonAndCircleContact
}, {
    trimmed: "defaultFilter",
    name: "b2_defaultFilter",
    def: b2_defaultFilter
}, {
    trimmed: "defaultListener",
    name: "b2_defaultListener",
    def: b2_defaultListener
}, {
    trimmed: "ContactManager",
    name: "b2ContactManager",
    def: b2ContactManager
}, {
    trimmed: "VelocityConstraintPoint",
    name: "b2VelocityConstraintPoint",
    def: b2VelocityConstraintPoint
}, {
    trimmed: "ContactPositionConstraint",
    name: "b2ContactPositionConstraint",
    def: b2ContactPositionConstraint
}, {
    trimmed: "ContactVelocityConstraint",
    name: "b2ContactVelocityConstraint",
    def: b2ContactVelocityConstraint
}, {
    trimmed: "PositionSolverManifold",
    name: "b2PositionSolverManifold",
    def: b2PositionSolverManifold
}, {
    trimmed: "ContactSolverDef",
    name: "b2ContactSolverDef",
    def: b2ContactSolverDef
}, {
    trimmed: "ContactSolver",
    name: "b2ContactSolver",
    def: b2ContactSolver
}, {
    trimmed: "Island",
    name: "b2Island",
    def: b2Island
}, {
    trimmed: "Jacobian",
    name: "b2Jacobian",
    def: b2Jacobian
}, {
    trimmed: "JointEdge",
    name: "b2JointEdge",
    def: b2JointEdge
}, {
    trimmed: "JointDef",
    name: "b2JointDef",
    def: b2JointDef
}, {
    trimmed: "Joint",
    name: "b2Joint",
    def: b2Joint
}, {
    trimmed: "RevoluteJointDef",
    name: "b2RevoluteJointDef",
    def: b2RevoluteJointDef
}, {
    trimmed: "RevoluteJoint",
    name: "b2RevoluteJoint",
    def: b2RevoluteJoint
}, {
    trimmed: "MouseJointDef",
    name: "b2MouseJointDef",
    def: b2MouseJointDef
}, {
    trimmed: "MouseJoint",
    name: "b2MouseJoint",
    def: b2MouseJoint
}, {
    trimmed: "DistanceJointDef",
    name: "b2DistanceJointDef",
    def: b2DistanceJointDef
}, {
    trimmed: "DistanceJoint",
    name: "b2DistanceJoint",
    def: b2DistanceJoint
}, {
    trimmed: "PrismaticJointDef",
    name: "b2PrismaticJointDef",
    def: b2PrismaticJointDef
}, {
    trimmed: "PrismaticJoint",
    name: "b2PrismaticJoint",
    def: b2PrismaticJoint
}, {
    trimmed: "FrictionJointDef",
    name: "b2FrictionJointDef",
    def: b2FrictionJointDef
}, {
    trimmed: "FrictionJoint",
    name: "b2FrictionJoint",
    def: b2FrictionJoint
}, {
    trimmed: "WeldJointDef",
    name: "b2WeldJointDef",
    def: b2WeldJointDef
}, {
    trimmed: "WeldJoint",
    name: "b2WeldJoint",
    def: b2WeldJoint
}, {
    trimmed: "WheelJointDef",
    name: "b2WheelJointDef",
    def: b2WheelJointDef
}, {
    trimmed: "WheelJoint",
    name: "b2WheelJoint",
    def: b2WheelJoint
}, {
    trimmed: "GearJointDef",
    name: "b2GearJointDef",
    def: b2GearJointDef
}, {
    trimmed: "GearJoint",
    name: "b2GearJoint",
    def: b2GearJoint
}, {
    trimmed: "MotorJointDef",
    name: "b2MotorJointDef",
    def: b2MotorJointDef
}, {
    trimmed: "MotorJoint",
    name: "b2MotorJoint",
    def: b2MotorJoint
}, {
    trimmed: "PulleyJointDef",
    name: "b2PulleyJointDef",
    def: b2PulleyJointDef
}, {
    trimmed: "PulleyJoint",
    name: "b2PulleyJoint",
    def: b2PulleyJoint
}, {
    trimmed: "RopeJointDef",
    name: "b2RopeJointDef",
    def: b2RopeJointDef
}, {
    trimmed: "RopeJoint",
    name: "b2RopeJoint",
    def: b2RopeJoint
}, {
    trimmed: "RopeDef",
    name: "b2RopeDef",
    def: b2RopeDef
}, {
    trimmed: "Rope",
    name: "b2Rope",
    def: b2Rope
}, {
    trimmed: "maxManifoldPoints",
    name: "b2_maxManifoldPoints",
    def: b2_maxManifoldPoints
}, {
    trimmed: "maxPolygonVertices",
    name: "b2_maxPolygonVertices",
    def: b2_maxPolygonVertices
}, {
    trimmed: "aabbExtension",
    name: "b2_aabbExtension",
    def: b2_aabbExtension
}, {
    trimmed: "aabbMultiplier",
    name: "b2_aabbMultiplier",
    def: b2_aabbMultiplier
}, {
    trimmed: "linearSlop",
    name: "b2_linearSlop",
    def: b2_linearSlop
}, {
    trimmed: "angularSlop",
    name: "b2_angularSlop",
    def: b2_angularSlop
}, {
    trimmed: "polygonRadius",
    name: "b2_polygonRadius",
    def: b2_polygonRadius
}, {
    trimmed: "maxSubSteps",
    name: "b2_maxSubSteps",
    def: b2_maxSubSteps
}, {
    trimmed: "maxTOIContacts",
    name: "b2_maxTOIContacts",
    def: b2_maxTOIContacts
}, {
    trimmed: "velocityThreshold",
    name: "b2_velocityThreshold",
    def: b2_velocityThreshold
}, {
    trimmed: "maxLinearCorrection",
    name: "b2_maxLinearCorrection",
    def: b2_maxLinearCorrection
}, {
    trimmed: "maxAngularCorrection",
    name: "b2_maxAngularCorrection",
    def: b2_maxAngularCorrection
}, {
    trimmed: "maxTranslation",
    name: "b2_maxTranslation",
    def: b2_maxTranslation
}, {
    trimmed: "maxTranslationSquared",
    name: "b2_maxTranslationSquared",
    def: b2_maxTranslationSquared
}, {
    trimmed: "maxRotation",
    name: "b2_maxRotation",
    def: b2_maxRotation
}, {
    trimmed: "maxRotationSquared",
    name: "b2_maxRotationSquared",
    def: b2_maxRotationSquared
}, {
    trimmed: "baumgarte",
    name: "b2_baumgarte",
    def: b2_baumgarte
}, {
    trimmed: "toiBaugarte",
    name: "b2_toiBaugarte",
    def: b2_toiBaugarte
}, {
    trimmed: "timeToSleep",
    name: "b2_timeToSleep",
    def: b2_timeToSleep
}, {
    trimmed: "linearSleepTolerance",
    name: "b2_linearSleepTolerance",
    def: b2_linearSleepTolerance
}, {
    trimmed: "angularSleepTolerance",
    name: "b2_angularSleepTolerance",
    def: b2_angularSleepTolerance
}, {
    trimmed: "epsilon",
    name: "b2_epsilon",
    def: b2_epsilon
}, {
    trimmed: "JsonSerializer",
    name: "b2JsonSerializer",
    def: b2JsonSerializer
}, {
    trimmed: "RUBELoader",
    name: "b2RUBELoader",
    def: b2RUBELoader
}, {
    trimmed: "Profiler",
    name: "b2Profiler",
    def: b2Profiler
}];


if (typeof (b2_compatibility) !== "undefined" && typeof (window) !== "undefined") {
    for (var i = 0; i < mappings.length; ++i) {
        window[mappings[i].name] = mappings[i].def
    }
} else {
    var b2 = {};
    for (var i = 0; i < mappings.length; ++i) {
        b2[mappings[i].trimmed] = mappings[i].def
    }
    if (typeof (module) !== "undefined") {
        module.exports = b2
    } else {
        window.b2 = b2
    }
}
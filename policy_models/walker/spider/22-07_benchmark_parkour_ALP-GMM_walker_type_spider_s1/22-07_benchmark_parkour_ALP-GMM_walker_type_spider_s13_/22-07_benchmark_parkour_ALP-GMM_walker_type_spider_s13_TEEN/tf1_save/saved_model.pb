Üş
õ(Î(
:
Add
x"T
y"T
z"T"
Ttype:
2	
W
AddN
inputs"T*N
sum"T"
Nint(0"!
Ttype:
2	
A
AddV2
x"T
y"T
z"T"
Ttype:
2	
î
	ApplyAdam
var"T	
m"T	
v"T
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"T" 
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
I
ConcatOffset

concat_dim
shape*N
offset*N"
Nint(0
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
S
DynamicStitch
indices*N
data"T*N
merged"T"
Nint(0"	
Ttype
,
Exp
x"T
y"T"
Ttype:

2
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
9
FloorMod
x"T
y"T
z"T"
Ttype:

2	
=
Greater
x"T
y"T
z
"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
,
Log
x"T
y"T"
Ttype:

2
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
8
Maximum
x"T
y"T
z"T"
Ttype:

2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
8
Minimum
x"T
y"T
z"T"
Ttype:

2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	

RandomStandardNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
5

Reciprocal
x"T
y"T"
Ttype:

2	
E
Relu
features"T
activations"T"
Ttype:
2	
V
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
@
Softplus
features"T
activations"T"
Ttype:
2
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
2
StopGradient

input"T
output"T"	
Ttype
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
-
Tanh
x"T
y"T"
Ttype:

2
:
TanhGrad
y"T
dy"T
z"T"
Ttype:

2
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 
&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.15.52v1.15.4-39-g3db52be¿
^
PlaceholderPlaceholder*
dtype0*
shape:	È*
_output_shapes
:	È
g
truncated_normal/shapeConst*
_output_shapes
:*
valueB"   @   *
dtype0
Z
truncated_normal/meanConst*
_output_shapes
: *
valueB
 *    *
dtype0
\
truncated_normal/stddevConst*
_output_shapes
: *
valueB
 *   @*
dtype0

 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*
dtype0*
seed2 *
T0*

seed *
_output_shapes

:@

truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*
_output_shapes

:@*
T0
m
truncated_normalAddtruncated_normal/multruncated_normal/mean*
_output_shapes

:@*
T0
|
Variable
VariableV2*
_output_shapes

:@*
shared_name *
shape
:@*
	container *
dtype0
¤
Variable/AssignAssignVariabletruncated_normal*
_class
loc:@Variable*
validate_shape(*
T0*
_output_shapes

:@*
use_locking(
i
Variable/readIdentityVariable*
_output_shapes

:@*
_class
loc:@Variable*
T0
|
MatMulMatMulPlaceholderVariable/read*
_output_shapes
:	È@*
transpose_b( *
transpose_a( *
T0
>
TanhTanhMatMul*
_output_shapes
:	È@*
T0
i
truncated_normal_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   @   
\
truncated_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_1/stddevConst*
dtype0*
valueB
 *   @*
_output_shapes
: 

"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
T0*
_output_shapes

:@@*

seed *
dtype0*
seed2 

truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
_output_shapes

:@@*
T0
s
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*
_output_shapes

:@@
~

Variable_1
VariableV2*
	container *
_output_shapes

:@@*
dtype0*
shared_name *
shape
:@@
¬
Variable_1/AssignAssign
Variable_1truncated_normal_1*
validate_shape(*
use_locking(*
_output_shapes

:@@*
_class
loc:@Variable_1*
T0
o
Variable_1/readIdentity
Variable_1*
_output_shapes

:@@*
_class
loc:@Variable_1*
T0
y
MatMul_1MatMulTanhVariable_1/read*
transpose_a( *
T0*
transpose_b( *
_output_shapes
:	È@
H
SoftplusSoftplusMatMul_1*
_output_shapes
:	È@*
T0
i
truncated_normal_2/shapeConst*
_output_shapes
:*
valueB"@   @   *
dtype0
\
truncated_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_2/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *   @

"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*
dtype0*

seed *
seed2 *
_output_shapes

:@@*
T0

truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
T0*
_output_shapes

:@@
s
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
_output_shapes

:@@*
T0
~

Variable_2
VariableV2*
dtype0*
_output_shapes

:@@*
shape
:@@*
	container *
shared_name 
¬
Variable_2/AssignAssign
Variable_2truncated_normal_2*
validate_shape(*
T0*
_output_shapes

:@@*
_class
loc:@Variable_2*
use_locking(
o
Variable_2/readIdentity
Variable_2*
_class
loc:@Variable_2*
_output_shapes

:@@*
T0
}
MatMul_2MatMulSoftplusVariable_2/read*
_output_shapes
:	È@*
transpose_b( *
T0*
transpose_a( 
B
Tanh_1TanhMatMul_2*
_output_shapes
:	È@*
T0
i
truncated_normal_3/shapeConst*
_output_shapes
:*
valueB"@   @   *
dtype0
\
truncated_normal_3/meanConst*
_output_shapes
: *
dtype0*
valueB
 *    
^
truncated_normal_3/stddevConst*
valueB
 *   @*
_output_shapes
: *
dtype0

"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*
_output_shapes

:@@*
T0*
dtype0*

seed *
seed2 

truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
_output_shapes

:@@*
T0
s
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
_output_shapes

:@@*
T0
~

Variable_3
VariableV2*
dtype0*
shape
:@@*
_output_shapes

:@@*
	container *
shared_name 
¬
Variable_3/AssignAssign
Variable_3truncated_normal_3*
_class
loc:@Variable_3*
use_locking(*
T0*
validate_shape(*
_output_shapes

:@@
o
Variable_3/readIdentity
Variable_3*
T0*
_output_shapes

:@@*
_class
loc:@Variable_3
{
MatMul_3MatMulTanh_1Variable_3/read*
T0*
transpose_a( *
transpose_b( *
_output_shapes
:	È@
J

Softplus_1SoftplusMatMul_3*
_output_shapes
:	È@*
T0
i
truncated_normal_4/shapeConst*
valueB"@      *
_output_shapes
:*
dtype0
\
truncated_normal_4/meanConst*
valueB
 *    *
_output_shapes
: *
dtype0
^
truncated_normal_4/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *   @

"truncated_normal_4/TruncatedNormalTruncatedNormaltruncated_normal_4/shape*
_output_shapes

:@*

seed *
dtype0*
seed2 *
T0

truncated_normal_4/mulMul"truncated_normal_4/TruncatedNormaltruncated_normal_4/stddev*
T0*
_output_shapes

:@
s
truncated_normal_4Addtruncated_normal_4/multruncated_normal_4/mean*
_output_shapes

:@*
T0
~

Variable_4
VariableV2*
_output_shapes

:@*
shared_name *
	container *
shape
:@*
dtype0
¬
Variable_4/AssignAssign
Variable_4truncated_normal_4*
_class
loc:@Variable_4*
validate_shape(*
T0*
use_locking(*
_output_shapes

:@
o
Variable_4/readIdentity
Variable_4*
_output_shapes

:@*
T0*
_class
loc:@Variable_4

MatMul_4MatMul
Softplus_1Variable_4/read*
T0*
_output_shapes
:	È*
transpose_a( *
transpose_b( 
^
Reshape/shapeConst*
valueB"È      *
dtype0*
_output_shapes
:
c
ReshapeReshapeMatMul_4Reshape/shape*
_output_shapes
:	È*
Tshape0*
T0
n
initNoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign
Y
save/filename/inputConst*
valueB Bmodel*
_output_shapes
: *
dtype0
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0*
_output_shapes
: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
shape: *
_output_shapes
: 

save/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*M
valueDBBBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4
m
save/SaveV2/shape_and_slicesConst*
dtype0*
valueBB B B B B *
_output_shapes
:
¨
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2
Variable_3
Variable_4*
dtypes	
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
_output_shapes
: *
_class
loc:@save/Const*
T0

save/RestoreV2/tensor_namesConst*
_output_shapes
:*M
valueDBBBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4*
dtype0
p
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueBB B B B B *
_output_shapes
:
¤
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*(
_output_shapes
:::::*
dtypes	
2

save/AssignAssignVariablesave/RestoreV2*
T0*
_output_shapes

:@*
use_locking(*
validate_shape(*
_class
loc:@Variable
¦
save/Assign_1Assign
Variable_1save/RestoreV2:1*
use_locking(*
_class
loc:@Variable_1*
_output_shapes

:@@*
T0*
validate_shape(
¦
save/Assign_2Assign
Variable_2save/RestoreV2:2*
_class
loc:@Variable_2*
T0*
use_locking(*
validate_shape(*
_output_shapes

:@@
¦
save/Assign_3Assign
Variable_3save/RestoreV2:3*
use_locking(*
_output_shapes

:@@*
T0*
validate_shape(*
_class
loc:@Variable_3
¦
save/Assign_4Assign
Variable_4save/RestoreV2:4*
validate_shape(*
_output_shapes

:@*
_class
loc:@Variable_4*
T0*
use_locking(
f
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4
p
Placeholder_1Placeholder*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ6*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6
p
Placeholder_2Placeholder*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ
p
Placeholder_3Placeholder*
shape:ÿÿÿÿÿÿÿÿÿ6*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6*
dtype0
h
Placeholder_4Placeholder*
shape:ÿÿÿÿÿÿÿÿÿ*
dtype0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
Placeholder_5Placeholder*
dtype0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shape:ÿÿÿÿÿÿÿÿÿ
¯
5main/pi/dense/kernel/Initializer/random_uniform/shapeConst*
dtype0*'
_class
loc:@main/pi/dense/kernel*
valueB"6     *
_output_shapes
:
¡
3main/pi/dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *'
_class
loc:@main/pi/dense/kernel*
valueB
 *Hpë½*
dtype0
¡
3main/pi/dense/kernel/Initializer/random_uniform/maxConst*
dtype0*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
: *
valueB
 *Hpë=
ş
=main/pi/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform5main/pi/dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*'
_class
loc:@main/pi/dense/kernel*
seed2 *

seed *
_output_shapes
:	6
î
3main/pi/dense/kernel/Initializer/random_uniform/subSub3main/pi/dense/kernel/Initializer/random_uniform/max3main/pi/dense/kernel/Initializer/random_uniform/min*
T0*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
: 

3main/pi/dense/kernel/Initializer/random_uniform/mulMul=main/pi/dense/kernel/Initializer/random_uniform/RandomUniform3main/pi/dense/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel
ó
/main/pi/dense/kernel/Initializer/random_uniformAdd3main/pi/dense/kernel/Initializer/random_uniform/mul3main/pi/dense/kernel/Initializer/random_uniform/min*
_output_shapes
:	6*
T0*'
_class
loc:@main/pi/dense/kernel
³
main/pi/dense/kernel
VariableV2*
shape:	6*
shared_name *
dtype0*
_output_shapes
:	6*
	container *'
_class
loc:@main/pi/dense/kernel
è
main/pi/dense/kernel/AssignAssignmain/pi/dense/kernel/main/pi/dense/kernel/Initializer/random_uniform*'
_class
loc:@main/pi/dense/kernel*
validate_shape(*
_output_shapes
:	6*
T0*
use_locking(

main/pi/dense/kernel/readIdentitymain/pi/dense/kernel*
_output_shapes
:	6*
T0*'
_class
loc:@main/pi/dense/kernel

$main/pi/dense/bias/Initializer/zerosConst*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
§
main/pi/dense/bias
VariableV2*
	container *
shared_name *%
_class
loc:@main/pi/dense/bias*
dtype0*
shape:*
_output_shapes	
:
Ó
main/pi/dense/bias/AssignAssignmain/pi/dense/bias$main/pi/dense/bias/Initializer/zeros*%
_class
loc:@main/pi/dense/bias*
T0*
use_locking(*
validate_shape(*
_output_shapes	
:

main/pi/dense/bias/readIdentitymain/pi/dense/bias*
T0*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias
¡
main/pi/dense/MatMulMatMulPlaceholder_1main/pi/dense/kernel/read*
T0*
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b( 

main/pi/dense/BiasAddBiasAddmain/pi/dense/MatMulmain/pi/dense/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
d
main/pi/dense/ReluRelumain/pi/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
³
7main/pi/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"  ,  *
_output_shapes
:*
dtype0*)
_class
loc:@main/pi/dense_1/kernel
¥
5main/pi/dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *£½½*)
_class
loc:@main/pi/dense_1/kernel
¥
5main/pi/dense_1/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *£½=*)
_class
loc:@main/pi/dense_1/kernel

?main/pi/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/pi/dense_1/kernel/Initializer/random_uniform/shape*

seed * 
_output_shapes
:
¬*
T0*)
_class
loc:@main/pi/dense_1/kernel*
seed2 *
dtype0
ö
5main/pi/dense_1/kernel/Initializer/random_uniform/subSub5main/pi/dense_1/kernel/Initializer/random_uniform/max5main/pi/dense_1/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@main/pi/dense_1/kernel*
_output_shapes
: 

5main/pi/dense_1/kernel/Initializer/random_uniform/mulMul?main/pi/dense_1/kernel/Initializer/random_uniform/RandomUniform5main/pi/dense_1/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
T0
ü
1main/pi/dense_1/kernel/Initializer/random_uniformAdd5main/pi/dense_1/kernel/Initializer/random_uniform/mul5main/pi/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*
T0
¹
main/pi/dense_1/kernel
VariableV2*)
_class
loc:@main/pi/dense_1/kernel*
shape:
¬*
	container * 
_output_shapes
:
¬*
shared_name *
dtype0
ñ
main/pi/dense_1/kernel/AssignAssignmain/pi/dense_1/kernel1main/pi/dense_1/kernel/Initializer/random_uniform*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
use_locking(

main/pi/dense_1/kernel/readIdentitymain/pi/dense_1/kernel*
T0*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬

&main/pi/dense_1/bias/Initializer/zerosConst*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias*
valueB¬*    *
dtype0
«
main/pi/dense_1/bias
VariableV2*
dtype0*
shared_name *'
_class
loc:@main/pi/dense_1/bias*
	container *
shape:¬*
_output_shapes	
:¬
Û
main/pi/dense_1/bias/AssignAssignmain/pi/dense_1/bias&main/pi/dense_1/bias/Initializer/zeros*
T0*'
_class
loc:@main/pi/dense_1/bias*
validate_shape(*
_output_shapes	
:¬*
use_locking(

main/pi/dense_1/bias/readIdentitymain/pi/dense_1/bias*
T0*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬
ª
main/pi/dense_1/MatMulMatMulmain/pi/dense/Relumain/pi/dense_1/kernel/read*
transpose_b( *
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0

main/pi/dense_1/BiasAddBiasAddmain/pi/dense_1/MatMulmain/pi/dense_1/bias/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
data_formatNHWC
h
main/pi/dense_1/ReluRelumain/pi/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
³
7main/pi/dense_2/kernel/Initializer/random_uniform/shapeConst*
valueB",     *)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:*
dtype0
¥
5main/pi/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
valueB
 *Õ ¾*
_output_shapes
: 
¥
5main/pi/dense_2/kernel/Initializer/random_uniform/maxConst*
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
valueB
 *Õ >*
_output_shapes
: 

?main/pi/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/pi/dense_2/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel*

seed *
seed2 
ö
5main/pi/dense_2/kernel/Initializer/random_uniform/subSub5main/pi/dense_2/kernel/Initializer/random_uniform/max5main/pi/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@main/pi/dense_2/kernel

5main/pi/dense_2/kernel/Initializer/random_uniform/mulMul?main/pi/dense_2/kernel/Initializer/random_uniform/RandomUniform5main/pi/dense_2/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel
û
1main/pi/dense_2/kernel/Initializer/random_uniformAdd5main/pi/dense_2/kernel/Initializer/random_uniform/mul5main/pi/dense_2/kernel/Initializer/random_uniform/min*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
T0
·
main/pi/dense_2/kernel
VariableV2*
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
shared_name *
_output_shapes
:	¬*
shape:	¬*
	container 
ğ
main/pi/dense_2/kernel/AssignAssignmain/pi/dense_2/kernel1main/pi/dense_2/kernel/Initializer/random_uniform*
use_locking(*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(

main/pi/dense_2/kernel/readIdentitymain/pi/dense_2/kernel*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
T0

&main/pi/dense_2/bias/Initializer/zerosConst*'
_class
loc:@main/pi/dense_2/bias*
dtype0*
valueB*    *
_output_shapes
:
©
main/pi/dense_2/bias
VariableV2*
shape:*
_output_shapes
:*
dtype0*'
_class
loc:@main/pi/dense_2/bias*
shared_name *
	container 
Ú
main/pi/dense_2/bias/AssignAssignmain/pi/dense_2/bias&main/pi/dense_2/bias/Initializer/zeros*
use_locking(*
validate_shape(*
T0*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:

main/pi/dense_2/bias/readIdentitymain/pi/dense_2/bias*'
_class
loc:@main/pi/dense_2/bias*
T0*
_output_shapes
:
«
main/pi/dense_2/MatMulMatMulmain/pi/dense_1/Relumain/pi/dense_2/kernel/read*
transpose_a( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b( *
T0

main/pi/dense_2/BiasAddBiasAddmain/pi/dense_2/MatMulmain/pi/dense_2/bias/read*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
data_formatNHWC
³
7main/pi/dense_3/kernel/Initializer/random_uniform/shapeConst*
dtype0*)
_class
loc:@main/pi/dense_3/kernel*
valueB",     *
_output_shapes
:
¥
5main/pi/dense_3/kernel/Initializer/random_uniform/minConst*
valueB
 *Õ ¾*
_output_shapes
: *)
_class
loc:@main/pi/dense_3/kernel*
dtype0
¥
5main/pi/dense_3/kernel/Initializer/random_uniform/maxConst*
valueB
 *Õ >*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
: *
dtype0

?main/pi/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/pi/dense_3/kernel/Initializer/random_uniform/shape*
_output_shapes
:	¬*

seed *)
_class
loc:@main/pi/dense_3/kernel*
dtype0*
seed2 *
T0
ö
5main/pi/dense_3/kernel/Initializer/random_uniform/subSub5main/pi/dense_3/kernel/Initializer/random_uniform/max5main/pi/dense_3/kernel/Initializer/random_uniform/min*)
_class
loc:@main/pi/dense_3/kernel*
T0*
_output_shapes
: 

5main/pi/dense_3/kernel/Initializer/random_uniform/mulMul?main/pi/dense_3/kernel/Initializer/random_uniform/RandomUniform5main/pi/dense_3/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/pi/dense_3/kernel*
T0*
_output_shapes
:	¬
û
1main/pi/dense_3/kernel/Initializer/random_uniformAdd5main/pi/dense_3/kernel/Initializer/random_uniform/mul5main/pi/dense_3/kernel/Initializer/random_uniform/min*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_3/kernel
·
main/pi/dense_3/kernel
VariableV2*
dtype0*
	container *)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
shared_name *
shape:	¬
ğ
main/pi/dense_3/kernel/AssignAssignmain/pi/dense_3/kernel1main/pi/dense_3/kernel/Initializer/random_uniform*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(*
T0

main/pi/dense_3/kernel/readIdentitymain/pi/dense_3/kernel*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_3/kernel

&main/pi/dense_3/bias/Initializer/zerosConst*'
_class
loc:@main/pi/dense_3/bias*
valueB*    *
dtype0*
_output_shapes
:
©
main/pi/dense_3/bias
VariableV2*
shape:*'
_class
loc:@main/pi/dense_3/bias*
dtype0*
shared_name *
	container *
_output_shapes
:
Ú
main/pi/dense_3/bias/AssignAssignmain/pi/dense_3/bias&main/pi/dense_3/bias/Initializer/zeros*'
_class
loc:@main/pi/dense_3/bias*
T0*
use_locking(*
_output_shapes
:*
validate_shape(

main/pi/dense_3/bias/readIdentitymain/pi/dense_3/bias*
T0*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:
«
main/pi/dense_3/MatMulMatMulmain/pi/dense_1/Relumain/pi/dense_3/kernel/read*
transpose_b( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
transpose_a( 

main/pi/dense_3/BiasAddBiasAddmain/pi/dense_3/MatMulmain/pi/dense_3/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
g
main/pi/dense_3/TanhTanhmain/pi/dense_3/BiasAdd*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
R
main/pi/add/yConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
k
main/pi/addAddV2main/pi/dense_3/Tanhmain/pi/add/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
R
main/pi/mul/xConst*
valueB
 *  0A*
_output_shapes
: *
dtype0
`
main/pi/mulMulmain/pi/mul/xmain/pi/add*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
main/pi/add_1/xConst*
dtype0*
valueB
 *   Á*
_output_shapes
: 
f
main/pi/add_1AddV2main/pi/add_1/xmain/pi/mul*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
S
main/pi/ExpExpmain/pi/add_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
d
main/pi/ShapeShapemain/pi/dense_2/BiasAdd*
T0*
out_type0*
_output_shapes
:
_
main/pi/random_normal/meanConst*
_output_shapes
: *
dtype0*
valueB
 *    
a
main/pi/random_normal/stddevConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
©
*main/pi/random_normal/RandomStandardNormalRandomStandardNormalmain/pi/Shape*

seed *
seed2 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*
T0

main/pi/random_normal/mulMul*main/pi/random_normal/RandomStandardNormalmain/pi/random_normal/stddev*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

main/pi/random_normalAddmain/pi/random_normal/mulmain/pi/random_normal/mean*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
j
main/pi/mul_1Mulmain/pi/random_normalmain/pi/Exp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
p
main/pi/add_2AddV2main/pi/dense_2/BiasAddmain/pi/mul_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
l
main/pi/subSubmain/pi/add_2main/pi/dense_2/BiasAdd*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
U
main/pi/Exp_1Expmain/pi/add_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
main/pi/add_3/yConst*
_output_shapes
: *
valueB
 *wÌ+2*
dtype0
h
main/pi/add_3AddV2main/pi/Exp_1main/pi/add_3/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
main/pi/truedivRealDivmain/pi/submain/pi/add_3*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
R
main/pi/pow/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
d
main/pi/powPowmain/pi/truedivmain/pi/pow/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
main/pi/mul_2/xConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
f
main/pi/mul_2Mulmain/pi/mul_2/xmain/pi/add_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
d
main/pi/add_4AddV2main/pi/powmain/pi/mul_2*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
main/pi/add_5/yConst*
valueB
 *?ë?*
dtype0*
_output_shapes
: 
h
main/pi/add_5AddV2main/pi/add_4main/pi/add_5/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
main/pi/mul_3/xConst*
dtype0*
_output_shapes
: *
valueB
 *   ¿
f
main/pi/mul_3Mulmain/pi/mul_3/xmain/pi/add_5*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
_
main/pi/Sum/reduction_indicesConst*
dtype0*
_output_shapes
: *
value	B :

main/pi/SumSummain/pi/mul_3main/pi/Sum/reduction_indices*

Tidx0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
	keep_dims( 
_
main/pi/TanhTanhmain/pi/dense_2/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
W
main/pi/Tanh_1Tanhmain/pi/add_2*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
main/pi/pow_1/yConst*
valueB
 *   @*
_output_shapes
: *
dtype0
g
main/pi/pow_1Powmain/pi/Tanh_1main/pi/pow_1/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
main/pi/sub_1/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
main/pi/sub_1Submain/pi/sub_1/xmain/pi/pow_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
V
main/pi/Greater/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
n
main/pi/GreaterGreatermain/pi/sub_1main/pi/Greater/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
v
main/pi/CastCastmain/pi/Greater*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

SrcT0
*

DstT0*
Truncate( 
S
main/pi/Less/yConst*
_output_shapes
: *
valueB
 *    *
dtype0
e
main/pi/LessLessmain/pi/sub_1main/pi/Less/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
u
main/pi/Cast_1Castmain/pi/Less*

DstT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Truncate( *

SrcT0

T
main/pi/sub_2/xConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
f
main/pi/sub_2Submain/pi/sub_2/xmain/pi/sub_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
c
main/pi/mul_4Mulmain/pi/sub_2main/pi/Cast*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
main/pi/sub_3/xConst*
valueB
 *    *
dtype0*
_output_shapes
: 
f
main/pi/sub_3Submain/pi/sub_3/xmain/pi/sub_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
e
main/pi/mul_5Mulmain/pi/sub_3main/pi/Cast_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
f
main/pi/add_6AddV2main/pi/mul_4main/pi/mul_5*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
e
main/pi/StopGradientStopGradientmain/pi/add_6*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
m
main/pi/add_7AddV2main/pi/sub_1main/pi/StopGradient*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
main/pi/add_8/yConst*
dtype0*
valueB
 *½75*
_output_shapes
: 
h
main/pi/add_8AddV2main/pi/add_7main/pi/add_8/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
S
main/pi/LogLogmain/pi/add_8*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
a
main/pi/Sum_1/reduction_indicesConst*
_output_shapes
: *
value	B :*
dtype0

main/pi/Sum_1Summain/pi/Logmain/pi/Sum_1/reduction_indices*
T0*
	keep_dims( *#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

Tidx0
^
main/pi/sub_4Submain/pi/Summain/pi/Sum_1*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
O

main/mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
[
main/mulMulmain/pi/Tanh
main/mul/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Q
main/mul_1/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
a

main/mul_1Mulmain/pi/Tanh_1main/mul_1/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
^
main/q1/concat/axisConst*
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ*
_output_shapes
: 

main/q1/concatConcatV2Placeholder_1Placeholder_2main/q1/concat/axis*

Tidx0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
N*
T0
¯
5main/q1/dense/kernel/Initializer/random_uniform/shapeConst*'
_class
loc:@main/q1/dense/kernel*
dtype0*
valueB"B     *
_output_shapes
:
¡
3main/q1/dense/kernel/Initializer/random_uniform/minConst*'
_class
loc:@main/q1/dense/kernel*
valueB
 *.cè½*
_output_shapes
: *
dtype0
¡
3main/q1/dense/kernel/Initializer/random_uniform/maxConst*'
_class
loc:@main/q1/dense/kernel*
valueB
 *.cè=*
dtype0*
_output_shapes
: 
ş
=main/q1/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform5main/q1/dense/kernel/Initializer/random_uniform/shape*'
_class
loc:@main/q1/dense/kernel*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:	B
î
3main/q1/dense/kernel/Initializer/random_uniform/subSub3main/q1/dense/kernel/Initializer/random_uniform/max3main/q1/dense/kernel/Initializer/random_uniform/min*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
: 

3main/q1/dense/kernel/Initializer/random_uniform/mulMul=main/q1/dense/kernel/Initializer/random_uniform/RandomUniform3main/q1/dense/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel
ó
/main/q1/dense/kernel/Initializer/random_uniformAdd3main/q1/dense/kernel/Initializer/random_uniform/mul3main/q1/dense/kernel/Initializer/random_uniform/min*
_output_shapes
:	B*
T0*'
_class
loc:@main/q1/dense/kernel
³
main/q1/dense/kernel
VariableV2*
	container *
shared_name *
_output_shapes
:	B*
shape:	B*
dtype0*'
_class
loc:@main/q1/dense/kernel
è
main/q1/dense/kernel/AssignAssignmain/q1/dense/kernel/main/q1/dense/kernel/Initializer/random_uniform*
validate_shape(*
T0*
use_locking(*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel

main/q1/dense/kernel/readIdentitymain/q1/dense/kernel*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
T0

$main/q1/dense/bias/Initializer/zerosConst*
valueB*    *%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
dtype0
§
main/q1/dense/bias
VariableV2*
	container *%
_class
loc:@main/q1/dense/bias*
shape:*
shared_name *
_output_shapes	
:*
dtype0
Ó
main/q1/dense/bias/AssignAssignmain/q1/dense/bias$main/q1/dense/bias/Initializer/zeros*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
T0*
validate_shape(*
use_locking(

main/q1/dense/bias/readIdentitymain/q1/dense/bias*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:
¢
main/q1/dense/MatMulMatMulmain/q1/concatmain/q1/dense/kernel/read*
transpose_a( *
T0*
transpose_b( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

main/q1/dense/BiasAddBiasAddmain/q1/dense/MatMulmain/q1/dense/bias/read*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
d
main/q1/dense/ReluRelumain/q1/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
³
7main/q1/dense_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"  ,  *)
_class
loc:@main/q1/dense_1/kernel
¥
5main/q1/dense_1/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
dtype0*)
_class
loc:@main/q1/dense_1/kernel*
valueB
 *£½½
¥
5main/q1/dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *£½=*
_output_shapes
: *)
_class
loc:@main/q1/dense_1/kernel*
dtype0

?main/q1/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q1/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
T0* 
_output_shapes
:
¬*
seed2 *

seed *)
_class
loc:@main/q1/dense_1/kernel
ö
5main/q1/dense_1/kernel/Initializer/random_uniform/subSub5main/q1/dense_1/kernel/Initializer/random_uniform/max5main/q1/dense_1/kernel/Initializer/random_uniform/min*)
_class
loc:@main/q1/dense_1/kernel*
T0*
_output_shapes
: 

5main/q1/dense_1/kernel/Initializer/random_uniform/mulMul?main/q1/dense_1/kernel/Initializer/random_uniform/RandomUniform5main/q1/dense_1/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬
ü
1main/q1/dense_1/kernel/Initializer/random_uniformAdd5main/q1/dense_1/kernel/Initializer/random_uniform/mul5main/q1/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬*
T0*)
_class
loc:@main/q1/dense_1/kernel
¹
main/q1/dense_1/kernel
VariableV2*
dtype0* 
_output_shapes
:
¬*
shape:
¬*
	container *)
_class
loc:@main/q1/dense_1/kernel*
shared_name 
ñ
main/q1/dense_1/kernel/AssignAssignmain/q1/dense_1/kernel1main/q1/dense_1/kernel/Initializer/random_uniform* 
_output_shapes
:
¬*
use_locking(*
T0*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel

main/q1/dense_1/kernel/readIdentitymain/q1/dense_1/kernel* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel*
T0

&main/q1/dense_1/bias/Initializer/zerosConst*
valueB¬*    *'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
dtype0
«
main/q1/dense_1/bias
VariableV2*
	container *
_output_shapes	
:¬*
dtype0*'
_class
loc:@main/q1/dense_1/bias*
shared_name *
shape:¬
Û
main/q1/dense_1/bias/AssignAssignmain/q1/dense_1/bias&main/q1/dense_1/bias/Initializer/zeros*
T0*
validate_shape(*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
use_locking(

main/q1/dense_1/bias/readIdentitymain/q1/dense_1/bias*
T0*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias
ª
main/q1/dense_1/MatMulMatMulmain/q1/dense/Relumain/q1/dense_1/kernel/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
transpose_a( *
transpose_b( 

main/q1/dense_1/BiasAddBiasAddmain/q1/dense_1/MatMulmain/q1/dense_1/bias/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
data_formatNHWC
h
main/q1/dense_1/ReluRelumain/q1/dense_1/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
³
7main/q1/dense_2/kernel/Initializer/random_uniform/shapeConst*
valueB",     *)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:*
dtype0
¥
5main/q1/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
: *
valueB
 * ¾
¥
5main/q1/dense_2/kernel/Initializer/random_uniform/maxConst*
valueB
 * >*
dtype0*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
: 

?main/q1/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q1/dense_2/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	¬*

seed *
seed2 *
T0*)
_class
loc:@main/q1/dense_2/kernel
ö
5main/q1/dense_2/kernel/Initializer/random_uniform/subSub5main/q1/dense_2/kernel/Initializer/random_uniform/max5main/q1/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
: *)
_class
loc:@main/q1/dense_2/kernel*
T0

5main/q1/dense_2/kernel/Initializer/random_uniform/mulMul?main/q1/dense_2/kernel/Initializer/random_uniform/RandomUniform5main/q1/dense_2/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/q1/dense_2/kernel*
T0*
_output_shapes
:	¬
û
1main/q1/dense_2/kernel/Initializer/random_uniformAdd5main/q1/dense_2/kernel/Initializer/random_uniform/mul5main/q1/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel
·
main/q1/dense_2/kernel
VariableV2*
shared_name *)
_class
loc:@main/q1/dense_2/kernel*
shape:	¬*
dtype0*
	container *
_output_shapes
:	¬
ğ
main/q1/dense_2/kernel/AssignAssignmain/q1/dense_2/kernel1main/q1/dense_2/kernel/Initializer/random_uniform*
use_locking(*
_output_shapes
:	¬*
T0*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel

main/q1/dense_2/kernel/readIdentitymain/q1/dense_2/kernel*
_output_shapes
:	¬*
T0*)
_class
loc:@main/q1/dense_2/kernel

&main/q1/dense_2/bias/Initializer/zerosConst*
valueB*    *'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:*
dtype0
©
main/q1/dense_2/bias
VariableV2*
shared_name *
_output_shapes
:*
	container *
dtype0*
shape:*'
_class
loc:@main/q1/dense_2/bias
Ú
main/q1/dense_2/bias/AssignAssignmain/q1/dense_2/bias&main/q1/dense_2/bias/Initializer/zeros*
_output_shapes
:*
validate_shape(*
use_locking(*'
_class
loc:@main/q1/dense_2/bias*
T0

main/q1/dense_2/bias/readIdentitymain/q1/dense_2/bias*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
T0
«
main/q1/dense_2/MatMulMatMulmain/q1/dense_1/Relumain/q1/dense_2/kernel/read*
T0*
transpose_a( *
transpose_b( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

main/q1/dense_2/BiasAddBiasAddmain/q1/dense_2/MatMulmain/q1/dense_2/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
data_formatNHWC*
T0
x
main/q1/SqueezeSqueezemain/q1/dense_2/BiasAdd*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims

`
main/q1_1/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ

main/q1_1/concatConcatV2Placeholder_1
main/mul_1main/q1_1/concat/axis*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*

Tidx0*
N*
T0
¦
main/q1_1/dense/MatMulMatMulmain/q1_1/concatmain/q1/dense/kernel/read*
transpose_a( *
transpose_b( *
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

main/q1_1/dense/BiasAddBiasAddmain/q1_1/dense/MatMulmain/q1/dense/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
main/q1_1/dense/ReluRelumain/q1_1/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
®
main/q1_1/dense_1/MatMulMatMulmain/q1_1/dense/Relumain/q1/dense_1/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
transpose_a( *
T0*
transpose_b( 
£
main/q1_1/dense_1/BiasAddBiasAddmain/q1_1/dense_1/MatMulmain/q1/dense_1/bias/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
data_formatNHWC
l
main/q1_1/dense_1/ReluRelumain/q1_1/dense_1/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
¯
main/q1_1/dense_2/MatMulMatMulmain/q1_1/dense_1/Relumain/q1/dense_2/kernel/read*
transpose_a( *
T0*
transpose_b( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¢
main/q1_1/dense_2/BiasAddBiasAddmain/q1_1/dense_2/MatMulmain/q1/dense_2/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
|
main/q1_1/SqueezeSqueezemain/q1_1/dense_2/BiasAdd*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
squeeze_dims

^
main/q2/concat/axisConst*
_output_shapes
: *
valueB :
ÿÿÿÿÿÿÿÿÿ*
dtype0

main/q2/concatConcatV2Placeholder_1Placeholder_2main/q2/concat/axis*

Tidx0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
T0*
N
¯
5main/q2/dense/kernel/Initializer/random_uniform/shapeConst*
valueB"B     *
dtype0*
_output_shapes
:*'
_class
loc:@main/q2/dense/kernel
¡
3main/q2/dense/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *.cè½*'
_class
loc:@main/q2/dense/kernel
¡
3main/q2/dense/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *.cè=*'
_class
loc:@main/q2/dense/kernel
ş
=main/q2/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform5main/q2/dense/kernel/Initializer/random_uniform/shape*

seed *
_output_shapes
:	B*
seed2 *
dtype0*'
_class
loc:@main/q2/dense/kernel*
T0
î
3main/q2/dense/kernel/Initializer/random_uniform/subSub3main/q2/dense/kernel/Initializer/random_uniform/max3main/q2/dense/kernel/Initializer/random_uniform/min*
T0*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
: 

3main/q2/dense/kernel/Initializer/random_uniform/mulMul=main/q2/dense/kernel/Initializer/random_uniform/RandomUniform3main/q2/dense/kernel/Initializer/random_uniform/sub*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B*
T0
ó
/main/q2/dense/kernel/Initializer/random_uniformAdd3main/q2/dense/kernel/Initializer/random_uniform/mul3main/q2/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel
³
main/q2/dense/kernel
VariableV2*'
_class
loc:@main/q2/dense/kernel*
shape:	B*
	container *
shared_name *
dtype0*
_output_shapes
:	B
è
main/q2/dense/kernel/AssignAssignmain/q2/dense/kernel/main/q2/dense/kernel/Initializer/random_uniform*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
T0*
use_locking(*
validate_shape(

main/q2/dense/kernel/readIdentitymain/q2/dense/kernel*
T0*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel

$main/q2/dense/bias/Initializer/zerosConst*
_output_shapes	
:*
dtype0*
valueB*    *%
_class
loc:@main/q2/dense/bias
§
main/q2/dense/bias
VariableV2*
shared_name *
shape:*
_output_shapes	
:*
dtype0*
	container *%
_class
loc:@main/q2/dense/bias
Ó
main/q2/dense/bias/AssignAssignmain/q2/dense/bias$main/q2/dense/bias/Initializer/zeros*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(

main/q2/dense/bias/readIdentitymain/q2/dense/bias*%
_class
loc:@main/q2/dense/bias*
T0*
_output_shapes	
:
¢
main/q2/dense/MatMulMatMulmain/q2/concatmain/q2/dense/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
transpose_b( *
transpose_a( 

main/q2/dense/BiasAddBiasAddmain/q2/dense/MatMulmain/q2/dense/bias/read*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
d
main/q2/dense/ReluRelumain/q2/dense/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
³
7main/q2/dense_1/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
valueB"  ,  *)
_class
loc:@main/q2/dense_1/kernel*
dtype0
¥
5main/q2/dense_1/kernel/Initializer/random_uniform/minConst*)
_class
loc:@main/q2/dense_1/kernel*
_output_shapes
: *
valueB
 *£½½*
dtype0
¥
5main/q2/dense_1/kernel/Initializer/random_uniform/maxConst*)
_class
loc:@main/q2/dense_1/kernel*
dtype0*
_output_shapes
: *
valueB
 *£½=

?main/q2/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q2/dense_1/kernel/Initializer/random_uniform/shape*

seed *
dtype0*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬*
seed2 *
T0
ö
5main/q2/dense_1/kernel/Initializer/random_uniform/subSub5main/q2/dense_1/kernel/Initializer/random_uniform/max5main/q2/dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@main/q2/dense_1/kernel

5main/q2/dense_1/kernel/Initializer/random_uniform/mulMul?main/q2/dense_1/kernel/Initializer/random_uniform/RandomUniform5main/q2/dense_1/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
T0
ü
1main/q2/dense_1/kernel/Initializer/random_uniformAdd5main/q2/dense_1/kernel/Initializer/random_uniform/mul5main/q2/dense_1/kernel/Initializer/random_uniform/min*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel
¹
main/q2/dense_1/kernel
VariableV2* 
_output_shapes
:
¬*
	container *
shared_name *)
_class
loc:@main/q2/dense_1/kernel*
shape:
¬*
dtype0
ñ
main/q2/dense_1/kernel/AssignAssignmain/q2/dense_1/kernel1main/q2/dense_1/kernel/Initializer/random_uniform* 
_output_shapes
:
¬*
use_locking(*
T0*)
_class
loc:@main/q2/dense_1/kernel*
validate_shape(

main/q2/dense_1/kernel/readIdentitymain/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel

&main/q2/dense_1/bias/Initializer/zerosConst*
dtype0*
valueB¬*    *'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
«
main/q2/dense_1/bias
VariableV2*
	container *
shape:¬*
shared_name *
dtype0*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
Û
main/q2/dense_1/bias/AssignAssignmain/q2/dense_1/bias&main/q2/dense_1/bias/Initializer/zeros*
validate_shape(*
T0*
use_locking(*
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias

main/q2/dense_1/bias/readIdentitymain/q2/dense_1/bias*
T0*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
ª
main/q2/dense_1/MatMulMatMulmain/q2/dense/Relumain/q2/dense_1/kernel/read*
transpose_a( *
T0*
transpose_b( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬

main/q2/dense_1/BiasAddBiasAddmain/q2/dense_1/MatMulmain/q2/dense_1/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
h
main/q2/dense_1/ReluRelumain/q2/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
³
7main/q2/dense_2/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*)
_class
loc:@main/q2/dense_2/kernel*
valueB",     
¥
5main/q2/dense_2/kernel/Initializer/random_uniform/minConst*)
_class
loc:@main/q2/dense_2/kernel*
dtype0*
_output_shapes
: *
valueB
 * ¾
¥
5main/q2/dense_2/kernel/Initializer/random_uniform/maxConst*
dtype0*
valueB
 * >*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
: 

?main/q2/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q2/dense_2/kernel/Initializer/random_uniform/shape*
seed2 *
T0*

seed *
dtype0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel
ö
5main/q2/dense_2/kernel/Initializer/random_uniform/subSub5main/q2/dense_2/kernel/Initializer/random_uniform/max5main/q2/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *)
_class
loc:@main/q2/dense_2/kernel

5main/q2/dense_2/kernel/Initializer/random_uniform/mulMul?main/q2/dense_2/kernel/Initializer/random_uniform/RandomUniform5main/q2/dense_2/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
T0
û
1main/q2/dense_2/kernel/Initializer/random_uniformAdd5main/q2/dense_2/kernel/Initializer/random_uniform/mul5main/q2/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
:	¬*
T0*)
_class
loc:@main/q2/dense_2/kernel
·
main/q2/dense_2/kernel
VariableV2*
shape:	¬*)
_class
loc:@main/q2/dense_2/kernel*
shared_name *
	container *
dtype0*
_output_shapes
:	¬
ğ
main/q2/dense_2/kernel/AssignAssignmain/q2/dense_2/kernel1main/q2/dense_2/kernel/Initializer/random_uniform*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
T0*
use_locking(

main/q2/dense_2/kernel/readIdentitymain/q2/dense_2/kernel*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
T0

&main/q2/dense_2/bias/Initializer/zerosConst*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
dtype0*
valueB*    
©
main/q2/dense_2/bias
VariableV2*'
_class
loc:@main/q2/dense_2/bias*
shared_name *
_output_shapes
:*
	container *
dtype0*
shape:
Ú
main/q2/dense_2/bias/AssignAssignmain/q2/dense_2/bias&main/q2/dense_2/bias/Initializer/zeros*'
_class
loc:@main/q2/dense_2/bias*
use_locking(*
_output_shapes
:*
validate_shape(*
T0

main/q2/dense_2/bias/readIdentitymain/q2/dense_2/bias*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
T0
«
main/q2/dense_2/MatMulMatMulmain/q2/dense_1/Relumain/q2/dense_2/kernel/read*
T0*
transpose_a( *
transpose_b( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

main/q2/dense_2/BiasAddBiasAddmain/q2/dense_2/MatMulmain/q2/dense_2/bias/read*
data_formatNHWC*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
x
main/q2/SqueezeSqueezemain/q2/dense_2/BiasAdd*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
*
T0
`
main/q2_1/concat/axisConst*
dtype0*
_output_shapes
: *
valueB :
ÿÿÿÿÿÿÿÿÿ

main/q2_1/concatConcatV2Placeholder_1
main/mul_1main/q2_1/concat/axis*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*

Tidx0
¦
main/q2_1/dense/MatMulMatMulmain/q2_1/concatmain/q2/dense/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b( *
T0*
transpose_a( 

main/q2_1/dense/BiasAddBiasAddmain/q2_1/dense/MatMulmain/q2/dense/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
h
main/q2_1/dense/ReluRelumain/q2_1/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
®
main/q2_1/dense_1/MatMulMatMulmain/q2_1/dense/Relumain/q2/dense_1/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0*
transpose_b( *
transpose_a( 
£
main/q2_1/dense_1/BiasAddBiasAddmain/q2_1/dense_1/MatMulmain/q2/dense_1/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
l
main/q2_1/dense_1/ReluRelumain/q2_1/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
¯
main/q2_1/dense_2/MatMulMatMulmain/q2_1/dense_1/Relumain/q2/dense_2/kernel/read*
transpose_b( *
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_a( 
¢
main/q2_1/dense_2/BiasAddBiasAddmain/q2_1/dense_2/MatMulmain/q2/dense_2/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
data_formatNHWC*
T0
|
main/q2_1/SqueezeSqueezemain/q2_1/dense_2/BiasAdd*
squeeze_dims
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
­
4main/v/dense/kernel/Initializer/random_uniform/shapeConst*&
_class
loc:@main/v/dense/kernel*
valueB"6     *
_output_shapes
:*
dtype0

2main/v/dense/kernel/Initializer/random_uniform/minConst*
valueB
 *Hpë½*&
_class
loc:@main/v/dense/kernel*
dtype0*
_output_shapes
: 

2main/v/dense/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *Hpë=*&
_class
loc:@main/v/dense/kernel
û
<main/v/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4main/v/dense/kernel/Initializer/random_uniform/shape*&
_class
loc:@main/v/dense/kernel*
T0*
seed2 *
dtype0*

seed *
_output_shapes
:	6
ê
2main/v/dense/kernel/Initializer/random_uniform/subSub2main/v/dense/kernel/Initializer/random_uniform/max2main/v/dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*&
_class
loc:@main/v/dense/kernel
ı
2main/v/dense/kernel/Initializer/random_uniform/mulMul<main/v/dense/kernel/Initializer/random_uniform/RandomUniform2main/v/dense/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel
ï
.main/v/dense/kernel/Initializer/random_uniformAdd2main/v/dense/kernel/Initializer/random_uniform/mul2main/v/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel
±
main/v/dense/kernel
VariableV2*
shared_name *
	container *&
_class
loc:@main/v/dense/kernel*
shape:	6*
dtype0*
_output_shapes
:	6
ä
main/v/dense/kernel/AssignAssignmain/v/dense/kernel.main/v/dense/kernel/Initializer/random_uniform*
T0*
_output_shapes
:	6*
use_locking(*
validate_shape(*&
_class
loc:@main/v/dense/kernel

main/v/dense/kernel/readIdentitymain/v/dense/kernel*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6*
T0

#main/v/dense/bias/Initializer/zerosConst*$
_class
loc:@main/v/dense/bias*
valueB*    *
dtype0*
_output_shapes	
:
¥
main/v/dense/bias
VariableV2*
dtype0*$
_class
loc:@main/v/dense/bias*
shape:*
	container *
_output_shapes	
:*
shared_name 
Ï
main/v/dense/bias/AssignAssignmain/v/dense/bias#main/v/dense/bias/Initializer/zeros*
use_locking(*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
validate_shape(*
T0

main/v/dense/bias/readIdentitymain/v/dense/bias*
T0*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:

main/v/dense/MatMulMatMulPlaceholder_1main/v/dense/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_a( *
transpose_b( *
T0

main/v/dense/BiasAddBiasAddmain/v/dense/MatMulmain/v/dense/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
b
main/v/dense/ReluRelumain/v/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
±
6main/v/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"  ,  *
dtype0*(
_class
loc:@main/v/dense_1/kernel*
_output_shapes
:
£
4main/v/dense_1/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
dtype0*(
_class
loc:@main/v/dense_1/kernel*
valueB
 *£½½
£
4main/v/dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *£½=*
dtype0*
_output_shapes
: *(
_class
loc:@main/v/dense_1/kernel

>main/v/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6main/v/dense_1/kernel/Initializer/random_uniform/shape* 
_output_shapes
:
¬*
dtype0*(
_class
loc:@main/v/dense_1/kernel*

seed *
T0*
seed2 
ò
4main/v/dense_1/kernel/Initializer/random_uniform/subSub4main/v/dense_1/kernel/Initializer/random_uniform/max4main/v/dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *(
_class
loc:@main/v/dense_1/kernel*
T0

4main/v/dense_1/kernel/Initializer/random_uniform/mulMul>main/v/dense_1/kernel/Initializer/random_uniform/RandomUniform4main/v/dense_1/kernel/Initializer/random_uniform/sub*
T0* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel
ø
0main/v/dense_1/kernel/Initializer/random_uniformAdd4main/v/dense_1/kernel/Initializer/random_uniform/mul4main/v/dense_1/kernel/Initializer/random_uniform/min*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
·
main/v/dense_1/kernel
VariableV2*
dtype0* 
_output_shapes
:
¬*
shared_name *
	container *
shape:
¬*(
_class
loc:@main/v/dense_1/kernel
í
main/v/dense_1/kernel/AssignAssignmain/v/dense_1/kernel0main/v/dense_1/kernel/Initializer/random_uniform* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*(
_class
loc:@main/v/dense_1/kernel*
T0

main/v/dense_1/kernel/readIdentitymain/v/dense_1/kernel*
T0*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬

%main/v/dense_1/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias*
valueB¬*    
©
main/v/dense_1/bias
VariableV2*
shared_name *
dtype0*
	container *&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
shape:¬
×
main/v/dense_1/bias/AssignAssignmain/v/dense_1/bias%main/v/dense_1/bias/Initializer/zeros*
_output_shapes	
:¬*
use_locking(*
T0*
validate_shape(*&
_class
loc:@main/v/dense_1/bias

main/v/dense_1/bias/readIdentitymain/v/dense_1/bias*&
_class
loc:@main/v/dense_1/bias*
T0*
_output_shapes	
:¬
§
main/v/dense_1/MatMulMatMulmain/v/dense/Relumain/v/dense_1/kernel/read*
T0*
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
transpose_b( 

main/v/dense_1/BiasAddBiasAddmain/v/dense_1/MatMulmain/v/dense_1/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
data_formatNHWC*
T0
f
main/v/dense_1/ReluRelumain/v/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
±
6main/v/dense_2/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@main/v/dense_2/kernel*
valueB",     *
dtype0*
_output_shapes
:
£
4main/v/dense_2/kernel/Initializer/random_uniform/minConst*
valueB
 * ¾*
dtype0*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
: 
£
4main/v/dense_2/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
: *
valueB
 * >*
dtype0

>main/v/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6main/v/dense_2/kernel/Initializer/random_uniform/shape*
dtype0*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
seed2 *

seed *
T0
ò
4main/v/dense_2/kernel/Initializer/random_uniform/subSub4main/v/dense_2/kernel/Initializer/random_uniform/max4main/v/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
: 

4main/v/dense_2/kernel/Initializer/random_uniform/mulMul>main/v/dense_2/kernel/Initializer/random_uniform/RandomUniform4main/v/dense_2/kernel/Initializer/random_uniform/sub*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
T0
÷
0main/v/dense_2/kernel/Initializer/random_uniformAdd4main/v/dense_2/kernel/Initializer/random_uniform/mul4main/v/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel
µ
main/v/dense_2/kernel
VariableV2*
shared_name *
dtype0*
_output_shapes
:	¬*
shape:	¬*
	container *(
_class
loc:@main/v/dense_2/kernel
ì
main/v/dense_2/kernel/AssignAssignmain/v/dense_2/kernel0main/v/dense_2/kernel/Initializer/random_uniform*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(*
T0

main/v/dense_2/kernel/readIdentitymain/v/dense_2/kernel*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
T0

%main/v/dense_2/bias/Initializer/zerosConst*
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias*
valueB*    *
dtype0
§
main/v/dense_2/bias
VariableV2*&
_class
loc:@main/v/dense_2/bias*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Ö
main/v/dense_2/bias/AssignAssignmain/v/dense_2/bias%main/v/dense_2/bias/Initializer/zeros*
validate_shape(*
T0*
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias*
use_locking(

main/v/dense_2/bias/readIdentitymain/v/dense_2/bias*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
T0
¨
main/v/dense_2/MatMulMatMulmain/v/dense_1/Relumain/v/dense_2/kernel/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
transpose_a( *
transpose_b( 

main/v/dense_2/BiasAddBiasAddmain/v/dense_2/MatMulmain/v/dense_2/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
data_formatNHWC*
T0
v
main/v/SqueezeSqueezemain/v/dense_2/BiasAdd*
squeeze_dims
*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
³
7target/pi/dense/kernel/Initializer/random_uniform/shapeConst*
valueB"6     *)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:*
dtype0
¥
5target/pi/dense/kernel/Initializer/random_uniform/minConst*
valueB
 *Hpë½*
_output_shapes
: *
dtype0*)
_class
loc:@target/pi/dense/kernel
¥
5target/pi/dense/kernel/Initializer/random_uniform/maxConst*
valueB
 *Hpë=*
dtype0*
_output_shapes
: *)
_class
loc:@target/pi/dense/kernel

?target/pi/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform7target/pi/dense/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*
_output_shapes
:	6*

seed *
T0*)
_class
loc:@target/pi/dense/kernel
ö
5target/pi/dense/kernel/Initializer/random_uniform/subSub5target/pi/dense/kernel/Initializer/random_uniform/max5target/pi/dense/kernel/Initializer/random_uniform/min*)
_class
loc:@target/pi/dense/kernel*
T0*
_output_shapes
: 

5target/pi/dense/kernel/Initializer/random_uniform/mulMul?target/pi/dense/kernel/Initializer/random_uniform/RandomUniform5target/pi/dense/kernel/Initializer/random_uniform/sub*
_output_shapes
:	6*)
_class
loc:@target/pi/dense/kernel*
T0
û
1target/pi/dense/kernel/Initializer/random_uniformAdd5target/pi/dense/kernel/Initializer/random_uniform/mul5target/pi/dense/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:	6
·
target/pi/dense/kernel
VariableV2*
_output_shapes
:	6*
dtype0*)
_class
loc:@target/pi/dense/kernel*
shared_name *
	container *
shape:	6
ğ
target/pi/dense/kernel/AssignAssigntarget/pi/dense/kernel1target/pi/dense/kernel/Initializer/random_uniform*
use_locking(*
_output_shapes
:	6*)
_class
loc:@target/pi/dense/kernel*
T0*
validate_shape(

target/pi/dense/kernel/readIdentitytarget/pi/dense/kernel*
T0*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:	6

&target/pi/dense/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:*'
_class
loc:@target/pi/dense/bias*
valueB*    
«
target/pi/dense/bias
VariableV2*
_output_shapes	
:*'
_class
loc:@target/pi/dense/bias*
shape:*
shared_name *
dtype0*
	container 
Û
target/pi/dense/bias/AssignAssigntarget/pi/dense/bias&target/pi/dense/bias/Initializer/zeros*
use_locking(*
validate_shape(*'
_class
loc:@target/pi/dense/bias*
T0*
_output_shapes	
:

target/pi/dense/bias/readIdentitytarget/pi/dense/bias*
T0*
_output_shapes	
:*'
_class
loc:@target/pi/dense/bias
¥
target/pi/dense/MatMulMatMulPlaceholder_3target/pi/dense/kernel/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b( *
transpose_a( 

target/pi/dense/BiasAddBiasAddtarget/pi/dense/MatMultarget/pi/dense/bias/read*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
h
target/pi/dense/ReluRelutarget/pi/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
·
9target/pi/dense_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"  ,  *+
_class!
loc:@target/pi/dense_1/kernel
©
7target/pi/dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*+
_class!
loc:@target/pi/dense_1/kernel*
valueB
 *£½½*
_output_shapes
: 
©
7target/pi/dense_1/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *£½=*+
_class!
loc:@target/pi/dense_1/kernel

Atarget/pi/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/pi/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
T0* 
_output_shapes
:
¬*+
_class!
loc:@target/pi/dense_1/kernel*
seed2 *

seed 
ş
7target/pi/dense_1/kernel/Initializer/random_uniform/subSub7target/pi/dense_1/kernel/Initializer/random_uniform/max7target/pi/dense_1/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/pi/dense_1/kernel*
_output_shapes
: 

7target/pi/dense_1/kernel/Initializer/random_uniform/mulMulAtarget/pi/dense_1/kernel/Initializer/random_uniform/RandomUniform7target/pi/dense_1/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@target/pi/dense_1/kernel* 
_output_shapes
:
¬

3target/pi/dense_1/kernel/Initializer/random_uniformAdd7target/pi/dense_1/kernel/Initializer/random_uniform/mul7target/pi/dense_1/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/pi/dense_1/kernel*
T0* 
_output_shapes
:
¬
½
target/pi/dense_1/kernel
VariableV2* 
_output_shapes
:
¬*
	container *
shared_name *+
_class!
loc:@target/pi/dense_1/kernel*
dtype0*
shape:
¬
ù
target/pi/dense_1/kernel/AssignAssigntarget/pi/dense_1/kernel3target/pi/dense_1/kernel/Initializer/random_uniform*+
_class!
loc:@target/pi/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*
T0

target/pi/dense_1/kernel/readIdentitytarget/pi/dense_1/kernel*
T0*+
_class!
loc:@target/pi/dense_1/kernel* 
_output_shapes
:
¬
¢
(target/pi/dense_1/bias/Initializer/zerosConst*
valueB¬*    *)
_class
loc:@target/pi/dense_1/bias*
_output_shapes	
:¬*
dtype0
¯
target/pi/dense_1/bias
VariableV2*
shape:¬*)
_class
loc:@target/pi/dense_1/bias*
shared_name *
	container *
dtype0*
_output_shapes	
:¬
ã
target/pi/dense_1/bias/AssignAssigntarget/pi/dense_1/bias(target/pi/dense_1/bias/Initializer/zeros*
_output_shapes	
:¬*
validate_shape(*
use_locking(*
T0*)
_class
loc:@target/pi/dense_1/bias

target/pi/dense_1/bias/readIdentitytarget/pi/dense_1/bias*
_output_shapes	
:¬*)
_class
loc:@target/pi/dense_1/bias*
T0
°
target/pi/dense_1/MatMulMatMultarget/pi/dense/Relutarget/pi/dense_1/kernel/read*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
¥
target/pi/dense_1/BiasAddBiasAddtarget/pi/dense_1/MatMultarget/pi/dense_1/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
l
target/pi/dense_1/ReluRelutarget/pi/dense_1/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
·
9target/pi/dense_2/kernel/Initializer/random_uniform/shapeConst*
dtype0*
valueB",     *+
_class!
loc:@target/pi/dense_2/kernel*
_output_shapes
:
©
7target/pi/dense_2/kernel/Initializer/random_uniform/minConst*
valueB
 *Õ ¾*+
_class!
loc:@target/pi/dense_2/kernel*
_output_shapes
: *
dtype0
©
7target/pi/dense_2/kernel/Initializer/random_uniform/maxConst*
dtype0*
valueB
 *Õ >*
_output_shapes
: *+
_class!
loc:@target/pi/dense_2/kernel

Atarget/pi/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/pi/dense_2/kernel/Initializer/random_uniform/shape*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel*
seed2 *
dtype0*
T0*

seed 
ş
7target/pi/dense_2/kernel/Initializer/random_uniform/subSub7target/pi/dense_2/kernel/Initializer/random_uniform/max7target/pi/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*+
_class!
loc:@target/pi/dense_2/kernel

7target/pi/dense_2/kernel/Initializer/random_uniform/mulMulAtarget/pi/dense_2/kernel/Initializer/random_uniform/RandomUniform7target/pi/dense_2/kernel/Initializer/random_uniform/sub*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/pi/dense_2/kernel

3target/pi/dense_2/kernel/Initializer/random_uniformAdd7target/pi/dense_2/kernel/Initializer/random_uniform/mul7target/pi/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel
»
target/pi/dense_2/kernel
VariableV2*
dtype0*
shape:	¬*
	container *
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel*
shared_name 
ø
target/pi/dense_2/kernel/AssignAssigntarget/pi/dense_2/kernel3target/pi/dense_2/kernel/Initializer/random_uniform*
T0*
use_locking(*+
_class!
loc:@target/pi/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬

target/pi/dense_2/kernel/readIdentitytarget/pi/dense_2/kernel*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/pi/dense_2/kernel
 
(target/pi/dense_2/bias/Initializer/zerosConst*
_output_shapes
:*
valueB*    *)
_class
loc:@target/pi/dense_2/bias*
dtype0
­
target/pi/dense_2/bias
VariableV2*
shape:*)
_class
loc:@target/pi/dense_2/bias*
_output_shapes
:*
dtype0*
	container *
shared_name 
â
target/pi/dense_2/bias/AssignAssigntarget/pi/dense_2/bias(target/pi/dense_2/bias/Initializer/zeros*
T0*
validate_shape(*)
_class
loc:@target/pi/dense_2/bias*
_output_shapes
:*
use_locking(

target/pi/dense_2/bias/readIdentitytarget/pi/dense_2/bias*
_output_shapes
:*)
_class
loc:@target/pi/dense_2/bias*
T0
±
target/pi/dense_2/MatMulMatMultarget/pi/dense_1/Relutarget/pi/dense_2/kernel/read*
transpose_a( *
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b( 
¤
target/pi/dense_2/BiasAddBiasAddtarget/pi/dense_2/MatMultarget/pi/dense_2/bias/read*
data_formatNHWC*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
·
9target/pi/dense_3/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*+
_class!
loc:@target/pi/dense_3/kernel*
valueB",     *
dtype0
©
7target/pi/dense_3/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *Õ ¾*+
_class!
loc:@target/pi/dense_3/kernel
©
7target/pi/dense_3/kernel/Initializer/random_uniform/maxConst*+
_class!
loc:@target/pi/dense_3/kernel*
dtype0*
_output_shapes
: *
valueB
 *Õ >

Atarget/pi/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/pi/dense_3/kernel/Initializer/random_uniform/shape*

seed *
seed2 *+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
:	¬*
dtype0*
T0
ş
7target/pi/dense_3/kernel/Initializer/random_uniform/subSub7target/pi/dense_3/kernel/Initializer/random_uniform/max7target/pi/dense_3/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/pi/dense_3/kernel*
T0*
_output_shapes
: 

7target/pi/dense_3/kernel/Initializer/random_uniform/mulMulAtarget/pi/dense_3/kernel/Initializer/random_uniform/RandomUniform7target/pi/dense_3/kernel/Initializer/random_uniform/sub*+
_class!
loc:@target/pi/dense_3/kernel*
T0*
_output_shapes
:	¬

3target/pi/dense_3/kernel/Initializer/random_uniformAdd7target/pi/dense_3/kernel/Initializer/random_uniform/mul7target/pi/dense_3/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
:	¬
»
target/pi/dense_3/kernel
VariableV2*+
_class!
loc:@target/pi/dense_3/kernel*
dtype0*
	container *
shape:	¬*
shared_name *
_output_shapes
:	¬
ø
target/pi/dense_3/kernel/AssignAssigntarget/pi/dense_3/kernel3target/pi/dense_3/kernel/Initializer/random_uniform*+
_class!
loc:@target/pi/dense_3/kernel*
validate_shape(*
T0*
_output_shapes
:	¬*
use_locking(

target/pi/dense_3/kernel/readIdentitytarget/pi/dense_3/kernel*+
_class!
loc:@target/pi/dense_3/kernel*
T0*
_output_shapes
:	¬
 
(target/pi/dense_3/bias/Initializer/zerosConst*
_output_shapes
:*)
_class
loc:@target/pi/dense_3/bias*
dtype0*
valueB*    
­
target/pi/dense_3/bias
VariableV2*
shared_name *)
_class
loc:@target/pi/dense_3/bias*
_output_shapes
:*
	container *
shape:*
dtype0
â
target/pi/dense_3/bias/AssignAssigntarget/pi/dense_3/bias(target/pi/dense_3/bias/Initializer/zeros*
_output_shapes
:*
use_locking(*
T0*)
_class
loc:@target/pi/dense_3/bias*
validate_shape(

target/pi/dense_3/bias/readIdentitytarget/pi/dense_3/bias*
_output_shapes
:*
T0*)
_class
loc:@target/pi/dense_3/bias
±
target/pi/dense_3/MatMulMatMultarget/pi/dense_1/Relutarget/pi/dense_3/kernel/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
transpose_b( *
transpose_a( 
¤
target/pi/dense_3/BiasAddBiasAddtarget/pi/dense_3/MatMultarget/pi/dense_3/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
k
target/pi/dense_3/TanhTanhtarget/pi/dense_3/BiasAdd*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
target/pi/add/yConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
q
target/pi/addAddV2target/pi/dense_3/Tanhtarget/pi/add/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
target/pi/mul/xConst*
valueB
 *  0A*
dtype0*
_output_shapes
: 
f
target/pi/mulMultarget/pi/mul/xtarget/pi/add*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
V
target/pi/add_1/xConst*
dtype0*
valueB
 *   Á*
_output_shapes
: 
l
target/pi/add_1AddV2target/pi/add_1/xtarget/pi/mul*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
W
target/pi/ExpExptarget/pi/add_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
h
target/pi/ShapeShapetarget/pi/dense_2/BiasAdd*
_output_shapes
:*
out_type0*
T0
a
target/pi/random_normal/meanConst*
_output_shapes
: *
dtype0*
valueB
 *    
c
target/pi/random_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
­
,target/pi/random_normal/RandomStandardNormalRandomStandardNormaltarget/pi/Shape*
seed2 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

seed *
T0*
dtype0
¢
target/pi/random_normal/mulMul,target/pi/random_normal/RandomStandardNormaltarget/pi/random_normal/stddev*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

target/pi/random_normalAddtarget/pi/random_normal/multarget/pi/random_normal/mean*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
p
target/pi/mul_1Multarget/pi/random_normaltarget/pi/Exp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
v
target/pi/add_2AddV2target/pi/dense_2/BiasAddtarget/pi/mul_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
r
target/pi/subSubtarget/pi/add_2target/pi/dense_2/BiasAdd*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Y
target/pi/Exp_1Exptarget/pi/add_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
V
target/pi/add_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *wÌ+2
n
target/pi/add_3AddV2target/pi/Exp_1target/pi/add_3/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
n
target/pi/truedivRealDivtarget/pi/subtarget/pi/add_3*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
T
target/pi/pow/yConst*
valueB
 *   @*
_output_shapes
: *
dtype0
j
target/pi/powPowtarget/pi/truedivtarget/pi/pow/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
V
target/pi/mul_2/xConst*
dtype0*
valueB
 *   @*
_output_shapes
: 
l
target/pi/mul_2Multarget/pi/mul_2/xtarget/pi/add_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
j
target/pi/add_4AddV2target/pi/powtarget/pi/mul_2*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
V
target/pi/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *?ë?
n
target/pi/add_5AddV2target/pi/add_4target/pi/add_5/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
V
target/pi/mul_3/xConst*
_output_shapes
: *
valueB
 *   ¿*
dtype0
l
target/pi/mul_3Multarget/pi/mul_3/xtarget/pi/add_5*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
a
target/pi/Sum/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

target/pi/SumSumtarget/pi/mul_3target/pi/Sum/reduction_indices*
T0*
	keep_dims( *

Tidx0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
c
target/pi/TanhTanhtarget/pi/dense_2/BiasAdd*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
[
target/pi/Tanh_1Tanhtarget/pi/add_2*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
V
target/pi/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
m
target/pi/pow_1Powtarget/pi/Tanh_1target/pi/pow_1/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
V
target/pi/sub_1/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
l
target/pi/sub_1Subtarget/pi/sub_1/xtarget/pi/pow_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
X
target/pi/Greater/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
t
target/pi/GreaterGreatertarget/pi/sub_1target/pi/Greater/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
z
target/pi/CastCasttarget/pi/Greater*

DstT0*
Truncate( *

SrcT0
*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
U
target/pi/Less/yConst*
valueB
 *    *
_output_shapes
: *
dtype0
k
target/pi/LessLesstarget/pi/sub_1target/pi/Less/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
y
target/pi/Cast_1Casttarget/pi/Less*

DstT0*
Truncate( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

SrcT0

V
target/pi/sub_2/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
l
target/pi/sub_2Subtarget/pi/sub_2/xtarget/pi/sub_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
i
target/pi/mul_4Multarget/pi/sub_2target/pi/Cast*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
V
target/pi/sub_3/xConst*
dtype0*
valueB
 *    *
_output_shapes
: 
l
target/pi/sub_3Subtarget/pi/sub_3/xtarget/pi/sub_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
k
target/pi/mul_5Multarget/pi/sub_3target/pi/Cast_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
l
target/pi/add_6AddV2target/pi/mul_4target/pi/mul_5*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
i
target/pi/StopGradientStopGradienttarget/pi/add_6*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
s
target/pi/add_7AddV2target/pi/sub_1target/pi/StopGradient*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
V
target/pi/add_8/yConst*
dtype0*
_output_shapes
: *
valueB
 *½75
n
target/pi/add_8AddV2target/pi/add_7target/pi/add_8/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
W
target/pi/LogLogtarget/pi/add_8*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
c
!target/pi/Sum_1/reduction_indicesConst*
dtype0*
value	B :*
_output_shapes
: 

target/pi/Sum_1Sumtarget/pi/Log!target/pi/Sum_1/reduction_indices*
	keep_dims( *

Tidx0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
d
target/pi/sub_4Subtarget/pi/Sumtarget/pi/Sum_1*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Q
target/mul/yConst*
valueB
 *  ?*
_output_shapes
: *
dtype0
a

target/mulMultarget/pi/Tanhtarget/mul/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
S
target/mul_1/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
g
target/mul_1Multarget/pi/Tanh_1target/mul_1/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
`
target/q1/concat/axisConst*
valueB :
ÿÿÿÿÿÿÿÿÿ*
_output_shapes
: *
dtype0

target/q1/concatConcatV2Placeholder_3Placeholder_2target/q1/concat/axis*
N*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*

Tidx0*
T0
³
7target/q1/dense/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:*
dtype0*
valueB"B     
¥
5target/q1/dense/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *.cè½*)
_class
loc:@target/q1/dense/kernel
¥
5target/q1/dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *)
_class
loc:@target/q1/dense/kernel*
valueB
 *.cè=*
dtype0

?target/q1/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform7target/q1/dense/kernel/Initializer/random_uniform/shape*

seed *
_output_shapes
:	B*
dtype0*
T0*)
_class
loc:@target/q1/dense/kernel*
seed2 
ö
5target/q1/dense/kernel/Initializer/random_uniform/subSub5target/q1/dense/kernel/Initializer/random_uniform/max5target/q1/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *)
_class
loc:@target/q1/dense/kernel

5target/q1/dense/kernel/Initializer/random_uniform/mulMul?target/q1/dense/kernel/Initializer/random_uniform/RandomUniform5target/q1/dense/kernel/Initializer/random_uniform/sub*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:	B*
T0
û
1target/q1/dense/kernel/Initializer/random_uniformAdd5target/q1/dense/kernel/Initializer/random_uniform/mul5target/q1/dense/kernel/Initializer/random_uniform/min*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:	B*
T0
·
target/q1/dense/kernel
VariableV2*
_output_shapes
:	B*
shape:	B*)
_class
loc:@target/q1/dense/kernel*
	container *
dtype0*
shared_name 
ğ
target/q1/dense/kernel/AssignAssigntarget/q1/dense/kernel1target/q1/dense/kernel/Initializer/random_uniform*
use_locking(*)
_class
loc:@target/q1/dense/kernel*
T0*
validate_shape(*
_output_shapes
:	B

target/q1/dense/kernel/readIdentitytarget/q1/dense/kernel*
T0*
_output_shapes
:	B*)
_class
loc:@target/q1/dense/kernel

&target/q1/dense/bias/Initializer/zerosConst*
_output_shapes	
:*
valueB*    *
dtype0*'
_class
loc:@target/q1/dense/bias
«
target/q1/dense/bias
VariableV2*
_output_shapes	
:*
shared_name *
dtype0*'
_class
loc:@target/q1/dense/bias*
	container *
shape:
Û
target/q1/dense/bias/AssignAssigntarget/q1/dense/bias&target/q1/dense/bias/Initializer/zeros*
T0*
validate_shape(*
use_locking(*'
_class
loc:@target/q1/dense/bias*
_output_shapes	
:

target/q1/dense/bias/readIdentitytarget/q1/dense/bias*
_output_shapes	
:*'
_class
loc:@target/q1/dense/bias*
T0
¨
target/q1/dense/MatMulMatMultarget/q1/concattarget/q1/dense/kernel/read*
transpose_a( *
T0*
transpose_b( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

target/q1/dense/BiasAddBiasAddtarget/q1/dense/MatMultarget/q1/dense/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
h
target/q1/dense/ReluRelutarget/q1/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
·
9target/q1/dense_1/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
dtype0*+
_class!
loc:@target/q1/dense_1/kernel*
valueB"  ,  
©
7target/q1/dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 *£½½*+
_class!
loc:@target/q1/dense_1/kernel*
_output_shapes
: 
©
7target/q1/dense_1/kernel/Initializer/random_uniform/maxConst*
dtype0*
valueB
 *£½=*
_output_shapes
: *+
_class!
loc:@target/q1/dense_1/kernel

Atarget/q1/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q1/dense_1/kernel/Initializer/random_uniform/shape*
seed2 *

seed *
dtype0*
T0* 
_output_shapes
:
¬*+
_class!
loc:@target/q1/dense_1/kernel
ş
7target/q1/dense_1/kernel/Initializer/random_uniform/subSub7target/q1/dense_1/kernel/Initializer/random_uniform/max7target/q1/dense_1/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/q1/dense_1/kernel*
_output_shapes
: 

7target/q1/dense_1/kernel/Initializer/random_uniform/mulMulAtarget/q1/dense_1/kernel/Initializer/random_uniform/RandomUniform7target/q1/dense_1/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/q1/dense_1/kernel

3target/q1/dense_1/kernel/Initializer/random_uniformAdd7target/q1/dense_1/kernel/Initializer/random_uniform/mul7target/q1/dense_1/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬*
T0
½
target/q1/dense_1/kernel
VariableV2*
	container *
shape:
¬*+
_class!
loc:@target/q1/dense_1/kernel*
shared_name *
dtype0* 
_output_shapes
:
¬
ù
target/q1/dense_1/kernel/AssignAssigntarget/q1/dense_1/kernel3target/q1/dense_1/kernel/Initializer/random_uniform*
validate_shape(*
use_locking(*
T0*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬

target/q1/dense_1/kernel/readIdentitytarget/q1/dense_1/kernel*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬*
T0
¢
(target/q1/dense_1/bias/Initializer/zerosConst*
_output_shapes	
:¬*
dtype0*)
_class
loc:@target/q1/dense_1/bias*
valueB¬*    
¯
target/q1/dense_1/bias
VariableV2*)
_class
loc:@target/q1/dense_1/bias*
shared_name *
_output_shapes	
:¬*
dtype0*
shape:¬*
	container 
ã
target/q1/dense_1/bias/AssignAssigntarget/q1/dense_1/bias(target/q1/dense_1/bias/Initializer/zeros*
T0*)
_class
loc:@target/q1/dense_1/bias*
_output_shapes	
:¬*
validate_shape(*
use_locking(

target/q1/dense_1/bias/readIdentitytarget/q1/dense_1/bias*
_output_shapes	
:¬*
T0*)
_class
loc:@target/q1/dense_1/bias
°
target/q1/dense_1/MatMulMatMultarget/q1/dense/Relutarget/q1/dense_1/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0*
transpose_a( *
transpose_b( 
¥
target/q1/dense_1/BiasAddBiasAddtarget/q1/dense_1/MatMultarget/q1/dense_1/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
data_formatNHWC*
T0
l
target/q1/dense_1/ReluRelutarget/q1/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
·
9target/q1/dense_2/kernel/Initializer/random_uniform/shapeConst*
valueB",     *+
_class!
loc:@target/q1/dense_2/kernel*
dtype0*
_output_shapes
:
©
7target/q1/dense_2/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@target/q1/dense_2/kernel*
dtype0*
valueB
 * ¾*
_output_shapes
: 
©
7target/q1/dense_2/kernel/Initializer/random_uniform/maxConst*
valueB
 * >*
dtype0*
_output_shapes
: *+
_class!
loc:@target/q1/dense_2/kernel

Atarget/q1/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q1/dense_2/kernel/Initializer/random_uniform/shape*
dtype0*+
_class!
loc:@target/q1/dense_2/kernel*
T0*
_output_shapes
:	¬*
seed2 *

seed 
ş
7target/q1/dense_2/kernel/Initializer/random_uniform/subSub7target/q1/dense_2/kernel/Initializer/random_uniform/max7target/q1/dense_2/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
: *
T0

7target/q1/dense_2/kernel/Initializer/random_uniform/mulMulAtarget/q1/dense_2/kernel/Initializer/random_uniform/RandomUniform7target/q1/dense_2/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
:	¬

3target/q1/dense_2/kernel/Initializer/random_uniformAdd7target/q1/dense_2/kernel/Initializer/random_uniform/mul7target/q1/dense_2/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q1/dense_2/kernel*
T0*
_output_shapes
:	¬
»
target/q1/dense_2/kernel
VariableV2*
shape:	¬*
dtype0*
_output_shapes
:	¬*+
_class!
loc:@target/q1/dense_2/kernel*
	container *
shared_name 
ø
target/q1/dense_2/kernel/AssignAssigntarget/q1/dense_2/kernel3target/q1/dense_2/kernel/Initializer/random_uniform*
use_locking(*
_output_shapes
:	¬*
validate_shape(*
T0*+
_class!
loc:@target/q1/dense_2/kernel

target/q1/dense_2/kernel/readIdentitytarget/q1/dense_2/kernel*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/q1/dense_2/kernel
 
(target/q1/dense_2/bias/Initializer/zerosConst*
valueB*    *)
_class
loc:@target/q1/dense_2/bias*
dtype0*
_output_shapes
:
­
target/q1/dense_2/bias
VariableV2*
_output_shapes
:*
shape:*
	container *
dtype0*)
_class
loc:@target/q1/dense_2/bias*
shared_name 
â
target/q1/dense_2/bias/AssignAssigntarget/q1/dense_2/bias(target/q1/dense_2/bias/Initializer/zeros*
use_locking(*
_output_shapes
:*
T0*
validate_shape(*)
_class
loc:@target/q1/dense_2/bias

target/q1/dense_2/bias/readIdentitytarget/q1/dense_2/bias*
T0*
_output_shapes
:*)
_class
loc:@target/q1/dense_2/bias
±
target/q1/dense_2/MatMulMatMultarget/q1/dense_1/Relutarget/q1/dense_2/kernel/read*
transpose_a( *
transpose_b( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¤
target/q1/dense_2/BiasAddBiasAddtarget/q1/dense_2/MatMultarget/q1/dense_2/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
|
target/q1/SqueezeSqueezetarget/q1/dense_2/BiasAdd*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims

b
target/q1_1/concat/axisConst*
valueB :
ÿÿÿÿÿÿÿÿÿ*
_output_shapes
: *
dtype0

target/q1_1/concatConcatV2Placeholder_3target/mul_1target/q1_1/concat/axis*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
N*
T0*

Tidx0
¬
target/q1_1/dense/MatMulMatMultarget/q1_1/concattarget/q1/dense/kernel/read*
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
transpose_b( 
£
target/q1_1/dense/BiasAddBiasAddtarget/q1_1/dense/MatMultarget/q1/dense/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
l
target/q1_1/dense/ReluRelutarget/q1_1/dense/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
´
target/q1_1/dense_1/MatMulMatMultarget/q1_1/dense/Relutarget/q1/dense_1/kernel/read*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
©
target/q1_1/dense_1/BiasAddBiasAddtarget/q1_1/dense_1/MatMultarget/q1/dense_1/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
data_formatNHWC*
T0
p
target/q1_1/dense_1/ReluRelutarget/q1_1/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
µ
target/q1_1/dense_2/MatMulMatMultarget/q1_1/dense_1/Relutarget/q1/dense_2/kernel/read*
T0*
transpose_a( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b( 
¨
target/q1_1/dense_2/BiasAddBiasAddtarget/q1_1/dense_2/MatMultarget/q1/dense_2/bias/read*
data_formatNHWC*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

target/q1_1/SqueezeSqueezetarget/q1_1/dense_2/BiasAdd*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
*
T0
`
target/q2/concat/axisConst*
valueB :
ÿÿÿÿÿÿÿÿÿ*
_output_shapes
: *
dtype0

target/q2/concatConcatV2Placeholder_3Placeholder_2target/q2/concat/axis*
N*

Tidx0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
T0
³
7target/q2/dense/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"B     *)
_class
loc:@target/q2/dense/kernel
¥
5target/q2/dense/kernel/Initializer/random_uniform/minConst*)
_class
loc:@target/q2/dense/kernel*
valueB
 *.cè½*
_output_shapes
: *
dtype0
¥
5target/q2/dense/kernel/Initializer/random_uniform/maxConst*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *.cè=

?target/q2/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform7target/q2/dense/kernel/Initializer/random_uniform/shape*)
_class
loc:@target/q2/dense/kernel*

seed *
T0*
_output_shapes
:	B*
dtype0*
seed2 
ö
5target/q2/dense/kernel/Initializer/random_uniform/subSub5target/q2/dense/kernel/Initializer/random_uniform/max5target/q2/dense/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
: 

5target/q2/dense/kernel/Initializer/random_uniform/mulMul?target/q2/dense/kernel/Initializer/random_uniform/RandomUniform5target/q2/dense/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	B*)
_class
loc:@target/q2/dense/kernel
û
1target/q2/dense/kernel/Initializer/random_uniformAdd5target/q2/dense/kernel/Initializer/random_uniform/mul5target/q2/dense/kernel/Initializer/random_uniform/min*
_output_shapes
:	B*)
_class
loc:@target/q2/dense/kernel*
T0
·
target/q2/dense/kernel
VariableV2*
dtype0*
shape:	B*)
_class
loc:@target/q2/dense/kernel*
	container *
_output_shapes
:	B*
shared_name 
ğ
target/q2/dense/kernel/AssignAssigntarget/q2/dense/kernel1target/q2/dense/kernel/Initializer/random_uniform*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
:	B*
validate_shape(*
use_locking(*
T0

target/q2/dense/kernel/readIdentitytarget/q2/dense/kernel*
_output_shapes
:	B*)
_class
loc:@target/q2/dense/kernel*
T0

&target/q2/dense/bias/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes	
:*'
_class
loc:@target/q2/dense/bias
«
target/q2/dense/bias
VariableV2*
shared_name *
_output_shapes	
:*
	container *'
_class
loc:@target/q2/dense/bias*
shape:*
dtype0
Û
target/q2/dense/bias/AssignAssigntarget/q2/dense/bias&target/q2/dense/bias/Initializer/zeros*'
_class
loc:@target/q2/dense/bias*
validate_shape(*
use_locking(*
_output_shapes	
:*
T0

target/q2/dense/bias/readIdentitytarget/q2/dense/bias*'
_class
loc:@target/q2/dense/bias*
T0*
_output_shapes	
:
¨
target/q2/dense/MatMulMatMultarget/q2/concattarget/q2/dense/kernel/read*
T0*
transpose_a( *
transpose_b( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

target/q2/dense/BiasAddBiasAddtarget/q2/dense/MatMultarget/q2/dense/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
h
target/q2/dense/ReluRelutarget/q2/dense/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
·
9target/q2/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"  ,  *
_output_shapes
:*
dtype0*+
_class!
loc:@target/q2/dense_1/kernel
©
7target/q2/dense_1/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *+
_class!
loc:@target/q2/dense_1/kernel*
valueB
 *£½½*
dtype0
©
7target/q2/dense_1/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *£½=*+
_class!
loc:@target/q2/dense_1/kernel

Atarget/q2/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q2/dense_1/kernel/Initializer/random_uniform/shape*

seed * 
_output_shapes
:
¬*
dtype0*
T0*+
_class!
loc:@target/q2/dense_1/kernel*
seed2 
ş
7target/q2/dense_1/kernel/Initializer/random_uniform/subSub7target/q2/dense_1/kernel/Initializer/random_uniform/max7target/q2/dense_1/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q2/dense_1/kernel*
_output_shapes
: *
T0

7target/q2/dense_1/kernel/Initializer/random_uniform/mulMulAtarget/q2/dense_1/kernel/Initializer/random_uniform/RandomUniform7target/q2/dense_1/kernel/Initializer/random_uniform/sub*+
_class!
loc:@target/q2/dense_1/kernel* 
_output_shapes
:
¬*
T0

3target/q2/dense_1/kernel/Initializer/random_uniformAdd7target/q2/dense_1/kernel/Initializer/random_uniform/mul7target/q2/dense_1/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬
½
target/q2/dense_1/kernel
VariableV2*
	container *
dtype0*+
_class!
loc:@target/q2/dense_1/kernel*
shared_name *
shape:
¬* 
_output_shapes
:
¬
ù
target/q2/dense_1/kernel/AssignAssigntarget/q2/dense_1/kernel3target/q2/dense_1/kernel/Initializer/random_uniform*+
_class!
loc:@target/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬*
validate_shape(*
use_locking(

target/q2/dense_1/kernel/readIdentitytarget/q2/dense_1/kernel* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/q2/dense_1/kernel
¢
(target/q2/dense_1/bias/Initializer/zerosConst*
valueB¬*    *
_output_shapes	
:¬*
dtype0*)
_class
loc:@target/q2/dense_1/bias
¯
target/q2/dense_1/bias
VariableV2*
_output_shapes	
:¬*)
_class
loc:@target/q2/dense_1/bias*
dtype0*
shared_name *
shape:¬*
	container 
ã
target/q2/dense_1/bias/AssignAssigntarget/q2/dense_1/bias(target/q2/dense_1/bias/Initializer/zeros*)
_class
loc:@target/q2/dense_1/bias*
use_locking(*
validate_shape(*
T0*
_output_shapes	
:¬

target/q2/dense_1/bias/readIdentitytarget/q2/dense_1/bias*
T0*
_output_shapes	
:¬*)
_class
loc:@target/q2/dense_1/bias
°
target/q2/dense_1/MatMulMatMultarget/q2/dense/Relutarget/q2/dense_1/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0*
transpose_b( *
transpose_a( 
¥
target/q2/dense_1/BiasAddBiasAddtarget/q2/dense_1/MatMultarget/q2/dense_1/bias/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0*
data_formatNHWC
l
target/q2/dense_1/ReluRelutarget/q2/dense_1/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
·
9target/q2/dense_2/kernel/Initializer/random_uniform/shapeConst*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:*
dtype0*
valueB",     
©
7target/q2/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 * ¾*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
: 
©
7target/q2/dense_2/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *+
_class!
loc:@target/q2/dense_2/kernel*
dtype0*
valueB
 * >

Atarget/q2/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q2/dense_2/kernel/Initializer/random_uniform/shape*

seed *
T0*+
_class!
loc:@target/q2/dense_2/kernel*
dtype0*
_output_shapes
:	¬*
seed2 
ş
7target/q2/dense_2/kernel/Initializer/random_uniform/subSub7target/q2/dense_2/kernel/Initializer/random_uniform/max7target/q2/dense_2/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
: *
T0

7target/q2/dense_2/kernel/Initializer/random_uniform/mulMulAtarget/q2/dense_2/kernel/Initializer/random_uniform/RandomUniform7target/q2/dense_2/kernel/Initializer/random_uniform/sub*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬*
T0

3target/q2/dense_2/kernel/Initializer/random_uniformAdd7target/q2/dense_2/kernel/Initializer/random_uniform/mul7target/q2/dense_2/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q2/dense_2/kernel*
T0*
_output_shapes
:	¬
»
target/q2/dense_2/kernel
VariableV2*
shape:	¬*
dtype0*
shared_name *
_output_shapes
:	¬*+
_class!
loc:@target/q2/dense_2/kernel*
	container 
ø
target/q2/dense_2/kernel/AssignAssigntarget/q2/dense_2/kernel3target/q2/dense_2/kernel/Initializer/random_uniform*
use_locking(*
T0*
validate_shape(*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬

target/q2/dense_2/kernel/readIdentitytarget/q2/dense_2/kernel*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬*
T0
 
(target/q2/dense_2/bias/Initializer/zerosConst*
dtype0*
_output_shapes
:*)
_class
loc:@target/q2/dense_2/bias*
valueB*    
­
target/q2/dense_2/bias
VariableV2*
	container *
shared_name *
shape:*
_output_shapes
:*)
_class
loc:@target/q2/dense_2/bias*
dtype0
â
target/q2/dense_2/bias/AssignAssigntarget/q2/dense_2/bias(target/q2/dense_2/bias/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*)
_class
loc:@target/q2/dense_2/bias

target/q2/dense_2/bias/readIdentitytarget/q2/dense_2/bias*
T0*)
_class
loc:@target/q2/dense_2/bias*
_output_shapes
:
±
target/q2/dense_2/MatMulMatMultarget/q2/dense_1/Relutarget/q2/dense_2/kernel/read*
transpose_b( *
transpose_a( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¤
target/q2/dense_2/BiasAddBiasAddtarget/q2/dense_2/MatMultarget/q2/dense_2/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
data_formatNHWC*
T0
|
target/q2/SqueezeSqueezetarget/q2/dense_2/BiasAdd*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims

b
target/q2_1/concat/axisConst*
_output_shapes
: *
valueB :
ÿÿÿÿÿÿÿÿÿ*
dtype0

target/q2_1/concatConcatV2Placeholder_3target/mul_1target/q2_1/concat/axis*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*

Tidx0
¬
target/q2_1/dense/MatMulMatMultarget/q2_1/concattarget/q2/dense/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_a( *
T0*
transpose_b( 
£
target/q2_1/dense/BiasAddBiasAddtarget/q2_1/dense/MatMultarget/q2/dense/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
l
target/q2_1/dense/ReluRelutarget/q2_1/dense/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
´
target/q2_1/dense_1/MatMulMatMultarget/q2_1/dense/Relutarget/q2/dense_1/kernel/read*
T0*
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
transpose_b( 
©
target/q2_1/dense_1/BiasAddBiasAddtarget/q2_1/dense_1/MatMultarget/q2/dense_1/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
p
target/q2_1/dense_1/ReluRelutarget/q2_1/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
µ
target/q2_1/dense_2/MatMulMatMultarget/q2_1/dense_1/Relutarget/q2/dense_2/kernel/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_a( *
T0*
transpose_b( 
¨
target/q2_1/dense_2/BiasAddBiasAddtarget/q2_1/dense_2/MatMultarget/q2/dense_2/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

target/q2_1/SqueezeSqueezetarget/q2_1/dense_2/BiasAdd*
T0*
squeeze_dims
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
±
6target/v/dense/kernel/Initializer/random_uniform/shapeConst*
valueB"6     *
_output_shapes
:*
dtype0*(
_class
loc:@target/v/dense/kernel
£
4target/v/dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *Hpë½*(
_class
loc:@target/v/dense/kernel
£
4target/v/dense/kernel/Initializer/random_uniform/maxConst*
valueB
 *Hpë=*
dtype0*(
_class
loc:@target/v/dense/kernel*
_output_shapes
: 

>target/v/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform6target/v/dense/kernel/Initializer/random_uniform/shape*
dtype0*(
_class
loc:@target/v/dense/kernel*

seed *
seed2 *
_output_shapes
:	6*
T0
ò
4target/v/dense/kernel/Initializer/random_uniform/subSub4target/v/dense/kernel/Initializer/random_uniform/max4target/v/dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*(
_class
loc:@target/v/dense/kernel

4target/v/dense/kernel/Initializer/random_uniform/mulMul>target/v/dense/kernel/Initializer/random_uniform/RandomUniform4target/v/dense/kernel/Initializer/random_uniform/sub*(
_class
loc:@target/v/dense/kernel*
T0*
_output_shapes
:	6
÷
0target/v/dense/kernel/Initializer/random_uniformAdd4target/v/dense/kernel/Initializer/random_uniform/mul4target/v/dense/kernel/Initializer/random_uniform/min*(
_class
loc:@target/v/dense/kernel*
T0*
_output_shapes
:	6
µ
target/v/dense/kernel
VariableV2*(
_class
loc:@target/v/dense/kernel*
shared_name *
dtype0*
	container *
shape:	6*
_output_shapes
:	6
ì
target/v/dense/kernel/AssignAssigntarget/v/dense/kernel0target/v/dense/kernel/Initializer/random_uniform*(
_class
loc:@target/v/dense/kernel*
validate_shape(*
T0*
_output_shapes
:	6*
use_locking(

target/v/dense/kernel/readIdentitytarget/v/dense/kernel*
T0*
_output_shapes
:	6*(
_class
loc:@target/v/dense/kernel

%target/v/dense/bias/Initializer/zerosConst*
dtype0*
valueB*    *
_output_shapes	
:*&
_class
loc:@target/v/dense/bias
©
target/v/dense/bias
VariableV2*
	container *
_output_shapes	
:*&
_class
loc:@target/v/dense/bias*
dtype0*
shape:*
shared_name 
×
target/v/dense/bias/AssignAssigntarget/v/dense/bias%target/v/dense/bias/Initializer/zeros*&
_class
loc:@target/v/dense/bias*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:

target/v/dense/bias/readIdentitytarget/v/dense/bias*
T0*
_output_shapes	
:*&
_class
loc:@target/v/dense/bias
£
target/v/dense/MatMulMatMulPlaceholder_3target/v/dense/kernel/read*
transpose_a( *
T0*
transpose_b( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

target/v/dense/BiasAddBiasAddtarget/v/dense/MatMultarget/v/dense/bias/read*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
f
target/v/dense/ReluRelutarget/v/dense/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
µ
8target/v/dense_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"  ,  **
_class 
loc:@target/v/dense_1/kernel
§
6target/v/dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *£½½**
_class 
loc:@target/v/dense_1/kernel
§
6target/v/dense_1/kernel/Initializer/random_uniform/maxConst**
_class 
loc:@target/v/dense_1/kernel*
valueB
 *£½=*
_output_shapes
: *
dtype0

@target/v/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform8target/v/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
T0*

seed *
seed2 * 
_output_shapes
:
¬**
_class 
loc:@target/v/dense_1/kernel
ú
6target/v/dense_1/kernel/Initializer/random_uniform/subSub6target/v/dense_1/kernel/Initializer/random_uniform/max6target/v/dense_1/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: **
_class 
loc:@target/v/dense_1/kernel

6target/v/dense_1/kernel/Initializer/random_uniform/mulMul@target/v/dense_1/kernel/Initializer/random_uniform/RandomUniform6target/v/dense_1/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
¬*
T0**
_class 
loc:@target/v/dense_1/kernel

2target/v/dense_1/kernel/Initializer/random_uniformAdd6target/v/dense_1/kernel/Initializer/random_uniform/mul6target/v/dense_1/kernel/Initializer/random_uniform/min**
_class 
loc:@target/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
»
target/v/dense_1/kernel
VariableV2*
	container *
shared_name *
dtype0**
_class 
loc:@target/v/dense_1/kernel* 
_output_shapes
:
¬*
shape:
¬
õ
target/v/dense_1/kernel/AssignAssigntarget/v/dense_1/kernel2target/v/dense_1/kernel/Initializer/random_uniform*
T0*
validate_shape(* 
_output_shapes
:
¬*
use_locking(**
_class 
loc:@target/v/dense_1/kernel

target/v/dense_1/kernel/readIdentitytarget/v/dense_1/kernel*
T0**
_class 
loc:@target/v/dense_1/kernel* 
_output_shapes
:
¬
 
'target/v/dense_1/bias/Initializer/zerosConst*
_output_shapes	
:¬*(
_class
loc:@target/v/dense_1/bias*
valueB¬*    *
dtype0
­
target/v/dense_1/bias
VariableV2*
shared_name *(
_class
loc:@target/v/dense_1/bias*
shape:¬*
_output_shapes	
:¬*
dtype0*
	container 
ß
target/v/dense_1/bias/AssignAssigntarget/v/dense_1/bias'target/v/dense_1/bias/Initializer/zeros*
validate_shape(*(
_class
loc:@target/v/dense_1/bias*
use_locking(*
_output_shapes	
:¬*
T0

target/v/dense_1/bias/readIdentitytarget/v/dense_1/bias*(
_class
loc:@target/v/dense_1/bias*
T0*
_output_shapes	
:¬
­
target/v/dense_1/MatMulMatMultarget/v/dense/Relutarget/v/dense_1/kernel/read*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
¢
target/v/dense_1/BiasAddBiasAddtarget/v/dense_1/MatMultarget/v/dense_1/bias/read*
data_formatNHWC*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
j
target/v/dense_1/ReluRelutarget/v/dense_1/BiasAdd*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
µ
8target/v/dense_2/kernel/Initializer/random_uniform/shapeConst**
_class 
loc:@target/v/dense_2/kernel*
valueB",     *
dtype0*
_output_shapes
:
§
6target/v/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: **
_class 
loc:@target/v/dense_2/kernel*
valueB
 * ¾
§
6target/v/dense_2/kernel/Initializer/random_uniform/maxConst*
valueB
 * >**
_class 
loc:@target/v/dense_2/kernel*
dtype0*
_output_shapes
: 

@target/v/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform8target/v/dense_2/kernel/Initializer/random_uniform/shape**
_class 
loc:@target/v/dense_2/kernel*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:	¬
ú
6target/v/dense_2/kernel/Initializer/random_uniform/subSub6target/v/dense_2/kernel/Initializer/random_uniform/max6target/v/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: **
_class 
loc:@target/v/dense_2/kernel

6target/v/dense_2/kernel/Initializer/random_uniform/mulMul@target/v/dense_2/kernel/Initializer/random_uniform/RandomUniform6target/v/dense_2/kernel/Initializer/random_uniform/sub*
_output_shapes
:	¬*
T0**
_class 
loc:@target/v/dense_2/kernel
ÿ
2target/v/dense_2/kernel/Initializer/random_uniformAdd6target/v/dense_2/kernel/Initializer/random_uniform/mul6target/v/dense_2/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬
¹
target/v/dense_2/kernel
VariableV2*
	container *
shared_name **
_class 
loc:@target/v/dense_2/kernel*
shape:	¬*
dtype0*
_output_shapes
:	¬
ô
target/v/dense_2/kernel/AssignAssigntarget/v/dense_2/kernel2target/v/dense_2/kernel/Initializer/random_uniform**
_class 
loc:@target/v/dense_2/kernel*
validate_shape(*
T0*
use_locking(*
_output_shapes
:	¬

target/v/dense_2/kernel/readIdentitytarget/v/dense_2/kernel**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬*
T0

'target/v/dense_2/bias/Initializer/zerosConst*
_output_shapes
:*
valueB*    *
dtype0*(
_class
loc:@target/v/dense_2/bias
«
target/v/dense_2/bias
VariableV2*
_output_shapes
:*
dtype0*
shared_name *
shape:*
	container *(
_class
loc:@target/v/dense_2/bias
Ş
target/v/dense_2/bias/AssignAssigntarget/v/dense_2/bias'target/v/dense_2/bias/Initializer/zeros*
T0*
_output_shapes
:*(
_class
loc:@target/v/dense_2/bias*
use_locking(*
validate_shape(

target/v/dense_2/bias/readIdentitytarget/v/dense_2/bias*
T0*
_output_shapes
:*(
_class
loc:@target/v/dense_2/bias
®
target/v/dense_2/MatMulMatMultarget/v/dense_1/Relutarget/v/dense_2/kernel/read*
T0*
transpose_b( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_a( 
¡
target/v/dense_2/BiasAddBiasAddtarget/v/dense_2/MatMultarget/v/dense_2/bias/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
data_formatNHWC
z
target/v/SqueezeSqueezetarget/v/dense_2/BiasAdd*
squeeze_dims
*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
f
MinimumMinimummain/q1_1/Squeezemain/q2_1/Squeeze*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
N
subSubsub/xPlaceholder_5*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
J
mul/xConst*
dtype0*
_output_shapes
: *
valueB
 *¤p}?
D
mulMulmul/xsub*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Q
mul_1Mulmultarget/v/Squeeze*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
P
addAddV2Placeholder_4mul_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
O
StopGradientStopGradientadd*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
L
mul_2/xConst*
dtype0*
_output_shapes
: *
valueB
 *
×£;
R
mul_2Mulmul_2/xmain/pi/sub_4*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
J
sub_1SubMinimummul_2*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
S
StopGradient_1StopGradientsub_1*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
L
mul_3/xConst*
valueB
 *
×£;*
_output_shapes
: *
dtype0
R
mul_3Mulmul_3/xmain/pi/sub_4*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
sub_2Submul_3main/q1_1/Squeeze*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
O
ConstConst*
dtype0*
_output_shapes
:*
valueB: 
X
MeanMeansub_2Const*
T0*

Tidx0*
_output_shapes
: *
	keep_dims( 
Y
sub_3SubStopGradientmain/q1/Squeeze*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
J
pow/yConst*
valueB
 *   @*
_output_shapes
: *
dtype0
F
powPowsub_3pow/y*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Q
Const_1Const*
valueB: *
dtype0*
_output_shapes
:
Z
Mean_1MeanpowConst_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
L
mul_4/xConst*
valueB
 *   ?*
dtype0*
_output_shapes
: 
>
mul_4Mulmul_4/xMean_1*
T0*
_output_shapes
: 
Y
sub_4SubStopGradientmain/q2/Squeeze*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
L
pow_1/yConst*
_output_shapes
: *
valueB
 *   @*
dtype0
J
pow_1Powsub_4pow_1/y*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Q
Const_2Const*
valueB: *
dtype0*
_output_shapes
:
\
Mean_2Meanpow_1Const_2*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
L
mul_5/xConst*
_output_shapes
: *
valueB
 *   ?*
dtype0
>
mul_5Mulmul_5/xMean_2*
T0*
_output_shapes
: 
Z
sub_5SubStopGradient_1main/v/Squeeze*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
L
pow_2/yConst*
_output_shapes
: *
valueB
 *   @*
dtype0
J
pow_2Powsub_5pow_2/y*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Q
Const_3Const*
dtype0*
_output_shapes
:*
valueB: 
\
Mean_3Meanpow_2Const_3*
T0*
	keep_dims( *
_output_shapes
: *

Tidx0
L
mul_6/xConst*
valueB
 *   ?*
_output_shapes
: *
dtype0
>
mul_6Mulmul_6/xMean_3*
_output_shapes
: *
T0
=
add_1AddV2mul_4mul_5*
T0*
_output_shapes
: 
=
add_2AddV2add_1mul_6*
_output_shapes
: *
T0
R
gradients/ShapeConst*
valueB *
_output_shapes
: *
dtype0
X
gradients/grad_ys_0Const*
_output_shapes
: *
valueB
 *  ?*
dtype0
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
_output_shapes
: *
T0*

index_type0
k
!gradients/Mean_grad/Reshape/shapeConst*
valueB:*
_output_shapes
:*
dtype0

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
^
gradients/Mean_grad/ShapeShapesub_2*
T0*
out_type0*
_output_shapes
:

gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*

Tmultiples0
`
gradients/Mean_grad/Shape_1Shapesub_2*
T0*
_output_shapes
:*
out_type0
^
gradients/Mean_grad/Shape_2Const*
_output_shapes
: *
dtype0*
valueB 
c
gradients/Mean_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:

gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
e
gradients/Mean_grad/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 

gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
_
gradients/Mean_grad/Maximum/yConst*
_output_shapes
: *
value	B :*
dtype0

gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
T0*
_output_shapes
: 

gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
_output_shapes
: *
T0
~
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*
Truncate( *

SrcT0*
_output_shapes
: *

DstT0

gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
_
gradients/sub_2_grad/ShapeShapemul_3*
_output_shapes
:*
T0*
out_type0
m
gradients/sub_2_grad/Shape_1Shapemain/q1_1/Squeeze*
T0*
_output_shapes
:*
out_type0
º
*gradients/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_2_grad/Shapegradients/sub_2_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
¨
gradients/sub_2_grad/SumSumgradients/Mean_grad/truediv*gradients/sub_2_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/sub_2_grad/ReshapeReshapegradients/sub_2_grad/Sumgradients/sub_2_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
Tshape0
j
gradients/sub_2_grad/NegNeggradients/Mean_grad/truediv*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
©
gradients/sub_2_grad/Sum_1Sumgradients/sub_2_grad/Neg,gradients/sub_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
T0*
	keep_dims( 

gradients/sub_2_grad/Reshape_1Reshapegradients/sub_2_grad/Sum_1gradients/sub_2_grad/Shape_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0
m
%gradients/sub_2_grad/tuple/group_depsNoOp^gradients/sub_2_grad/Reshape^gradients/sub_2_grad/Reshape_1
Ş
-gradients/sub_2_grad/tuple/control_dependencyIdentitygradients/sub_2_grad/Reshape&^gradients/sub_2_grad/tuple/group_deps*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*/
_class%
#!loc:@gradients/sub_2_grad/Reshape*
T0
ä
/gradients/sub_2_grad/tuple/control_dependency_1Identitygradients/sub_2_grad/Reshape_1&^gradients/sub_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_2_grad/Reshape_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
_
gradients/mul_3_grad/ShapeShapemul_3/x*
out_type0*
_output_shapes
: *
T0
i
gradients/mul_3_grad/Shape_1Shapemain/pi/sub_4*
T0*
_output_shapes
:*
out_type0
º
*gradients/mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_3_grad/Shapegradients/mul_3_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0

gradients/mul_3_grad/MulMul-gradients/sub_2_grad/tuple/control_dependencymain/pi/sub_4*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¥
gradients/mul_3_grad/SumSumgradients/mul_3_grad/Mul*gradients/mul_3_grad/BroadcastGradientArgs*
	keep_dims( *
_output_shapes
:*

Tidx0*
T0

gradients/mul_3_grad/ReshapeReshapegradients/mul_3_grad/Sumgradients/mul_3_grad/Shape*
T0*
_output_shapes
: *
Tshape0

gradients/mul_3_grad/Mul_1Mulmul_3/x-gradients/sub_2_grad/tuple/control_dependency*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
«
gradients/mul_3_grad/Sum_1Sumgradients/mul_3_grad/Mul_1,gradients/mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0

gradients/mul_3_grad/Reshape_1Reshapegradients/mul_3_grad/Sum_1gradients/mul_3_grad/Shape_1*
T0*
Tshape0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
m
%gradients/mul_3_grad/tuple/group_depsNoOp^gradients/mul_3_grad/Reshape^gradients/mul_3_grad/Reshape_1
Ñ
-gradients/mul_3_grad/tuple/control_dependencyIdentitygradients/mul_3_grad/Reshape&^gradients/mul_3_grad/tuple/group_deps*
_output_shapes
: *
T0*/
_class%
#!loc:@gradients/mul_3_grad/Reshape
ä
/gradients/mul_3_grad/tuple/control_dependency_1Identitygradients/mul_3_grad/Reshape_1&^gradients/mul_3_grad/tuple/group_deps*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*1
_class'
%#loc:@gradients/mul_3_grad/Reshape_1

&gradients/main/q1_1/Squeeze_grad/ShapeShapemain/q1_1/dense_2/BiasAdd*
_output_shapes
:*
T0*
out_type0
Ì
(gradients/main/q1_1/Squeeze_grad/ReshapeReshape/gradients/sub_2_grad/tuple/control_dependency_1&gradients/main/q1_1/Squeeze_grad/Shape*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
m
"gradients/main/pi/sub_4_grad/ShapeShapemain/pi/Sum*
_output_shapes
:*
T0*
out_type0
q
$gradients/main/pi/sub_4_grad/Shape_1Shapemain/pi/Sum_1*
out_type0*
T0*
_output_shapes
:
Ò
2gradients/main/pi/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/sub_4_grad/Shape$gradients/main/pi/sub_4_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
Ì
 gradients/main/pi/sub_4_grad/SumSum/gradients/mul_3_grad/tuple/control_dependency_12gradients/main/pi/sub_4_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
±
$gradients/main/pi/sub_4_grad/ReshapeReshape gradients/main/pi/sub_4_grad/Sum"gradients/main/pi/sub_4_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0

 gradients/main/pi/sub_4_grad/NegNeg/gradients/mul_3_grad/tuple/control_dependency_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Á
"gradients/main/pi/sub_4_grad/Sum_1Sum gradients/main/pi/sub_4_grad/Neg4gradients/main/pi/sub_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
·
&gradients/main/pi/sub_4_grad/Reshape_1Reshape"gradients/main/pi/sub_4_grad/Sum_1$gradients/main/pi/sub_4_grad/Shape_1*
T0*
Tshape0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

-gradients/main/pi/sub_4_grad/tuple/group_depsNoOp%^gradients/main/pi/sub_4_grad/Reshape'^gradients/main/pi/sub_4_grad/Reshape_1
ş
5gradients/main/pi/sub_4_grad/tuple/control_dependencyIdentity$gradients/main/pi/sub_4_grad/Reshape.^gradients/main/pi/sub_4_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/sub_4_grad/Reshape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

7gradients/main/pi/sub_4_grad/tuple/control_dependency_1Identity&gradients/main/pi/sub_4_grad/Reshape_1.^gradients/main/pi/sub_4_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/sub_4_grad/Reshape_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
©
4gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad(gradients/main/q1_1/Squeeze_grad/Reshape*
_output_shapes
:*
data_formatNHWC*
T0
£
9gradients/main/q1_1/dense_2/BiasAdd_grad/tuple/group_depsNoOp)^gradients/main/q1_1/Squeeze_grad/Reshape5^gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGrad
¢
Agradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity(gradients/main/q1_1/Squeeze_grad/Reshape:^gradients/main/q1_1/dense_2/BiasAdd_grad/tuple/group_deps*;
_class1
/-loc:@gradients/main/q1_1/Squeeze_grad/Reshape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¯
Cgradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity4gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGrad:^gradients/main/q1_1/dense_2/BiasAdd_grad/tuple/group_deps*G
_class=
;9loc:@gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGrad*
_output_shapes
:*
T0
m
 gradients/main/pi/Sum_grad/ShapeShapemain/pi/mul_3*
out_type0*
T0*
_output_shapes
:

gradients/main/pi/Sum_grad/SizeConst*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
dtype0*
value	B :*
_output_shapes
: 
½
gradients/main/pi/Sum_grad/addAddV2main/pi/Sum/reduction_indicesgradients/main/pi/Sum_grad/Size*
T0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
: 
Á
gradients/main/pi/Sum_grad/modFloorModgradients/main/pi/Sum_grad/addgradients/main/pi/Sum_grad/Size*
_output_shapes
: *
T0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape

"gradients/main/pi/Sum_grad/Shape_1Const*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
dtype0*
valueB *
_output_shapes
: 

&gradients/main/pi/Sum_grad/range/startConst*
_output_shapes
: *
dtype0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
value	B : 

&gradients/main/pi/Sum_grad/range/deltaConst*
_output_shapes
: *
dtype0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
value	B :
÷
 gradients/main/pi/Sum_grad/rangeRange&gradients/main/pi/Sum_grad/range/startgradients/main/pi/Sum_grad/Size&gradients/main/pi/Sum_grad/range/delta*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
:*

Tidx0

%gradients/main/pi/Sum_grad/Fill/valueConst*
value	B :*
dtype0*
_output_shapes
: *3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape
Ú
gradients/main/pi/Sum_grad/FillFill"gradients/main/pi/Sum_grad/Shape_1%gradients/main/pi/Sum_grad/Fill/value*

index_type0*
_output_shapes
: *
T0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape
¡
(gradients/main/pi/Sum_grad/DynamicStitchDynamicStitch gradients/main/pi/Sum_grad/rangegradients/main/pi/Sum_grad/mod gradients/main/pi/Sum_grad/Shapegradients/main/pi/Sum_grad/Fill*
N*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
:*
T0

$gradients/main/pi/Sum_grad/Maximum/yConst*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
dtype0*
_output_shapes
: *
value	B :
×
"gradients/main/pi/Sum_grad/MaximumMaximum(gradients/main/pi/Sum_grad/DynamicStitch$gradients/main/pi/Sum_grad/Maximum/y*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
:*
T0
Ï
#gradients/main/pi/Sum_grad/floordivFloorDiv gradients/main/pi/Sum_grad/Shape"gradients/main/pi/Sum_grad/Maximum*
_output_shapes
:*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
T0
×
"gradients/main/pi/Sum_grad/ReshapeReshape5gradients/main/pi/sub_4_grad/tuple/control_dependency(gradients/main/pi/Sum_grad/DynamicStitch*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
Tshape0
´
gradients/main/pi/Sum_grad/TileTile"gradients/main/pi/Sum_grad/Reshape#gradients/main/pi/Sum_grad/floordiv*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*

Tmultiples0
m
"gradients/main/pi/Sum_1_grad/ShapeShapemain/pi/Log*
out_type0*
T0*
_output_shapes
:

!gradients/main/pi/Sum_1_grad/SizeConst*
dtype0*
_output_shapes
: *5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
value	B :
Å
 gradients/main/pi/Sum_1_grad/addAddV2main/pi/Sum_1/reduction_indices!gradients/main/pi/Sum_1_grad/Size*
T0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: 
É
 gradients/main/pi/Sum_1_grad/modFloorMod gradients/main/pi/Sum_1_grad/add!gradients/main/pi/Sum_1_grad/Size*
_output_shapes
: *
T0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape

$gradients/main/pi/Sum_1_grad/Shape_1Const*
_output_shapes
: *5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
dtype0*
valueB 
¡
(gradients/main/pi/Sum_1_grad/range/startConst*
_output_shapes
: *
dtype0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
value	B : 
¡
(gradients/main/pi/Sum_1_grad/range/deltaConst*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
dtype0*
_output_shapes
: *
value	B :

"gradients/main/pi/Sum_1_grad/rangeRange(gradients/main/pi/Sum_1_grad/range/start!gradients/main/pi/Sum_1_grad/Size(gradients/main/pi/Sum_1_grad/range/delta*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*

Tidx0*
_output_shapes
:
 
'gradients/main/pi/Sum_1_grad/Fill/valueConst*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
dtype0*
_output_shapes
: *
value	B :
â
!gradients/main/pi/Sum_1_grad/FillFill$gradients/main/pi/Sum_1_grad/Shape_1'gradients/main/pi/Sum_1_grad/Fill/value*
T0*
_output_shapes
: *

index_type0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape
­
*gradients/main/pi/Sum_1_grad/DynamicStitchDynamicStitch"gradients/main/pi/Sum_1_grad/range gradients/main/pi/Sum_1_grad/mod"gradients/main/pi/Sum_1_grad/Shape!gradients/main/pi/Sum_1_grad/Fill*
T0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
:*
N

&gradients/main/pi/Sum_1_grad/Maximum/yConst*
value	B :*
dtype0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: 
ß
$gradients/main/pi/Sum_1_grad/MaximumMaximum*gradients/main/pi/Sum_1_grad/DynamicStitch&gradients/main/pi/Sum_1_grad/Maximum/y*
T0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
:
×
%gradients/main/pi/Sum_1_grad/floordivFloorDiv"gradients/main/pi/Sum_1_grad/Shape$gradients/main/pi/Sum_1_grad/Maximum*
T0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
:
İ
$gradients/main/pi/Sum_1_grad/ReshapeReshape7gradients/main/pi/sub_4_grad/tuple/control_dependency_1*gradients/main/pi/Sum_1_grad/DynamicStitch*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
T0*
Tshape0
º
!gradients/main/pi/Sum_1_grad/TileTile$gradients/main/pi/Sum_1_grad/Reshape%gradients/main/pi/Sum_1_grad/floordiv*

Tmultiples0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ñ
.gradients/main/q1_1/dense_2/MatMul_grad/MatMulMatMulAgradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependencymain/q1/dense_2/kernel/read*
transpose_a( *
T0*
transpose_b(*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
å
0gradients/main/q1_1/dense_2/MatMul_grad/MatMul_1MatMulmain/q1_1/dense_1/ReluAgradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
T0*
transpose_b( *
_output_shapes
:	¬
¤
8gradients/main/q1_1/dense_2/MatMul_grad/tuple/group_depsNoOp/^gradients/main/q1_1/dense_2/MatMul_grad/MatMul1^gradients/main/q1_1/dense_2/MatMul_grad/MatMul_1
­
@gradients/main/q1_1/dense_2/MatMul_grad/tuple/control_dependencyIdentity.gradients/main/q1_1/dense_2/MatMul_grad/MatMul9^gradients/main/q1_1/dense_2/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/main/q1_1/dense_2/MatMul_grad/MatMul*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
ª
Bgradients/main/q1_1/dense_2/MatMul_grad/tuple/control_dependency_1Identity0gradients/main/q1_1/dense_2/MatMul_grad/MatMul_19^gradients/main/q1_1/dense_2/MatMul_grad/tuple/group_deps*C
_class9
75loc:@gradients/main/q1_1/dense_2/MatMul_grad/MatMul_1*
_output_shapes
:	¬*
T0
o
"gradients/main/pi/mul_3_grad/ShapeShapemain/pi/mul_3/x*
out_type0*
_output_shapes
: *
T0
q
$gradients/main/pi/mul_3_grad/Shape_1Shapemain/pi/add_5*
_output_shapes
:*
T0*
out_type0
Ò
2gradients/main/pi/mul_3_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/mul_3_grad/Shape$gradients/main/pi/mul_3_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0

 gradients/main/pi/mul_3_grad/MulMulgradients/main/pi/Sum_grad/Tilemain/pi/add_5*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
½
 gradients/main/pi/mul_3_grad/SumSum gradients/main/pi/mul_3_grad/Mul2gradients/main/pi/mul_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
_output_shapes
:*
	keep_dims( 
¤
$gradients/main/pi/mul_3_grad/ReshapeReshape gradients/main/pi/mul_3_grad/Sum"gradients/main/pi/mul_3_grad/Shape*
Tshape0*
T0*
_output_shapes
: 

"gradients/main/pi/mul_3_grad/Mul_1Mulmain/pi/mul_3/xgradients/main/pi/Sum_grad/Tile*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ã
"gradients/main/pi/mul_3_grad/Sum_1Sum"gradients/main/pi/mul_3_grad/Mul_14gradients/main/pi/mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
»
&gradients/main/pi/mul_3_grad/Reshape_1Reshape"gradients/main/pi/mul_3_grad/Sum_1$gradients/main/pi/mul_3_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

-gradients/main/pi/mul_3_grad/tuple/group_depsNoOp%^gradients/main/pi/mul_3_grad/Reshape'^gradients/main/pi/mul_3_grad/Reshape_1
ñ
5gradients/main/pi/mul_3_grad/tuple/control_dependencyIdentity$gradients/main/pi/mul_3_grad/Reshape.^gradients/main/pi/mul_3_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/mul_3_grad/Reshape*
_output_shapes
: *
T0

7gradients/main/pi/mul_3_grad/tuple/control_dependency_1Identity&gradients/main/pi/mul_3_grad/Reshape_1.^gradients/main/pi/mul_3_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/mul_3_grad/Reshape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

%gradients/main/pi/Log_grad/Reciprocal
Reciprocalmain/pi/add_8"^gradients/main/pi/Sum_1_grad/Tile*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¡
gradients/main/pi/Log_grad/mulMul!gradients/main/pi/Sum_1_grad/Tile%gradients/main/pi/Log_grad/Reciprocal*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Ç
.gradients/main/q1_1/dense_1/Relu_grad/ReluGradReluGrad@gradients/main/q1_1/dense_2/MatMul_grad/tuple/control_dependencymain/q1_1/dense_1/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
o
"gradients/main/pi/add_5_grad/ShapeShapemain/pi/add_4*
_output_shapes
:*
T0*
out_type0
q
$gradients/main/pi/add_5_grad/Shape_1Shapemain/pi/add_5/y*
T0*
_output_shapes
: *
out_type0
Ò
2gradients/main/pi/add_5_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_5_grad/Shape$gradients/main/pi/add_5_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
Ô
 gradients/main/pi/add_5_grad/SumSum7gradients/main/pi/mul_3_grad/tuple/control_dependency_12gradients/main/pi/add_5_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0*
_output_shapes
:
µ
$gradients/main/pi/add_5_grad/ReshapeReshape gradients/main/pi/add_5_grad/Sum"gradients/main/pi/add_5_grad/Shape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
Tshape0
Ø
"gradients/main/pi/add_5_grad/Sum_1Sum7gradients/main/pi/mul_3_grad/tuple/control_dependency_14gradients/main/pi/add_5_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
ª
&gradients/main/pi/add_5_grad/Reshape_1Reshape"gradients/main/pi/add_5_grad/Sum_1$gradients/main/pi/add_5_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0

-gradients/main/pi/add_5_grad/tuple/group_depsNoOp%^gradients/main/pi/add_5_grad/Reshape'^gradients/main/pi/add_5_grad/Reshape_1

5gradients/main/pi/add_5_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_5_grad/Reshape.^gradients/main/pi/add_5_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_5_grad/Reshape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
÷
7gradients/main/pi/add_5_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_5_grad/Reshape_1.^gradients/main/pi/add_5_grad/tuple/group_deps*
T0*
_output_shapes
: *9
_class/
-+loc:@gradients/main/pi/add_5_grad/Reshape_1
o
"gradients/main/pi/add_8_grad/ShapeShapemain/pi/add_7*
T0*
_output_shapes
:*
out_type0
q
$gradients/main/pi/add_8_grad/Shape_1Shapemain/pi/add_8/y*
_output_shapes
: *
T0*
out_type0
Ò
2gradients/main/pi/add_8_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_8_grad/Shape$gradients/main/pi/add_8_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
»
 gradients/main/pi/add_8_grad/SumSumgradients/main/pi/Log_grad/mul2gradients/main/pi/add_8_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
µ
$gradients/main/pi/add_8_grad/ReshapeReshape gradients/main/pi/add_8_grad/Sum"gradients/main/pi/add_8_grad/Shape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0
¿
"gradients/main/pi/add_8_grad/Sum_1Sumgradients/main/pi/Log_grad/mul4gradients/main/pi/add_8_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
ª
&gradients/main/pi/add_8_grad/Reshape_1Reshape"gradients/main/pi/add_8_grad/Sum_1$gradients/main/pi/add_8_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0

-gradients/main/pi/add_8_grad/tuple/group_depsNoOp%^gradients/main/pi/add_8_grad/Reshape'^gradients/main/pi/add_8_grad/Reshape_1

5gradients/main/pi/add_8_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_8_grad/Reshape.^gradients/main/pi/add_8_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_8_grad/Reshape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
÷
7gradients/main/pi/add_8_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_8_grad/Reshape_1.^gradients/main/pi/add_8_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/add_8_grad/Reshape_1*
T0*
_output_shapes
: 
°
4gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad.gradients/main/q1_1/dense_1/Relu_grad/ReluGrad*
_output_shapes	
:¬*
data_formatNHWC*
T0
©
9gradients/main/q1_1/dense_1/BiasAdd_grad/tuple/group_depsNoOp5^gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGrad/^gradients/main/q1_1/dense_1/Relu_grad/ReluGrad
¯
Agradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity.gradients/main/q1_1/dense_1/Relu_grad/ReluGrad:^gradients/main/q1_1/dense_1/BiasAdd_grad/tuple/group_deps*A
_class7
53loc:@gradients/main/q1_1/dense_1/Relu_grad/ReluGrad*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
°
Cgradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity4gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGrad:^gradients/main/q1_1/dense_1/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:¬*
T0*G
_class=
;9loc:@gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGrad
m
"gradients/main/pi/add_4_grad/ShapeShapemain/pi/pow*
out_type0*
T0*
_output_shapes
:
q
$gradients/main/pi/add_4_grad/Shape_1Shapemain/pi/mul_2*
out_type0*
_output_shapes
:*
T0
Ò
2gradients/main/pi/add_4_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_4_grad/Shape$gradients/main/pi/add_4_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
Ò
 gradients/main/pi/add_4_grad/SumSum5gradients/main/pi/add_5_grad/tuple/control_dependency2gradients/main/pi/add_4_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
T0*
	keep_dims( 
µ
$gradients/main/pi/add_4_grad/ReshapeReshape gradients/main/pi/add_4_grad/Sum"gradients/main/pi/add_4_grad/Shape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0
Ö
"gradients/main/pi/add_4_grad/Sum_1Sum5gradients/main/pi/add_5_grad/tuple/control_dependency4gradients/main/pi/add_4_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*

Tidx0*
	keep_dims( 
»
&gradients/main/pi/add_4_grad/Reshape_1Reshape"gradients/main/pi/add_4_grad/Sum_1$gradients/main/pi/add_4_grad/Shape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0

-gradients/main/pi/add_4_grad/tuple/group_depsNoOp%^gradients/main/pi/add_4_grad/Reshape'^gradients/main/pi/add_4_grad/Reshape_1

5gradients/main/pi/add_4_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_4_grad/Reshape.^gradients/main/pi/add_4_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_4_grad/Reshape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

7gradients/main/pi/add_4_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_4_grad/Reshape_1.^gradients/main/pi/add_4_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*9
_class/
-+loc:@gradients/main/pi/add_4_grad/Reshape_1
o
"gradients/main/pi/add_7_grad/ShapeShapemain/pi/sub_1*
_output_shapes
:*
out_type0*
T0
x
$gradients/main/pi/add_7_grad/Shape_1Shapemain/pi/StopGradient*
_output_shapes
:*
out_type0*
T0
Ò
2gradients/main/pi/add_7_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_7_grad/Shape$gradients/main/pi/add_7_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
Ò
 gradients/main/pi/add_7_grad/SumSum5gradients/main/pi/add_8_grad/tuple/control_dependency2gradients/main/pi/add_7_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:
µ
$gradients/main/pi/add_7_grad/ReshapeReshape gradients/main/pi/add_7_grad/Sum"gradients/main/pi/add_7_grad/Shape*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ö
"gradients/main/pi/add_7_grad/Sum_1Sum5gradients/main/pi/add_8_grad/tuple/control_dependency4gradients/main/pi/add_7_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *
T0*

Tidx0
»
&gradients/main/pi/add_7_grad/Reshape_1Reshape"gradients/main/pi/add_7_grad/Sum_1$gradients/main/pi/add_7_grad/Shape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0

-gradients/main/pi/add_7_grad/tuple/group_depsNoOp%^gradients/main/pi/add_7_grad/Reshape'^gradients/main/pi/add_7_grad/Reshape_1

5gradients/main/pi/add_7_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_7_grad/Reshape.^gradients/main/pi/add_7_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*7
_class-
+)loc:@gradients/main/pi/add_7_grad/Reshape*
T0

7gradients/main/pi/add_7_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_7_grad/Reshape_1.^gradients/main/pi/add_7_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/add_7_grad/Reshape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ñ
.gradients/main/q1_1/dense_1/MatMul_grad/MatMulMatMulAgradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependencymain/q1/dense_1/kernel/read*
transpose_b(*
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
ä
0gradients/main/q1_1/dense_1/MatMul_grad/MatMul_1MatMulmain/q1_1/dense/ReluAgradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(* 
_output_shapes
:
¬
¤
8gradients/main/q1_1/dense_1/MatMul_grad/tuple/group_depsNoOp/^gradients/main/q1_1/dense_1/MatMul_grad/MatMul1^gradients/main/q1_1/dense_1/MatMul_grad/MatMul_1
­
@gradients/main/q1_1/dense_1/MatMul_grad/tuple/control_dependencyIdentity.gradients/main/q1_1/dense_1/MatMul_grad/MatMul9^gradients/main/q1_1/dense_1/MatMul_grad/tuple/group_deps*A
_class7
53loc:@gradients/main/q1_1/dense_1/MatMul_grad/MatMul*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
«
Bgradients/main/q1_1/dense_1/MatMul_grad/tuple/control_dependency_1Identity0gradients/main/q1_1/dense_1/MatMul_grad/MatMul_19^gradients/main/q1_1/dense_1/MatMul_grad/tuple/group_deps* 
_output_shapes
:
¬*C
_class9
75loc:@gradients/main/q1_1/dense_1/MatMul_grad/MatMul_1*
T0
o
 gradients/main/pi/pow_grad/ShapeShapemain/pi/truediv*
T0*
_output_shapes
:*
out_type0
m
"gradients/main/pi/pow_grad/Shape_1Shapemain/pi/pow/y*
T0*
_output_shapes
: *
out_type0
Ì
0gradients/main/pi/pow_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/pow_grad/Shape"gradients/main/pi/pow_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0

gradients/main/pi/pow_grad/mulMul5gradients/main/pi/add_4_grad/tuple/control_dependencymain/pi/pow/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
e
 gradients/main/pi/pow_grad/sub/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
w
gradients/main/pi/pow_grad/subSubmain/pi/pow/y gradients/main/pi/pow_grad/sub/y*
T0*
_output_shapes
: 

gradients/main/pi/pow_grad/PowPowmain/pi/truedivgradients/main/pi/pow_grad/sub*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

 gradients/main/pi/pow_grad/mul_1Mulgradients/main/pi/pow_grad/mulgradients/main/pi/pow_grad/Pow*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¹
gradients/main/pi/pow_grad/SumSum gradients/main/pi/pow_grad/mul_10gradients/main/pi/pow_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
¯
"gradients/main/pi/pow_grad/ReshapeReshapegradients/main/pi/pow_grad/Sum gradients/main/pi/pow_grad/Shape*
T0*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
i
$gradients/main/pi/pow_grad/Greater/yConst*
_output_shapes
: *
valueB
 *    *
dtype0

"gradients/main/pi/pow_grad/GreaterGreatermain/pi/truediv$gradients/main/pi/pow_grad/Greater/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
y
*gradients/main/pi/pow_grad/ones_like/ShapeShapemain/pi/truediv*
T0*
_output_shapes
:*
out_type0
o
*gradients/main/pi/pow_grad/ones_like/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
È
$gradients/main/pi/pow_grad/ones_likeFill*gradients/main/pi/pow_grad/ones_like/Shape*gradients/main/pi/pow_grad/ones_like/Const*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

index_type0
¸
!gradients/main/pi/pow_grad/SelectSelect"gradients/main/pi/pow_grad/Greatermain/pi/truediv$gradients/main/pi/pow_grad/ones_like*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
z
gradients/main/pi/pow_grad/LogLog!gradients/main/pi/pow_grad/Select*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
u
%gradients/main/pi/pow_grad/zeros_like	ZerosLikemain/pi/truediv*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ê
#gradients/main/pi/pow_grad/Select_1Select"gradients/main/pi/pow_grad/Greatergradients/main/pi/pow_grad/Log%gradients/main/pi/pow_grad/zeros_like*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

 gradients/main/pi/pow_grad/mul_2Mul5gradients/main/pi/add_4_grad/tuple/control_dependencymain/pi/pow*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
 
 gradients/main/pi/pow_grad/mul_3Mul gradients/main/pi/pow_grad/mul_2#gradients/main/pi/pow_grad/Select_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
½
 gradients/main/pi/pow_grad/Sum_1Sum gradients/main/pi/pow_grad/mul_32gradients/main/pi/pow_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
¤
$gradients/main/pi/pow_grad/Reshape_1Reshape gradients/main/pi/pow_grad/Sum_1"gradients/main/pi/pow_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0

+gradients/main/pi/pow_grad/tuple/group_depsNoOp#^gradients/main/pi/pow_grad/Reshape%^gradients/main/pi/pow_grad/Reshape_1
ú
3gradients/main/pi/pow_grad/tuple/control_dependencyIdentity"gradients/main/pi/pow_grad/Reshape,^gradients/main/pi/pow_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*5
_class+
)'loc:@gradients/main/pi/pow_grad/Reshape
ï
5gradients/main/pi/pow_grad/tuple/control_dependency_1Identity$gradients/main/pi/pow_grad/Reshape_1,^gradients/main/pi/pow_grad/tuple/group_deps*
_output_shapes
: *
T0*7
_class-
+)loc:@gradients/main/pi/pow_grad/Reshape_1
o
"gradients/main/pi/mul_2_grad/ShapeShapemain/pi/mul_2/x*
_output_shapes
: *
T0*
out_type0
q
$gradients/main/pi/mul_2_grad/Shape_1Shapemain/pi/add_1*
out_type0*
T0*
_output_shapes
:
Ò
2gradients/main/pi/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/mul_2_grad/Shape$gradients/main/pi/mul_2_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
¡
 gradients/main/pi/mul_2_grad/MulMul7gradients/main/pi/add_4_grad/tuple/control_dependency_1main/pi/add_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
½
 gradients/main/pi/mul_2_grad/SumSum gradients/main/pi/mul_2_grad/Mul2gradients/main/pi/mul_2_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0*
_output_shapes
:
¤
$gradients/main/pi/mul_2_grad/ReshapeReshape gradients/main/pi/mul_2_grad/Sum"gradients/main/pi/mul_2_grad/Shape*
_output_shapes
: *
Tshape0*
T0
¥
"gradients/main/pi/mul_2_grad/Mul_1Mulmain/pi/mul_2/x7gradients/main/pi/add_4_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Ã
"gradients/main/pi/mul_2_grad/Sum_1Sum"gradients/main/pi/mul_2_grad/Mul_14gradients/main/pi/mul_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *
T0*

Tidx0
»
&gradients/main/pi/mul_2_grad/Reshape_1Reshape"gradients/main/pi/mul_2_grad/Sum_1$gradients/main/pi/mul_2_grad/Shape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0

-gradients/main/pi/mul_2_grad/tuple/group_depsNoOp%^gradients/main/pi/mul_2_grad/Reshape'^gradients/main/pi/mul_2_grad/Reshape_1
ñ
5gradients/main/pi/mul_2_grad/tuple/control_dependencyIdentity$gradients/main/pi/mul_2_grad/Reshape.^gradients/main/pi/mul_2_grad/tuple/group_deps*
_output_shapes
: *7
_class-
+)loc:@gradients/main/pi/mul_2_grad/Reshape*
T0

7gradients/main/pi/mul_2_grad/tuple/control_dependency_1Identity&gradients/main/pi/mul_2_grad/Reshape_1.^gradients/main/pi/mul_2_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/mul_2_grad/Reshape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Ã
,gradients/main/q1_1/dense/Relu_grad/ReluGradReluGrad@gradients/main/q1_1/dense_1/MatMul_grad/tuple/control_dependencymain/q1_1/dense/Relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
o
$gradients/main/pi/truediv_grad/ShapeShapemain/pi/sub*
_output_shapes
:*
out_type0*
T0
s
&gradients/main/pi/truediv_grad/Shape_1Shapemain/pi/add_3*
T0*
out_type0*
_output_shapes
:
Ø
4gradients/main/pi/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients/main/pi/truediv_grad/Shape&gradients/main/pi/truediv_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
§
&gradients/main/pi/truediv_grad/RealDivRealDiv3gradients/main/pi/pow_grad/tuple/control_dependencymain/pi/add_3*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Ç
"gradients/main/pi/truediv_grad/SumSum&gradients/main/pi/truediv_grad/RealDiv4gradients/main/pi/truediv_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
»
&gradients/main/pi/truediv_grad/ReshapeReshape"gradients/main/pi/truediv_grad/Sum$gradients/main/pi/truediv_grad/Shape*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
h
"gradients/main/pi/truediv_grad/NegNegmain/pi/sub*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

(gradients/main/pi/truediv_grad/RealDiv_1RealDiv"gradients/main/pi/truediv_grad/Negmain/pi/add_3*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

(gradients/main/pi/truediv_grad/RealDiv_2RealDiv(gradients/main/pi/truediv_grad/RealDiv_1main/pi/add_3*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
º
"gradients/main/pi/truediv_grad/mulMul3gradients/main/pi/pow_grad/tuple/control_dependency(gradients/main/pi/truediv_grad/RealDiv_2*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ç
$gradients/main/pi/truediv_grad/Sum_1Sum"gradients/main/pi/truediv_grad/mul6gradients/main/pi/truediv_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
T0*
	keep_dims( 
Á
(gradients/main/pi/truediv_grad/Reshape_1Reshape$gradients/main/pi/truediv_grad/Sum_1&gradients/main/pi/truediv_grad/Shape_1*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

/gradients/main/pi/truediv_grad/tuple/group_depsNoOp'^gradients/main/pi/truediv_grad/Reshape)^gradients/main/pi/truediv_grad/Reshape_1

7gradients/main/pi/truediv_grad/tuple/control_dependencyIdentity&gradients/main/pi/truediv_grad/Reshape0^gradients/main/pi/truediv_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/truediv_grad/Reshape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

9gradients/main/pi/truediv_grad/tuple/control_dependency_1Identity(gradients/main/pi/truediv_grad/Reshape_10^gradients/main/pi/truediv_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*;
_class1
/-loc:@gradients/main/pi/truediv_grad/Reshape_1
¬
2gradients/main/q1_1/dense/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients/main/q1_1/dense/Relu_grad/ReluGrad*
data_formatNHWC*
T0*
_output_shapes	
:
£
7gradients/main/q1_1/dense/BiasAdd_grad/tuple/group_depsNoOp3^gradients/main/q1_1/dense/BiasAdd_grad/BiasAddGrad-^gradients/main/q1_1/dense/Relu_grad/ReluGrad
§
?gradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependencyIdentity,gradients/main/q1_1/dense/Relu_grad/ReluGrad8^gradients/main/q1_1/dense/BiasAdd_grad/tuple/group_deps*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*?
_class5
31loc:@gradients/main/q1_1/dense/Relu_grad/ReluGrad
¨
Agradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/q1_1/dense/BiasAdd_grad/BiasAddGrad8^gradients/main/q1_1/dense/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:*E
_class;
97loc:@gradients/main/q1_1/dense/BiasAdd_grad/BiasAddGrad*
T0
m
 gradients/main/pi/sub_grad/ShapeShapemain/pi/add_2*
out_type0*
_output_shapes
:*
T0
y
"gradients/main/pi/sub_grad/Shape_1Shapemain/pi/dense_2/BiasAdd*
_output_shapes
:*
out_type0*
T0
Ì
0gradients/main/pi/sub_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/sub_grad/Shape"gradients/main/pi/sub_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
Ğ
gradients/main/pi/sub_grad/SumSum7gradients/main/pi/truediv_grad/tuple/control_dependency0gradients/main/pi/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *
T0*

Tidx0
¯
"gradients/main/pi/sub_grad/ReshapeReshapegradients/main/pi/sub_grad/Sum gradients/main/pi/sub_grad/Shape*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

gradients/main/pi/sub_grad/NegNeg7gradients/main/pi/truediv_grad/tuple/control_dependency*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
»
 gradients/main/pi/sub_grad/Sum_1Sumgradients/main/pi/sub_grad/Neg2gradients/main/pi/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
µ
$gradients/main/pi/sub_grad/Reshape_1Reshape gradients/main/pi/sub_grad/Sum_1"gradients/main/pi/sub_grad/Shape_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
Tshape0

+gradients/main/pi/sub_grad/tuple/group_depsNoOp#^gradients/main/pi/sub_grad/Reshape%^gradients/main/pi/sub_grad/Reshape_1
ú
3gradients/main/pi/sub_grad/tuple/control_dependencyIdentity"gradients/main/pi/sub_grad/Reshape,^gradients/main/pi/sub_grad/tuple/group_deps*5
_class+
)'loc:@gradients/main/pi/sub_grad/Reshape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

5gradients/main/pi/sub_grad/tuple/control_dependency_1Identity$gradients/main/pi/sub_grad/Reshape_1,^gradients/main/pi/sub_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*7
_class-
+)loc:@gradients/main/pi/sub_grad/Reshape_1
o
"gradients/main/pi/add_3_grad/ShapeShapemain/pi/Exp_1*
_output_shapes
:*
out_type0*
T0
q
$gradients/main/pi/add_3_grad/Shape_1Shapemain/pi/add_3/y*
_output_shapes
: *
T0*
out_type0
Ò
2gradients/main/pi/add_3_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_3_grad/Shape$gradients/main/pi/add_3_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
Ö
 gradients/main/pi/add_3_grad/SumSum9gradients/main/pi/truediv_grad/tuple/control_dependency_12gradients/main/pi/add_3_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
µ
$gradients/main/pi/add_3_grad/ReshapeReshape gradients/main/pi/add_3_grad/Sum"gradients/main/pi/add_3_grad/Shape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0
Ú
"gradients/main/pi/add_3_grad/Sum_1Sum9gradients/main/pi/truediv_grad/tuple/control_dependency_14gradients/main/pi/add_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
ª
&gradients/main/pi/add_3_grad/Reshape_1Reshape"gradients/main/pi/add_3_grad/Sum_1$gradients/main/pi/add_3_grad/Shape_1*
T0*
_output_shapes
: *
Tshape0

-gradients/main/pi/add_3_grad/tuple/group_depsNoOp%^gradients/main/pi/add_3_grad/Reshape'^gradients/main/pi/add_3_grad/Reshape_1

5gradients/main/pi/add_3_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_3_grad/Reshape.^gradients/main/pi/add_3_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/add_3_grad/Reshape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
÷
7gradients/main/pi/add_3_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_3_grad/Reshape_1.^gradients/main/pi/add_3_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/add_3_grad/Reshape_1*
T0*
_output_shapes
: 
ê
,gradients/main/q1_1/dense/MatMul_grad/MatMulMatMul?gradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependencymain/q1/dense/kernel/read*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
T0*
transpose_b(*
transpose_a( 
Û
.gradients/main/q1_1/dense/MatMul_grad/MatMul_1MatMulmain/q1_1/concat?gradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
_output_shapes
:	B*
T0*
transpose_b( 

6gradients/main/q1_1/dense/MatMul_grad/tuple/group_depsNoOp-^gradients/main/q1_1/dense/MatMul_grad/MatMul/^gradients/main/q1_1/dense/MatMul_grad/MatMul_1
¤
>gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/q1_1/dense/MatMul_grad/MatMul7^gradients/main/q1_1/dense/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/q1_1/dense/MatMul_grad/MatMul*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
T0
¢
@gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/q1_1/dense/MatMul_grad/MatMul_17^gradients/main/q1_1/dense/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/main/q1_1/dense/MatMul_grad/MatMul_1*
_output_shapes
:	B

 gradients/main/pi/Exp_1_grad/mulMul5gradients/main/pi/add_3_grad/tuple/control_dependencymain/pi/Exp_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
f
$gradients/main/q1_1/concat_grad/RankConst*
_output_shapes
: *
value	B :*
dtype0

#gradients/main/q1_1/concat_grad/modFloorModmain/q1_1/concat/axis$gradients/main/q1_1/concat_grad/Rank*
T0*
_output_shapes
: 
r
%gradients/main/q1_1/concat_grad/ShapeShapePlaceholder_1*
_output_shapes
:*
out_type0*
T0

&gradients/main/q1_1/concat_grad/ShapeNShapeNPlaceholder_1
main/mul_1* 
_output_shapes
::*
out_type0*
T0*
N
Ş
,gradients/main/q1_1/concat_grad/ConcatOffsetConcatOffset#gradients/main/q1_1/concat_grad/mod&gradients/main/q1_1/concat_grad/ShapeN(gradients/main/q1_1/concat_grad/ShapeN:1*
N* 
_output_shapes
::

%gradients/main/q1_1/concat_grad/SliceSlice>gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependency,gradients/main/q1_1/concat_grad/ConcatOffset&gradients/main/q1_1/concat_grad/ShapeN*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6*
T0*
Index0

'gradients/main/q1_1/concat_grad/Slice_1Slice>gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependency.gradients/main/q1_1/concat_grad/ConcatOffset:1(gradients/main/q1_1/concat_grad/ShapeN:1*
Index0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

0gradients/main/q1_1/concat_grad/tuple/group_depsNoOp&^gradients/main/q1_1/concat_grad/Slice(^gradients/main/q1_1/concat_grad/Slice_1

8gradients/main/q1_1/concat_grad/tuple/control_dependencyIdentity%gradients/main/q1_1/concat_grad/Slice1^gradients/main/q1_1/concat_grad/tuple/group_deps*8
_class.
,*loc:@gradients/main/q1_1/concat_grad/Slice*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6

:gradients/main/q1_1/concat_grad/tuple/control_dependency_1Identity'gradients/main/q1_1/concat_grad/Slice_11^gradients/main/q1_1/concat_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*:
_class0
.,loc:@gradients/main/q1_1/concat_grad/Slice_1
o
"gradients/main/pi/sub_1_grad/ShapeShapemain/pi/sub_1/x*
T0*
_output_shapes
: *
out_type0
q
$gradients/main/pi/sub_1_grad/Shape_1Shapemain/pi/pow_1*
out_type0*
_output_shapes
:*
T0
Ò
2gradients/main/pi/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/sub_1_grad/Shape$gradients/main/pi/sub_1_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
Ò
 gradients/main/pi/sub_1_grad/SumSum5gradients/main/pi/add_7_grad/tuple/control_dependency2gradients/main/pi/sub_1_grad/BroadcastGradientArgs*
	keep_dims( *
_output_shapes
:*

Tidx0*
T0
¤
$gradients/main/pi/sub_1_grad/ReshapeReshape gradients/main/pi/sub_1_grad/Sum"gradients/main/pi/sub_1_grad/Shape*
T0*
Tshape0*
_output_shapes
: 

 gradients/main/pi/sub_1_grad/NegNeg5gradients/main/pi/add_7_grad/tuple/control_dependency*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Á
"gradients/main/pi/sub_1_grad/Sum_1Sum gradients/main/pi/sub_1_grad/Neg4gradients/main/pi/sub_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
_output_shapes
:*
	keep_dims( 
»
&gradients/main/pi/sub_1_grad/Reshape_1Reshape"gradients/main/pi/sub_1_grad/Sum_1$gradients/main/pi/sub_1_grad/Shape_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0

-gradients/main/pi/sub_1_grad/tuple/group_depsNoOp%^gradients/main/pi/sub_1_grad/Reshape'^gradients/main/pi/sub_1_grad/Reshape_1
ñ
5gradients/main/pi/sub_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/sub_1_grad/Reshape.^gradients/main/pi/sub_1_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/sub_1_grad/Reshape*
T0*
_output_shapes
: 

7gradients/main/pi/sub_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/sub_1_grad/Reshape_1.^gradients/main/pi/sub_1_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*9
_class/
-+loc:@gradients/main/pi/sub_1_grad/Reshape_1
m
gradients/main/mul_1_grad/ShapeShapemain/pi/Tanh_1*
T0*
out_type0*
_output_shapes
:
k
!gradients/main/mul_1_grad/Shape_1Shapemain/mul_1/y*
out_type0*
_output_shapes
: *
T0
É
/gradients/main/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/main/mul_1_grad/Shape!gradients/main/mul_1_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
 
gradients/main/mul_1_grad/MulMul:gradients/main/q1_1/concat_grad/tuple/control_dependency_1main/mul_1/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
´
gradients/main/mul_1_grad/SumSumgradients/main/mul_1_grad/Mul/gradients/main/mul_1_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
¬
!gradients/main/mul_1_grad/ReshapeReshapegradients/main/mul_1_grad/Sumgradients/main/mul_1_grad/Shape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0
¤
gradients/main/mul_1_grad/Mul_1Mulmain/pi/Tanh_1:gradients/main/q1_1/concat_grad/tuple/control_dependency_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
º
gradients/main/mul_1_grad/Sum_1Sumgradients/main/mul_1_grad/Mul_11gradients/main/mul_1_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
¡
#gradients/main/mul_1_grad/Reshape_1Reshapegradients/main/mul_1_grad/Sum_1!gradients/main/mul_1_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0
|
*gradients/main/mul_1_grad/tuple/group_depsNoOp"^gradients/main/mul_1_grad/Reshape$^gradients/main/mul_1_grad/Reshape_1
ö
2gradients/main/mul_1_grad/tuple/control_dependencyIdentity!gradients/main/mul_1_grad/Reshape+^gradients/main/mul_1_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*4
_class*
(&loc:@gradients/main/mul_1_grad/Reshape*
T0
ë
4gradients/main/mul_1_grad/tuple/control_dependency_1Identity#gradients/main/mul_1_grad/Reshape_1+^gradients/main/mul_1_grad/tuple/group_deps*6
_class,
*(loc:@gradients/main/mul_1_grad/Reshape_1*
_output_shapes
: *
T0
p
"gradients/main/pi/pow_1_grad/ShapeShapemain/pi/Tanh_1*
_output_shapes
:*
T0*
out_type0
q
$gradients/main/pi/pow_1_grad/Shape_1Shapemain/pi/pow_1/y*
out_type0*
T0*
_output_shapes
: 
Ò
2gradients/main/pi/pow_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/pow_1_grad/Shape$gradients/main/pi/pow_1_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
£
 gradients/main/pi/pow_1_grad/mulMul7gradients/main/pi/sub_1_grad/tuple/control_dependency_1main/pi/pow_1/y*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
g
"gradients/main/pi/pow_1_grad/sub/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
}
 gradients/main/pi/pow_1_grad/subSubmain/pi/pow_1/y"gradients/main/pi/pow_1_grad/sub/y*
_output_shapes
: *
T0

 gradients/main/pi/pow_1_grad/PowPowmain/pi/Tanh_1 gradients/main/pi/pow_1_grad/sub*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

"gradients/main/pi/pow_1_grad/mul_1Mul gradients/main/pi/pow_1_grad/mul gradients/main/pi/pow_1_grad/Pow*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¿
 gradients/main/pi/pow_1_grad/SumSum"gradients/main/pi/pow_1_grad/mul_12gradients/main/pi/pow_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:
µ
$gradients/main/pi/pow_1_grad/ReshapeReshape gradients/main/pi/pow_1_grad/Sum"gradients/main/pi/pow_1_grad/Shape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
Tshape0
k
&gradients/main/pi/pow_1_grad/Greater/yConst*
valueB
 *    *
_output_shapes
: *
dtype0

$gradients/main/pi/pow_1_grad/GreaterGreatermain/pi/Tanh_1&gradients/main/pi/pow_1_grad/Greater/y*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
z
,gradients/main/pi/pow_1_grad/ones_like/ShapeShapemain/pi/Tanh_1*
_output_shapes
:*
out_type0*
T0
q
,gradients/main/pi/pow_1_grad/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
Î
&gradients/main/pi/pow_1_grad/ones_likeFill,gradients/main/pi/pow_1_grad/ones_like/Shape,gradients/main/pi/pow_1_grad/ones_like/Const*

index_type0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
½
#gradients/main/pi/pow_1_grad/SelectSelect$gradients/main/pi/pow_1_grad/Greatermain/pi/Tanh_1&gradients/main/pi/pow_1_grad/ones_like*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
~
 gradients/main/pi/pow_1_grad/LogLog#gradients/main/pi/pow_1_grad/Select*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
v
'gradients/main/pi/pow_1_grad/zeros_like	ZerosLikemain/pi/Tanh_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ò
%gradients/main/pi/pow_1_grad/Select_1Select$gradients/main/pi/pow_1_grad/Greater gradients/main/pi/pow_1_grad/Log'gradients/main/pi/pow_1_grad/zeros_like*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
£
"gradients/main/pi/pow_1_grad/mul_2Mul7gradients/main/pi/sub_1_grad/tuple/control_dependency_1main/pi/pow_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¦
"gradients/main/pi/pow_1_grad/mul_3Mul"gradients/main/pi/pow_1_grad/mul_2%gradients/main/pi/pow_1_grad/Select_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ã
"gradients/main/pi/pow_1_grad/Sum_1Sum"gradients/main/pi/pow_1_grad/mul_34gradients/main/pi/pow_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
ª
&gradients/main/pi/pow_1_grad/Reshape_1Reshape"gradients/main/pi/pow_1_grad/Sum_1$gradients/main/pi/pow_1_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0

-gradients/main/pi/pow_1_grad/tuple/group_depsNoOp%^gradients/main/pi/pow_1_grad/Reshape'^gradients/main/pi/pow_1_grad/Reshape_1

5gradients/main/pi/pow_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/pow_1_grad/Reshape.^gradients/main/pi/pow_1_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/pow_1_grad/Reshape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
÷
7gradients/main/pi/pow_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/pow_1_grad/Reshape_1.^gradients/main/pi/pow_1_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/pow_1_grad/Reshape_1*
_output_shapes
: *
T0
ò
gradients/AddNAddN2gradients/main/mul_1_grad/tuple/control_dependency5gradients/main/pi/pow_1_grad/tuple/control_dependency*
N*
T0*4
_class*
(&loc:@gradients/main/mul_1_grad/Reshape*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

&gradients/main/pi/Tanh_1_grad/TanhGradTanhGradmain/pi/Tanh_1gradients/AddN*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ç
gradients/AddN_1AddN3gradients/main/pi/sub_grad/tuple/control_dependency&gradients/main/pi/Tanh_1_grad/TanhGrad*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*5
_class+
)'loc:@gradients/main/pi/sub_grad/Reshape*
N
y
"gradients/main/pi/add_2_grad/ShapeShapemain/pi/dense_2/BiasAdd*
_output_shapes
:*
out_type0*
T0
q
$gradients/main/pi/add_2_grad/Shape_1Shapemain/pi/mul_1*
T0*
_output_shapes
:*
out_type0
Ò
2gradients/main/pi/add_2_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_2_grad/Shape$gradients/main/pi/add_2_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
­
 gradients/main/pi/add_2_grad/SumSumgradients/AddN_12gradients/main/pi/add_2_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *
T0*

Tidx0
µ
$gradients/main/pi/add_2_grad/ReshapeReshape gradients/main/pi/add_2_grad/Sum"gradients/main/pi/add_2_grad/Shape*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
±
"gradients/main/pi/add_2_grad/Sum_1Sumgradients/AddN_14gradients/main/pi/add_2_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
»
&gradients/main/pi/add_2_grad/Reshape_1Reshape"gradients/main/pi/add_2_grad/Sum_1$gradients/main/pi/add_2_grad/Shape_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
Tshape0

-gradients/main/pi/add_2_grad/tuple/group_depsNoOp%^gradients/main/pi/add_2_grad/Reshape'^gradients/main/pi/add_2_grad/Reshape_1

5gradients/main/pi/add_2_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_2_grad/Reshape.^gradients/main/pi/add_2_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*7
_class-
+)loc:@gradients/main/pi/add_2_grad/Reshape*
T0

7gradients/main/pi/add_2_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_2_grad/Reshape_1.^gradients/main/pi/add_2_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*9
_class/
-+loc:@gradients/main/pi/add_2_grad/Reshape_1
ú
gradients/AddN_2AddN5gradients/main/pi/sub_grad/tuple/control_dependency_15gradients/main/pi/add_2_grad/tuple/control_dependency*7
_class-
+)loc:@gradients/main/pi/sub_grad/Reshape_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*
N

2gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_2*
_output_shapes
:*
T0*
data_formatNHWC

7gradients/main/pi/dense_2/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_23^gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGrad

?gradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_28^gradients/main/pi/dense_2/BiasAdd_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/sub_grad/Reshape_1*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
§
Agradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGrad8^gradients/main/pi/dense_2/BiasAdd_grad/tuple/group_deps*E
_class;
97loc:@gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:
w
"gradients/main/pi/mul_1_grad/ShapeShapemain/pi/random_normal*
_output_shapes
:*
out_type0*
T0
o
$gradients/main/pi/mul_1_grad/Shape_1Shapemain/pi/Exp*
_output_shapes
:*
out_type0*
T0
Ò
2gradients/main/pi/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/mul_1_grad/Shape$gradients/main/pi/mul_1_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0

 gradients/main/pi/mul_1_grad/MulMul7gradients/main/pi/add_2_grad/tuple/control_dependency_1main/pi/Exp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
½
 gradients/main/pi/mul_1_grad/SumSum gradients/main/pi/mul_1_grad/Mul2gradients/main/pi/mul_1_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
_output_shapes
:*
T0
µ
$gradients/main/pi/mul_1_grad/ReshapeReshape gradients/main/pi/mul_1_grad/Sum"gradients/main/pi/mul_1_grad/Shape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0
«
"gradients/main/pi/mul_1_grad/Mul_1Mulmain/pi/random_normal7gradients/main/pi/add_2_grad/tuple/control_dependency_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Ã
"gradients/main/pi/mul_1_grad/Sum_1Sum"gradients/main/pi/mul_1_grad/Mul_14gradients/main/pi/mul_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
_output_shapes
:*
T0
»
&gradients/main/pi/mul_1_grad/Reshape_1Reshape"gradients/main/pi/mul_1_grad/Sum_1$gradients/main/pi/mul_1_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

-gradients/main/pi/mul_1_grad/tuple/group_depsNoOp%^gradients/main/pi/mul_1_grad/Reshape'^gradients/main/pi/mul_1_grad/Reshape_1

5gradients/main/pi/mul_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/mul_1_grad/Reshape.^gradients/main/pi/mul_1_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*7
_class-
+)loc:@gradients/main/pi/mul_1_grad/Reshape*
T0

7gradients/main/pi/mul_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/mul_1_grad/Reshape_1.^gradients/main/pi/mul_1_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*9
_class/
-+loc:@gradients/main/pi/mul_1_grad/Reshape_1*
T0
í
,gradients/main/pi/dense_2/MatMul_grad/MatMulMatMul?gradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependencymain/pi/dense_2/kernel/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
transpose_b(*
transpose_a( 
ß
.gradients/main/pi/dense_2/MatMul_grad/MatMul_1MatMulmain/pi/dense_1/Relu?gradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	¬*
transpose_a(*
transpose_b( *
T0

6gradients/main/pi/dense_2/MatMul_grad/tuple/group_depsNoOp-^gradients/main/pi/dense_2/MatMul_grad/MatMul/^gradients/main/pi/dense_2/MatMul_grad/MatMul_1
¥
>gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_2/MatMul_grad/MatMul7^gradients/main/pi/dense_2/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/main/pi/dense_2/MatMul_grad/MatMul*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
¢
@gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/pi/dense_2/MatMul_grad/MatMul_17^gradients/main/pi/dense_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes
:	¬*A
_class7
53loc:@gradients/main/pi/dense_2/MatMul_grad/MatMul_1

gradients/main/pi/Exp_grad/mulMul7gradients/main/pi/mul_1_grad/tuple/control_dependency_1main/pi/Exp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

gradients/AddN_3AddN7gradients/main/pi/mul_2_grad/tuple/control_dependency_1 gradients/main/pi/Exp_1_grad/mulgradients/main/pi/Exp_grad/mul*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
N*
T0*9
_class/
-+loc:@gradients/main/pi/mul_2_grad/Reshape_1
o
"gradients/main/pi/add_1_grad/ShapeShapemain/pi/add_1/x*
out_type0*
_output_shapes
: *
T0
o
$gradients/main/pi/add_1_grad/Shape_1Shapemain/pi/mul*
T0*
_output_shapes
:*
out_type0
Ò
2gradients/main/pi/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_1_grad/Shape$gradients/main/pi/add_1_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
­
 gradients/main/pi/add_1_grad/SumSumgradients/AddN_32gradients/main/pi/add_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
_output_shapes
:*
T0
¤
$gradients/main/pi/add_1_grad/ReshapeReshape gradients/main/pi/add_1_grad/Sum"gradients/main/pi/add_1_grad/Shape*
Tshape0*
T0*
_output_shapes
: 
±
"gradients/main/pi/add_1_grad/Sum_1Sumgradients/AddN_34gradients/main/pi/add_1_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
»
&gradients/main/pi/add_1_grad/Reshape_1Reshape"gradients/main/pi/add_1_grad/Sum_1$gradients/main/pi/add_1_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

-gradients/main/pi/add_1_grad/tuple/group_depsNoOp%^gradients/main/pi/add_1_grad/Reshape'^gradients/main/pi/add_1_grad/Reshape_1
ñ
5gradients/main/pi/add_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_1_grad/Reshape.^gradients/main/pi/add_1_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/add_1_grad/Reshape*
_output_shapes
: 

7gradients/main/pi/add_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_1_grad/Reshape_1.^gradients/main/pi/add_1_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*9
_class/
-+loc:@gradients/main/pi/add_1_grad/Reshape_1
k
 gradients/main/pi/mul_grad/ShapeShapemain/pi/mul/x*
_output_shapes
: *
out_type0*
T0
m
"gradients/main/pi/mul_grad/Shape_1Shapemain/pi/add*
out_type0*
T0*
_output_shapes
:
Ì
0gradients/main/pi/mul_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/mul_grad/Shape"gradients/main/pi/mul_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0

gradients/main/pi/mul_grad/MulMul7gradients/main/pi/add_1_grad/tuple/control_dependency_1main/pi/add*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
·
gradients/main/pi/mul_grad/SumSumgradients/main/pi/mul_grad/Mul0gradients/main/pi/mul_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*

Tidx0*
	keep_dims( 

"gradients/main/pi/mul_grad/ReshapeReshapegradients/main/pi/mul_grad/Sum gradients/main/pi/mul_grad/Shape*
T0*
_output_shapes
: *
Tshape0
¡
 gradients/main/pi/mul_grad/Mul_1Mulmain/pi/mul/x7gradients/main/pi/add_1_grad/tuple/control_dependency_1*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
½
 gradients/main/pi/mul_grad/Sum_1Sum gradients/main/pi/mul_grad/Mul_12gradients/main/pi/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
T0*
	keep_dims( 
µ
$gradients/main/pi/mul_grad/Reshape_1Reshape gradients/main/pi/mul_grad/Sum_1"gradients/main/pi/mul_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

+gradients/main/pi/mul_grad/tuple/group_depsNoOp#^gradients/main/pi/mul_grad/Reshape%^gradients/main/pi/mul_grad/Reshape_1
é
3gradients/main/pi/mul_grad/tuple/control_dependencyIdentity"gradients/main/pi/mul_grad/Reshape,^gradients/main/pi/mul_grad/tuple/group_deps*
_output_shapes
: *5
_class+
)'loc:@gradients/main/pi/mul_grad/Reshape*
T0

5gradients/main/pi/mul_grad/tuple/control_dependency_1Identity$gradients/main/pi/mul_grad/Reshape_1,^gradients/main/pi/mul_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*7
_class-
+)loc:@gradients/main/pi/mul_grad/Reshape_1
t
 gradients/main/pi/add_grad/ShapeShapemain/pi/dense_3/Tanh*
out_type0*
T0*
_output_shapes
:
m
"gradients/main/pi/add_grad/Shape_1Shapemain/pi/add/y*
_output_shapes
: *
T0*
out_type0
Ì
0gradients/main/pi/add_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/add_grad/Shape"gradients/main/pi/add_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
Î
gradients/main/pi/add_grad/SumSum5gradients/main/pi/mul_grad/tuple/control_dependency_10gradients/main/pi/add_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0*
_output_shapes
:
¯
"gradients/main/pi/add_grad/ReshapeReshapegradients/main/pi/add_grad/Sum gradients/main/pi/add_grad/Shape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0
Ò
 gradients/main/pi/add_grad/Sum_1Sum5gradients/main/pi/mul_grad/tuple/control_dependency_12gradients/main/pi/add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
_output_shapes
:*
T0
¤
$gradients/main/pi/add_grad/Reshape_1Reshape gradients/main/pi/add_grad/Sum_1"gradients/main/pi/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 

+gradients/main/pi/add_grad/tuple/group_depsNoOp#^gradients/main/pi/add_grad/Reshape%^gradients/main/pi/add_grad/Reshape_1
ú
3gradients/main/pi/add_grad/tuple/control_dependencyIdentity"gradients/main/pi/add_grad/Reshape,^gradients/main/pi/add_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*5
_class+
)'loc:@gradients/main/pi/add_grad/Reshape*
T0
ï
5gradients/main/pi/add_grad/tuple/control_dependency_1Identity$gradients/main/pi/add_grad/Reshape_1,^gradients/main/pi/add_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/add_grad/Reshape_1*
_output_shapes
: 
µ
,gradients/main/pi/dense_3/Tanh_grad/TanhGradTanhGradmain/pi/dense_3/Tanh3gradients/main/pi/add_grad/tuple/control_dependency*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
«
2gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients/main/pi/dense_3/Tanh_grad/TanhGrad*
T0*
_output_shapes
:*
data_formatNHWC
£
7gradients/main/pi/dense_3/BiasAdd_grad/tuple/group_depsNoOp3^gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGrad-^gradients/main/pi/dense_3/Tanh_grad/TanhGrad
¦
?gradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_3/Tanh_grad/TanhGrad8^gradients/main/pi/dense_3/BiasAdd_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/pi/dense_3/Tanh_grad/TanhGrad*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
§
Agradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGrad8^gradients/main/pi/dense_3/BiasAdd_grad/tuple/group_deps*
_output_shapes
:*E
_class;
97loc:@gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGrad*
T0
í
,gradients/main/pi/dense_3/MatMul_grad/MatMulMatMul?gradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependencymain/pi/dense_3/kernel/read*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0*
transpose_b(*
transpose_a( 
ß
.gradients/main/pi/dense_3/MatMul_grad/MatMul_1MatMulmain/pi/dense_1/Relu?gradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
T0*
_output_shapes
:	¬

6gradients/main/pi/dense_3/MatMul_grad/tuple/group_depsNoOp-^gradients/main/pi/dense_3/MatMul_grad/MatMul/^gradients/main/pi/dense_3/MatMul_grad/MatMul_1
¥
>gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_3/MatMul_grad/MatMul7^gradients/main/pi/dense_3/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/pi/dense_3/MatMul_grad/MatMul*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
¢
@gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/pi/dense_3/MatMul_grad/MatMul_17^gradients/main/pi/dense_3/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*
T0*A
_class7
53loc:@gradients/main/pi/dense_3/MatMul_grad/MatMul_1

gradients/AddN_4AddN>gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependency>gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependency*?
_class5
31loc:@gradients/main/pi/dense_2/MatMul_grad/MatMul*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
N*
T0

,gradients/main/pi/dense_1/Relu_grad/ReluGradReluGradgradients/AddN_4main/pi/dense_1/Relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
¬
2gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients/main/pi/dense_1/Relu_grad/ReluGrad*
data_formatNHWC*
_output_shapes	
:¬*
T0
£
7gradients/main/pi/dense_1/BiasAdd_grad/tuple/group_depsNoOp3^gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGrad-^gradients/main/pi/dense_1/Relu_grad/ReluGrad
§
?gradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_1/Relu_grad/ReluGrad8^gradients/main/pi/dense_1/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/main/pi/dense_1/Relu_grad/ReluGrad*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
¨
Agradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGrad8^gradients/main/pi/dense_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes	
:¬*E
_class;
97loc:@gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGrad
í
,gradients/main/pi/dense_1/MatMul_grad/MatMulMatMul?gradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependencymain/pi/dense_1/kernel/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(*
transpose_a( 
Ş
.gradients/main/pi/dense_1/MatMul_grad/MatMul_1MatMulmain/pi/dense/Relu?gradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0* 
_output_shapes
:
¬*
transpose_a(

6gradients/main/pi/dense_1/MatMul_grad/tuple/group_depsNoOp-^gradients/main/pi/dense_1/MatMul_grad/MatMul/^gradients/main/pi/dense_1/MatMul_grad/MatMul_1
¥
>gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_1/MatMul_grad/MatMul7^gradients/main/pi/dense_1/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/pi/dense_1/MatMul_grad/MatMul*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
£
@gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/pi/dense_1/MatMul_grad/MatMul_17^gradients/main/pi/dense_1/MatMul_grad/tuple/group_deps*
T0* 
_output_shapes
:
¬*A
_class7
53loc:@gradients/main/pi/dense_1/MatMul_grad/MatMul_1
½
*gradients/main/pi/dense/Relu_grad/ReluGradReluGrad>gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependencymain/pi/dense/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¨
0gradients/main/pi/dense/BiasAdd_grad/BiasAddGradBiasAddGrad*gradients/main/pi/dense/Relu_grad/ReluGrad*
data_formatNHWC*
T0*
_output_shapes	
:

5gradients/main/pi/dense/BiasAdd_grad/tuple/group_depsNoOp1^gradients/main/pi/dense/BiasAdd_grad/BiasAddGrad+^gradients/main/pi/dense/Relu_grad/ReluGrad

=gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependencyIdentity*gradients/main/pi/dense/Relu_grad/ReluGrad6^gradients/main/pi/dense/BiasAdd_grad/tuple/group_deps*=
_class3
1/loc:@gradients/main/pi/dense/Relu_grad/ReluGrad*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
?gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependency_1Identity0gradients/main/pi/dense/BiasAdd_grad/BiasAddGrad6^gradients/main/pi/dense/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:*
T0*C
_class9
75loc:@gradients/main/pi/dense/BiasAdd_grad/BiasAddGrad
æ
*gradients/main/pi/dense/MatMul_grad/MatMulMatMul=gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependencymain/pi/dense/kernel/read*
T0*
transpose_a( *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6*
transpose_b(
Ô
,gradients/main/pi/dense/MatMul_grad/MatMul_1MatMulPlaceholder_1=gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	6*
transpose_a(*
T0*
transpose_b( 

4gradients/main/pi/dense/MatMul_grad/tuple/group_depsNoOp+^gradients/main/pi/dense/MatMul_grad/MatMul-^gradients/main/pi/dense/MatMul_grad/MatMul_1

<gradients/main/pi/dense/MatMul_grad/tuple/control_dependencyIdentity*gradients/main/pi/dense/MatMul_grad/MatMul5^gradients/main/pi/dense/MatMul_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6*=
_class3
1/loc:@gradients/main/pi/dense/MatMul_grad/MatMul*
T0

>gradients/main/pi/dense/MatMul_grad/tuple/control_dependency_1Identity,gradients/main/pi/dense/MatMul_grad/MatMul_15^gradients/main/pi/dense/MatMul_grad/tuple/group_deps*
T0*
_output_shapes
:	6*?
_class5
31loc:@gradients/main/pi/dense/MatMul_grad/MatMul_1

beta1_power/initial_valueConst*%
_class
loc:@main/pi/dense/bias*
valueB
 *fff?*
_output_shapes
: *
dtype0

beta1_power
VariableV2*
	container *
_output_shapes
: *
shared_name *
dtype0*
shape: *%
_class
loc:@main/pi/dense/bias
µ
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
validate_shape(*
use_locking(*
_output_shapes
: *
T0*%
_class
loc:@main/pi/dense/bias
q
beta1_power/readIdentitybeta1_power*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes
: 

beta2_power/initial_valueConst*%
_class
loc:@main/pi/dense/bias*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

beta2_power
VariableV2*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias*
dtype0*
shared_name *
	container *
shape: 
µ
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
validate_shape(*
use_locking(*%
_class
loc:@main/pi/dense/bias*
_output_shapes
: 
q
beta2_power/readIdentitybeta2_power*
T0*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias
µ
;main/pi/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*'
_class
loc:@main/pi/dense/kernel*
valueB"6     *
dtype0

1main/pi/dense/kernel/Adam/Initializer/zeros/ConstConst*'
_class
loc:@main/pi/dense/kernel*
valueB
 *    *
_output_shapes
: *
dtype0

+main/pi/dense/kernel/Adam/Initializer/zerosFill;main/pi/dense/kernel/Adam/Initializer/zeros/shape_as_tensor1main/pi/dense/kernel/Adam/Initializer/zeros/Const*'
_class
loc:@main/pi/dense/kernel*

index_type0*
T0*
_output_shapes
:	6
¸
main/pi/dense/kernel/Adam
VariableV2*
dtype0*
shape:	6*'
_class
loc:@main/pi/dense/kernel*
shared_name *
	container *
_output_shapes
:	6
î
 main/pi/dense/kernel/Adam/AssignAssignmain/pi/dense/kernel/Adam+main/pi/dense/kernel/Adam/Initializer/zeros*
T0*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*
use_locking(*
validate_shape(

main/pi/dense/kernel/Adam/readIdentitymain/pi/dense/kernel/Adam*'
_class
loc:@main/pi/dense/kernel*
T0*
_output_shapes
:	6
·
=main/pi/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"6     *'
_class
loc:@main/pi/dense/kernel
¡
3main/pi/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *'
_class
loc:@main/pi/dense/kernel*
dtype0*
_output_shapes
: 

-main/pi/dense/kernel/Adam_1/Initializer/zerosFill=main/pi/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor3main/pi/dense/kernel/Adam_1/Initializer/zeros/Const*

index_type0*
T0*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6
º
main/pi/dense/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
shape:	6*'
_class
loc:@main/pi/dense/kernel*
	container *
_output_shapes
:	6
ô
"main/pi/dense/kernel/Adam_1/AssignAssignmain/pi/dense/kernel/Adam_1-main/pi/dense/kernel/Adam_1/Initializer/zeros*
validate_shape(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*
use_locking(*
T0

 main/pi/dense/kernel/Adam_1/readIdentitymain/pi/dense/kernel/Adam_1*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*
T0

)main/pi/dense/bias/Adam/Initializer/zerosConst*
_output_shapes	
:*
valueB*    *
dtype0*%
_class
loc:@main/pi/dense/bias
¬
main/pi/dense/bias/Adam
VariableV2*%
_class
loc:@main/pi/dense/bias*
shape:*
shared_name *
	container *
_output_shapes	
:*
dtype0
â
main/pi/dense/bias/Adam/AssignAssignmain/pi/dense/bias/Adam)main/pi/dense/bias/Adam/Initializer/zeros*
validate_shape(*
use_locking(*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
T0

main/pi/dense/bias/Adam/readIdentitymain/pi/dense/bias/Adam*
_output_shapes	
:*
T0*%
_class
loc:@main/pi/dense/bias
¡
+main/pi/dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:*
valueB*    *
dtype0*%
_class
loc:@main/pi/dense/bias
®
main/pi/dense/bias/Adam_1
VariableV2*
shape:*
	container *%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
dtype0*
shared_name 
è
 main/pi/dense/bias/Adam_1/AssignAssignmain/pi/dense/bias/Adam_1+main/pi/dense/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
validate_shape(

main/pi/dense/bias/Adam_1/readIdentitymain/pi/dense/bias/Adam_1*
_output_shapes	
:*
T0*%
_class
loc:@main/pi/dense/bias
¹
=main/pi/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*)
_class
loc:@main/pi/dense_1/kernel*
valueB"  ,  
£
3main/pi/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *)
_class
loc:@main/pi/dense_1/kernel*
valueB
 *    

-main/pi/dense_1/kernel/Adam/Initializer/zerosFill=main/pi/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor3main/pi/dense_1/kernel/Adam/Initializer/zeros/Const*

index_type0* 
_output_shapes
:
¬*
T0*)
_class
loc:@main/pi/dense_1/kernel
¾
main/pi/dense_1/kernel/Adam
VariableV2*
	container *
dtype0*
shared_name *
shape:
¬*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬
÷
"main/pi/dense_1/kernel/Adam/AssignAssignmain/pi/dense_1/kernel/Adam-main/pi/dense_1/kernel/Adam/Initializer/zeros*
validate_shape(*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
use_locking(*
T0

 main/pi/dense_1/kernel/Adam/readIdentitymain/pi/dense_1/kernel/Adam*)
_class
loc:@main/pi/dense_1/kernel*
T0* 
_output_shapes
:
¬
»
?main/pi/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*)
_class
loc:@main/pi/dense_1/kernel*
dtype0*
_output_shapes
:*
valueB"  ,  
¥
5main/pi/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *
_output_shapes
: *)
_class
loc:@main/pi/dense_1/kernel

/main/pi/dense_1/kernel/Adam_1/Initializer/zerosFill?main/pi/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/pi/dense_1/kernel/Adam_1/Initializer/zeros/Const*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*

index_type0*
T0
À
main/pi/dense_1/kernel/Adam_1
VariableV2*)
_class
loc:@main/pi/dense_1/kernel*
shape:
¬*
	container *
shared_name * 
_output_shapes
:
¬*
dtype0
ı
$main/pi/dense_1/kernel/Adam_1/AssignAssignmain/pi/dense_1/kernel/Adam_1/main/pi/dense_1/kernel/Adam_1/Initializer/zeros*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*
T0*)
_class
loc:@main/pi/dense_1/kernel
£
"main/pi/dense_1/kernel/Adam_1/readIdentitymain/pi/dense_1/kernel/Adam_1*
T0*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬
£
+main/pi/dense_1/bias/Adam/Initializer/zerosConst*
dtype0*
_output_shapes	
:¬*
valueB¬*    *'
_class
loc:@main/pi/dense_1/bias
°
main/pi/dense_1/bias/Adam
VariableV2*
_output_shapes	
:¬*
	container *
shared_name *'
_class
loc:@main/pi/dense_1/bias*
dtype0*
shape:¬
ê
 main/pi/dense_1/bias/Adam/AssignAssignmain/pi/dense_1/bias/Adam+main/pi/dense_1/bias/Adam/Initializer/zeros*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
validate_shape(*
T0

main/pi/dense_1/bias/Adam/readIdentitymain/pi/dense_1/bias/Adam*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias*
T0
¥
-main/pi/dense_1/bias/Adam_1/Initializer/zerosConst*'
_class
loc:@main/pi/dense_1/bias*
dtype0*
_output_shapes	
:¬*
valueB¬*    
²
main/pi/dense_1/bias/Adam_1
VariableV2*
	container *
dtype0*
shared_name *
shape:¬*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias
ğ
"main/pi/dense_1/bias/Adam_1/AssignAssignmain/pi/dense_1/bias/Adam_1-main/pi/dense_1/bias/Adam_1/Initializer/zeros*'
_class
loc:@main/pi/dense_1/bias*
T0*
use_locking(*
validate_shape(*
_output_shapes	
:¬

 main/pi/dense_1/bias/Adam_1/readIdentitymain/pi/dense_1/bias/Adam_1*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
T0
¹
=main/pi/dense_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB",     *
_output_shapes
:*)
_class
loc:@main/pi/dense_2/kernel*
dtype0
£
3main/pi/dense_2/kernel/Adam/Initializer/zeros/ConstConst*
_output_shapes
: *)
_class
loc:@main/pi/dense_2/kernel*
dtype0*
valueB
 *    

-main/pi/dense_2/kernel/Adam/Initializer/zerosFill=main/pi/dense_2/kernel/Adam/Initializer/zeros/shape_as_tensor3main/pi/dense_2/kernel/Adam/Initializer/zeros/Const*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel*

index_type0
¼
main/pi/dense_2/kernel/Adam
VariableV2*
dtype0*
_output_shapes
:	¬*
	container *)
_class
loc:@main/pi/dense_2/kernel*
shape:	¬*
shared_name 
ö
"main/pi/dense_2/kernel/Adam/AssignAssignmain/pi/dense_2/kernel/Adam-main/pi/dense_2/kernel/Adam/Initializer/zeros*
T0*
validate_shape(*
_output_shapes
:	¬*
use_locking(*)
_class
loc:@main/pi/dense_2/kernel

 main/pi/dense_2/kernel/Adam/readIdentitymain/pi/dense_2/kernel/Adam*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_2/kernel
»
?main/pi/dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
valueB",     
¥
5main/pi/dense_2/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
: *
valueB
 *    

/main/pi/dense_2/kernel/Adam_1/Initializer/zerosFill?main/pi/dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/pi/dense_2/kernel/Adam_1/Initializer/zeros/Const*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel*

index_type0*
T0
¾
main/pi/dense_2/kernel/Adam_1
VariableV2*
	container *
shared_name *
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
shape:	¬
ü
$main/pi/dense_2/kernel/Adam_1/AssignAssignmain/pi/dense_2/kernel/Adam_1/main/pi/dense_2/kernel/Adam_1/Initializer/zeros*
_output_shapes
:	¬*
validate_shape(*)
_class
loc:@main/pi/dense_2/kernel*
T0*
use_locking(
¢
"main/pi/dense_2/kernel/Adam_1/readIdentitymain/pi/dense_2/kernel/Adam_1*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
T0
¡
+main/pi/dense_2/bias/Adam/Initializer/zerosConst*'
_class
loc:@main/pi/dense_2/bias*
valueB*    *
_output_shapes
:*
dtype0
®
main/pi/dense_2/bias/Adam
VariableV2*
	container *
dtype0*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
shape:*
shared_name 
é
 main/pi/dense_2/bias/Adam/AssignAssignmain/pi/dense_2/bias/Adam+main/pi/dense_2/bias/Adam/Initializer/zeros*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*'
_class
loc:@main/pi/dense_2/bias

main/pi/dense_2/bias/Adam/readIdentitymain/pi/dense_2/bias/Adam*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
T0
£
-main/pi/dense_2/bias/Adam_1/Initializer/zerosConst*
valueB*    *'
_class
loc:@main/pi/dense_2/bias*
dtype0*
_output_shapes
:
°
main/pi/dense_2/bias/Adam_1
VariableV2*
shared_name *
	container *
dtype0*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
shape:
ï
"main/pi/dense_2/bias/Adam_1/AssignAssignmain/pi/dense_2/bias/Adam_1-main/pi/dense_2/bias/Adam_1/Initializer/zeros*
use_locking(*
_output_shapes
:*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
T0

 main/pi/dense_2/bias/Adam_1/readIdentitymain/pi/dense_2/bias/Adam_1*
_output_shapes
:*'
_class
loc:@main/pi/dense_2/bias*
T0
¹
=main/pi/dense_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*)
_class
loc:@main/pi/dense_3/kernel*
dtype0*
valueB",     *
_output_shapes
:
£
3main/pi/dense_3/kernel/Adam/Initializer/zeros/ConstConst*)
_class
loc:@main/pi/dense_3/kernel*
dtype0*
valueB
 *    *
_output_shapes
: 

-main/pi/dense_3/kernel/Adam/Initializer/zerosFill=main/pi/dense_3/kernel/Adam/Initializer/zeros/shape_as_tensor3main/pi/dense_3/kernel/Adam/Initializer/zeros/Const*

index_type0*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel
¼
main/pi/dense_3/kernel/Adam
VariableV2*
shape:	¬*
_output_shapes
:	¬*
dtype0*
	container *
shared_name *)
_class
loc:@main/pi/dense_3/kernel
ö
"main/pi/dense_3/kernel/Adam/AssignAssignmain/pi/dense_3/kernel/Adam-main/pi/dense_3/kernel/Adam/Initializer/zeros*
use_locking(*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
validate_shape(*
T0

 main/pi/dense_3/kernel/Adam/readIdentitymain/pi/dense_3/kernel/Adam*
T0*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬
»
?main/pi/dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB",     *
_output_shapes
:*
dtype0*)
_class
loc:@main/pi/dense_3/kernel
¥
5main/pi/dense_3/kernel/Adam_1/Initializer/zeros/ConstConst*)
_class
loc:@main/pi/dense_3/kernel*
valueB
 *    *
dtype0*
_output_shapes
: 

/main/pi/dense_3/kernel/Adam_1/Initializer/zerosFill?main/pi/dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/pi/dense_3/kernel/Adam_1/Initializer/zeros/Const*)
_class
loc:@main/pi/dense_3/kernel*
T0*

index_type0*
_output_shapes
:	¬
¾
main/pi/dense_3/kernel/Adam_1
VariableV2*
	container *)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
shared_name *
shape:	¬*
dtype0
ü
$main/pi/dense_3/kernel/Adam_1/AssignAssignmain/pi/dense_3/kernel/Adam_1/main/pi/dense_3/kernel/Adam_1/Initializer/zeros*
validate_shape(*)
_class
loc:@main/pi/dense_3/kernel*
T0*
use_locking(*
_output_shapes
:	¬
¢
"main/pi/dense_3/kernel/Adam_1/readIdentitymain/pi/dense_3/kernel/Adam_1*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_3/kernel
¡
+main/pi/dense_3/bias/Adam/Initializer/zerosConst*'
_class
loc:@main/pi/dense_3/bias*
valueB*    *
dtype0*
_output_shapes
:
®
main/pi/dense_3/bias/Adam
VariableV2*
shape:*
_output_shapes
:*
shared_name *
dtype0*'
_class
loc:@main/pi/dense_3/bias*
	container 
é
 main/pi/dense_3/bias/Adam/AssignAssignmain/pi/dense_3/bias/Adam+main/pi/dense_3/bias/Adam/Initializer/zeros*
validate_shape(*
T0*'
_class
loc:@main/pi/dense_3/bias*
use_locking(*
_output_shapes
:

main/pi/dense_3/bias/Adam/readIdentitymain/pi/dense_3/bias/Adam*'
_class
loc:@main/pi/dense_3/bias*
T0*
_output_shapes
:
£
-main/pi/dense_3/bias/Adam_1/Initializer/zerosConst*
_output_shapes
:*
dtype0*'
_class
loc:@main/pi/dense_3/bias*
valueB*    
°
main/pi/dense_3/bias/Adam_1
VariableV2*'
_class
loc:@main/pi/dense_3/bias*
dtype0*
	container *
shared_name *
_output_shapes
:*
shape:
ï
"main/pi/dense_3/bias/Adam_1/AssignAssignmain/pi/dense_3/bias/Adam_1-main/pi/dense_3/bias/Adam_1/Initializer/zeros*
T0*
_output_shapes
:*'
_class
loc:@main/pi/dense_3/bias*
use_locking(*
validate_shape(

 main/pi/dense_3/bias/Adam_1/readIdentitymain/pi/dense_3/bias/Adam_1*
T0*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:
W
Adam/learning_rateConst*
valueB
 *o:*
dtype0*
_output_shapes
: 
O

Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
O

Adam/beta2Const*
valueB
 *w¾?*
dtype0*
_output_shapes
: 
Q
Adam/epsilonConst*
dtype0*
valueB
 *wÌ+2*
_output_shapes
: 

*Adam/update_main/pi/dense/kernel/ApplyAdam	ApplyAdammain/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon>gradients/main/pi/dense/MatMul_grad/tuple/control_dependency_1*
use_locking( *
use_nesterov( *
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*
T0

(Adam/update_main/pi/dense/bias/ApplyAdam	ApplyAdammain/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon?gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes	
:*
use_locking( *
use_nesterov( *
T0*%
_class
loc:@main/pi/dense/bias
ª
,Adam/update_main/pi/dense_1/kernel/ApplyAdam	ApplyAdammain/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependency_1*
use_locking( * 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*
T0*
use_nesterov( 

*Adam/update_main/pi/dense_1/bias/ApplyAdam	ApplyAdammain/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonAgradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
_output_shapes	
:¬*
use_locking( *
T0*'
_class
loc:@main/pi/dense_1/bias
©
,Adam/update_main/pi/dense_2/kernel/ApplyAdam	ApplyAdammain/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependency_1*
_output_shapes
:	¬*
T0*
use_nesterov( *
use_locking( *)
_class
loc:@main/pi/dense_2/kernel

*Adam/update_main/pi/dense_2/bias/ApplyAdam	ApplyAdammain/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonAgradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes
:*
use_nesterov( *'
_class
loc:@main/pi/dense_2/bias*
T0*
use_locking( 
©
,Adam/update_main/pi/dense_3/kernel/ApplyAdam	ApplyAdammain/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
T0*
_output_shapes
:	¬*
use_locking( *)
_class
loc:@main/pi/dense_3/kernel

*Adam/update_main/pi/dense_3/bias/ApplyAdam	ApplyAdammain/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonAgradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependency_1*'
_class
loc:@main/pi/dense_3/bias*
use_nesterov( *
use_locking( *
T0*
_output_shapes
:
á
Adam/mulMulbeta1_power/read
Adam/beta1)^Adam/update_main/pi/dense/bias/ApplyAdam+^Adam/update_main/pi/dense/kernel/ApplyAdam+^Adam/update_main/pi/dense_1/bias/ApplyAdam-^Adam/update_main/pi/dense_1/kernel/ApplyAdam+^Adam/update_main/pi/dense_2/bias/ApplyAdam-^Adam/update_main/pi/dense_2/kernel/ApplyAdam+^Adam/update_main/pi/dense_3/bias/ApplyAdam-^Adam/update_main/pi/dense_3/kernel/ApplyAdam*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes
: 

Adam/AssignAssignbeta1_powerAdam/mul*
use_locking( *%
_class
loc:@main/pi/dense/bias*
_output_shapes
: *
validate_shape(*
T0
ã

Adam/mul_1Mulbeta2_power/read
Adam/beta2)^Adam/update_main/pi/dense/bias/ApplyAdam+^Adam/update_main/pi/dense/kernel/ApplyAdam+^Adam/update_main/pi/dense_1/bias/ApplyAdam-^Adam/update_main/pi/dense_1/kernel/ApplyAdam+^Adam/update_main/pi/dense_2/bias/ApplyAdam-^Adam/update_main/pi/dense_2/kernel/ApplyAdam+^Adam/update_main/pi/dense_3/bias/ApplyAdam-^Adam/update_main/pi/dense_3/kernel/ApplyAdam*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes
: 
¡
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*%
_class
loc:@main/pi/dense/bias*
_output_shapes
: *
validate_shape(*
use_locking( 

AdamNoOp^Adam/Assign^Adam/Assign_1)^Adam/update_main/pi/dense/bias/ApplyAdam+^Adam/update_main/pi/dense/kernel/ApplyAdam+^Adam/update_main/pi/dense_1/bias/ApplyAdam-^Adam/update_main/pi/dense_1/kernel/ApplyAdam+^Adam/update_main/pi/dense_2/bias/ApplyAdam-^Adam/update_main/pi/dense_2/kernel/ApplyAdam+^Adam/update_main/pi/dense_3/bias/ApplyAdam-^Adam/update_main/pi/dense_3/kernel/ApplyAdam
[
gradients_1/ShapeConst^Adam*
_output_shapes
: *
valueB *
dtype0
a
gradients_1/grad_ys_0Const^Adam*
valueB
 *  ?*
dtype0*
_output_shapes
: 
u
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*

index_type0*
_output_shapes
: *
T0
I
'gradients_1/add_2_grad/tuple/group_depsNoOp^Adam^gradients_1/Fill
½
/gradients_1/add_2_grad/tuple/control_dependencyIdentitygradients_1/Fill(^gradients_1/add_2_grad/tuple/group_deps*#
_class
loc:@gradients_1/Fill*
_output_shapes
: *
T0
¿
1gradients_1/add_2_grad/tuple/control_dependency_1Identitygradients_1/Fill(^gradients_1/add_2_grad/tuple/group_deps*
_output_shapes
: *
T0*#
_class
loc:@gradients_1/Fill
h
'gradients_1/add_1_grad/tuple/group_depsNoOp^Adam0^gradients_1/add_2_grad/tuple/control_dependency
Ü
/gradients_1/add_1_grad/tuple/control_dependencyIdentity/gradients_1/add_2_grad/tuple/control_dependency(^gradients_1/add_1_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill*
_output_shapes
: 
Ş
1gradients_1/add_1_grad/tuple/control_dependency_1Identity/gradients_1/add_2_grad/tuple/control_dependency(^gradients_1/add_1_grad/tuple/group_deps*
_output_shapes
: *
T0*#
_class
loc:@gradients_1/Fill
}
gradients_1/mul_6_grad/MulMul1gradients_1/add_2_grad/tuple/control_dependency_1Mean_3*
T0*
_output_shapes
: 

gradients_1/mul_6_grad/Mul_1Mul1gradients_1/add_2_grad/tuple/control_dependency_1mul_6/x*
T0*
_output_shapes
: 
r
'gradients_1/mul_6_grad/tuple/group_depsNoOp^Adam^gradients_1/mul_6_grad/Mul^gradients_1/mul_6_grad/Mul_1
Ñ
/gradients_1/mul_6_grad/tuple/control_dependencyIdentitygradients_1/mul_6_grad/Mul(^gradients_1/mul_6_grad/tuple/group_deps*-
_class#
!loc:@gradients_1/mul_6_grad/Mul*
T0*
_output_shapes
: 
×
1gradients_1/mul_6_grad/tuple/control_dependency_1Identitygradients_1/mul_6_grad/Mul_1(^gradients_1/mul_6_grad/tuple/group_deps*
T0*
_output_shapes
: */
_class%
#!loc:@gradients_1/mul_6_grad/Mul_1
{
gradients_1/mul_4_grad/MulMul/gradients_1/add_1_grad/tuple/control_dependencyMean_1*
T0*
_output_shapes
: 
~
gradients_1/mul_4_grad/Mul_1Mul/gradients_1/add_1_grad/tuple/control_dependencymul_4/x*
T0*
_output_shapes
: 
r
'gradients_1/mul_4_grad/tuple/group_depsNoOp^Adam^gradients_1/mul_4_grad/Mul^gradients_1/mul_4_grad/Mul_1
Ñ
/gradients_1/mul_4_grad/tuple/control_dependencyIdentitygradients_1/mul_4_grad/Mul(^gradients_1/mul_4_grad/tuple/group_deps*
_output_shapes
: *
T0*-
_class#
!loc:@gradients_1/mul_4_grad/Mul
×
1gradients_1/mul_4_grad/tuple/control_dependency_1Identitygradients_1/mul_4_grad/Mul_1(^gradients_1/mul_4_grad/tuple/group_deps*/
_class%
#!loc:@gradients_1/mul_4_grad/Mul_1*
_output_shapes
: *
T0
}
gradients_1/mul_5_grad/MulMul1gradients_1/add_1_grad/tuple/control_dependency_1Mean_2*
T0*
_output_shapes
: 

gradients_1/mul_5_grad/Mul_1Mul1gradients_1/add_1_grad/tuple/control_dependency_1mul_5/x*
_output_shapes
: *
T0
r
'gradients_1/mul_5_grad/tuple/group_depsNoOp^Adam^gradients_1/mul_5_grad/Mul^gradients_1/mul_5_grad/Mul_1
Ñ
/gradients_1/mul_5_grad/tuple/control_dependencyIdentitygradients_1/mul_5_grad/Mul(^gradients_1/mul_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/mul_5_grad/Mul*
_output_shapes
: 
×
1gradients_1/mul_5_grad/tuple/control_dependency_1Identitygradients_1/mul_5_grad/Mul_1(^gradients_1/mul_5_grad/tuple/group_deps*
_output_shapes
: */
_class%
#!loc:@gradients_1/mul_5_grad/Mul_1*
T0
v
%gradients_1/Mean_3_grad/Reshape/shapeConst^Adam*
valueB:*
_output_shapes
:*
dtype0
·
gradients_1/Mean_3_grad/ReshapeReshape1gradients_1/mul_6_grad/tuple/control_dependency_1%gradients_1/Mean_3_grad/Reshape/shape*
_output_shapes
:*
Tshape0*
T0
i
gradients_1/Mean_3_grad/ShapeShapepow_2^Adam*
out_type0*
_output_shapes
:*
T0
¤
gradients_1/Mean_3_grad/TileTilegradients_1/Mean_3_grad/Reshapegradients_1/Mean_3_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*

Tmultiples0
k
gradients_1/Mean_3_grad/Shape_1Shapepow_2^Adam*
T0*
out_type0*
_output_shapes
:
i
gradients_1/Mean_3_grad/Shape_2Const^Adam*
_output_shapes
: *
dtype0*
valueB 
n
gradients_1/Mean_3_grad/ConstConst^Adam*
_output_shapes
:*
valueB: *
dtype0
¢
gradients_1/Mean_3_grad/ProdProdgradients_1/Mean_3_grad/Shape_1gradients_1/Mean_3_grad/Const*
_output_shapes
: *
T0*

Tidx0*
	keep_dims( 
p
gradients_1/Mean_3_grad/Const_1Const^Adam*
_output_shapes
:*
dtype0*
valueB: 
¦
gradients_1/Mean_3_grad/Prod_1Prodgradients_1/Mean_3_grad/Shape_2gradients_1/Mean_3_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
j
!gradients_1/Mean_3_grad/Maximum/yConst^Adam*
dtype0*
_output_shapes
: *
value	B :

gradients_1/Mean_3_grad/MaximumMaximumgradients_1/Mean_3_grad/Prod_1!gradients_1/Mean_3_grad/Maximum/y*
_output_shapes
: *
T0

 gradients_1/Mean_3_grad/floordivFloorDivgradients_1/Mean_3_grad/Prodgradients_1/Mean_3_grad/Maximum*
T0*
_output_shapes
: 

gradients_1/Mean_3_grad/CastCast gradients_1/Mean_3_grad/floordiv*
_output_shapes
: *

SrcT0*

DstT0*
Truncate( 

gradients_1/Mean_3_grad/truedivRealDivgradients_1/Mean_3_grad/Tilegradients_1/Mean_3_grad/Cast*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
v
%gradients_1/Mean_1_grad/Reshape/shapeConst^Adam*
dtype0*
_output_shapes
:*
valueB:
·
gradients_1/Mean_1_grad/ReshapeReshape1gradients_1/mul_4_grad/tuple/control_dependency_1%gradients_1/Mean_1_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
g
gradients_1/Mean_1_grad/ShapeShapepow^Adam*
T0*
out_type0*
_output_shapes
:
¤
gradients_1/Mean_1_grad/TileTilegradients_1/Mean_1_grad/Reshapegradients_1/Mean_1_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*

Tmultiples0
i
gradients_1/Mean_1_grad/Shape_1Shapepow^Adam*
_output_shapes
:*
out_type0*
T0
i
gradients_1/Mean_1_grad/Shape_2Const^Adam*
dtype0*
valueB *
_output_shapes
: 
n
gradients_1/Mean_1_grad/ConstConst^Adam*
valueB: *
dtype0*
_output_shapes
:
¢
gradients_1/Mean_1_grad/ProdProdgradients_1/Mean_1_grad/Shape_1gradients_1/Mean_1_grad/Const*
	keep_dims( *
T0*
_output_shapes
: *

Tidx0
p
gradients_1/Mean_1_grad/Const_1Const^Adam*
dtype0*
valueB: *
_output_shapes
:
¦
gradients_1/Mean_1_grad/Prod_1Prodgradients_1/Mean_1_grad/Shape_2gradients_1/Mean_1_grad/Const_1*

Tidx0*
	keep_dims( *
_output_shapes
: *
T0
j
!gradients_1/Mean_1_grad/Maximum/yConst^Adam*
value	B :*
dtype0*
_output_shapes
: 

gradients_1/Mean_1_grad/MaximumMaximumgradients_1/Mean_1_grad/Prod_1!gradients_1/Mean_1_grad/Maximum/y*
T0*
_output_shapes
: 

 gradients_1/Mean_1_grad/floordivFloorDivgradients_1/Mean_1_grad/Prodgradients_1/Mean_1_grad/Maximum*
_output_shapes
: *
T0

gradients_1/Mean_1_grad/CastCast gradients_1/Mean_1_grad/floordiv*

SrcT0*

DstT0*
Truncate( *
_output_shapes
: 

gradients_1/Mean_1_grad/truedivRealDivgradients_1/Mean_1_grad/Tilegradients_1/Mean_1_grad/Cast*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
v
%gradients_1/Mean_2_grad/Reshape/shapeConst^Adam*
valueB:*
dtype0*
_output_shapes
:
·
gradients_1/Mean_2_grad/ReshapeReshape1gradients_1/mul_5_grad/tuple/control_dependency_1%gradients_1/Mean_2_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
i
gradients_1/Mean_2_grad/ShapeShapepow_1^Adam*
_output_shapes
:*
T0*
out_type0
¤
gradients_1/Mean_2_grad/TileTilegradients_1/Mean_2_grad/Reshapegradients_1/Mean_2_grad/Shape*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

Tmultiples0
k
gradients_1/Mean_2_grad/Shape_1Shapepow_1^Adam*
out_type0*
T0*
_output_shapes
:
i
gradients_1/Mean_2_grad/Shape_2Const^Adam*
dtype0*
valueB *
_output_shapes
: 
n
gradients_1/Mean_2_grad/ConstConst^Adam*
dtype0*
_output_shapes
:*
valueB: 
¢
gradients_1/Mean_2_grad/ProdProdgradients_1/Mean_2_grad/Shape_1gradients_1/Mean_2_grad/Const*
	keep_dims( *
_output_shapes
: *

Tidx0*
T0
p
gradients_1/Mean_2_grad/Const_1Const^Adam*
_output_shapes
:*
valueB: *
dtype0
¦
gradients_1/Mean_2_grad/Prod_1Prodgradients_1/Mean_2_grad/Shape_2gradients_1/Mean_2_grad/Const_1*
	keep_dims( *

Tidx0*
_output_shapes
: *
T0
j
!gradients_1/Mean_2_grad/Maximum/yConst^Adam*
value	B :*
_output_shapes
: *
dtype0

gradients_1/Mean_2_grad/MaximumMaximumgradients_1/Mean_2_grad/Prod_1!gradients_1/Mean_2_grad/Maximum/y*
T0*
_output_shapes
: 

 gradients_1/Mean_2_grad/floordivFloorDivgradients_1/Mean_2_grad/Prodgradients_1/Mean_2_grad/Maximum*
_output_shapes
: *
T0

gradients_1/Mean_2_grad/CastCast gradients_1/Mean_2_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: *
Truncate( 

gradients_1/Mean_2_grad/truedivRealDivgradients_1/Mean_2_grad/Tilegradients_1/Mean_2_grad/Cast*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
h
gradients_1/pow_2_grad/ShapeShapesub_5^Adam*
T0*
_output_shapes
:*
out_type0
j
gradients_1/pow_2_grad/Shape_1Shapepow_2/y^Adam*
out_type0*
T0*
_output_shapes
: 
À
,gradients_1/pow_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/pow_2_grad/Shapegradients_1/pow_2_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
y
gradients_1/pow_2_grad/mulMulgradients_1/Mean_3_grad/truedivpow_2/y*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
gradients_1/pow_2_grad/sub/yConst^Adam*
valueB
 *  ?*
dtype0*
_output_shapes
: 
i
gradients_1/pow_2_grad/subSubpow_2/ygradients_1/pow_2_grad/sub/y*
_output_shapes
: *
T0
r
gradients_1/pow_2_grad/PowPowsub_5gradients_1/pow_2_grad/sub*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

gradients_1/pow_2_grad/mul_1Mulgradients_1/pow_2_grad/mulgradients_1/pow_2_grad/Pow*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
­
gradients_1/pow_2_grad/SumSumgradients_1/pow_2_grad/mul_1,gradients_1/pow_2_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients_1/pow_2_grad/ReshapeReshapegradients_1/pow_2_grad/Sumgradients_1/pow_2_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0
l
 gradients_1/pow_2_grad/Greater/yConst^Adam*
valueB
 *    *
dtype0*
_output_shapes
: 

gradients_1/pow_2_grad/GreaterGreatersub_5 gradients_1/pow_2_grad/Greater/y*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
r
&gradients_1/pow_2_grad/ones_like/ShapeShapesub_5^Adam*
out_type0*
_output_shapes
:*
T0
r
&gradients_1/pow_2_grad/ones_like/ConstConst^Adam*
valueB
 *  ?*
dtype0*
_output_shapes
: 
¸
 gradients_1/pow_2_grad/ones_likeFill&gradients_1/pow_2_grad/ones_like/Shape&gradients_1/pow_2_grad/ones_like/Const*

index_type0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

gradients_1/pow_2_grad/SelectSelectgradients_1/pow_2_grad/Greatersub_5 gradients_1/pow_2_grad/ones_like*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
n
gradients_1/pow_2_grad/LogLoggradients_1/pow_2_grad/Select*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
j
!gradients_1/pow_2_grad/zeros_like	ZerosLikesub_5^Adam*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¶
gradients_1/pow_2_grad/Select_1Selectgradients_1/pow_2_grad/Greatergradients_1/pow_2_grad/Log!gradients_1/pow_2_grad/zeros_like*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
y
gradients_1/pow_2_grad/mul_2Mulgradients_1/Mean_3_grad/truedivpow_2*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

gradients_1/pow_2_grad/mul_3Mulgradients_1/pow_2_grad/mul_2gradients_1/pow_2_grad/Select_1*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
±
gradients_1/pow_2_grad/Sum_1Sumgradients_1/pow_2_grad/mul_3.gradients_1/pow_2_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
_output_shapes
:*
T0

 gradients_1/pow_2_grad/Reshape_1Reshapegradients_1/pow_2_grad/Sum_1gradients_1/pow_2_grad/Shape_1*
Tshape0*
T0*
_output_shapes
: 
z
'gradients_1/pow_2_grad/tuple/group_depsNoOp^Adam^gradients_1/pow_2_grad/Reshape!^gradients_1/pow_2_grad/Reshape_1
æ
/gradients_1/pow_2_grad/tuple/control_dependencyIdentitygradients_1/pow_2_grad/Reshape(^gradients_1/pow_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/pow_2_grad/Reshape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ß
1gradients_1/pow_2_grad/tuple/control_dependency_1Identity gradients_1/pow_2_grad/Reshape_1(^gradients_1/pow_2_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/pow_2_grad/Reshape_1*
T0*
_output_shapes
: 
f
gradients_1/pow_grad/ShapeShapesub_3^Adam*
out_type0*
_output_shapes
:*
T0
f
gradients_1/pow_grad/Shape_1Shapepow/y^Adam*
_output_shapes
: *
out_type0*
T0
º
*gradients_1/pow_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/pow_grad/Shapegradients_1/pow_grad/Shape_1*
T0*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ
u
gradients_1/pow_grad/mulMulgradients_1/Mean_1_grad/truedivpow/y*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
f
gradients_1/pow_grad/sub/yConst^Adam*
dtype0*
valueB
 *  ?*
_output_shapes
: 
c
gradients_1/pow_grad/subSubpow/ygradients_1/pow_grad/sub/y*
T0*
_output_shapes
: 
n
gradients_1/pow_grad/PowPowsub_3gradients_1/pow_grad/sub*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

gradients_1/pow_grad/mul_1Mulgradients_1/pow_grad/mulgradients_1/pow_grad/Pow*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
§
gradients_1/pow_grad/SumSumgradients_1/pow_grad/mul_1*gradients_1/pow_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*

Tidx0*
	keep_dims( 

gradients_1/pow_grad/ReshapeReshapegradients_1/pow_grad/Sumgradients_1/pow_grad/Shape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0*
T0
j
gradients_1/pow_grad/Greater/yConst^Adam*
_output_shapes
: *
dtype0*
valueB
 *    
|
gradients_1/pow_grad/GreaterGreatersub_3gradients_1/pow_grad/Greater/y*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
p
$gradients_1/pow_grad/ones_like/ShapeShapesub_3^Adam*
T0*
out_type0*
_output_shapes
:
p
$gradients_1/pow_grad/ones_like/ConstConst^Adam*
dtype0*
valueB
 *  ?*
_output_shapes
: 
²
gradients_1/pow_grad/ones_likeFill$gradients_1/pow_grad/ones_like/Shape$gradients_1/pow_grad/ones_like/Const*

index_type0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

gradients_1/pow_grad/SelectSelectgradients_1/pow_grad/Greatersub_3gradients_1/pow_grad/ones_like*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
j
gradients_1/pow_grad/LogLoggradients_1/pow_grad/Select*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
gradients_1/pow_grad/zeros_like	ZerosLikesub_3^Adam*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
®
gradients_1/pow_grad/Select_1Selectgradients_1/pow_grad/Greatergradients_1/pow_grad/Loggradients_1/pow_grad/zeros_like*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
u
gradients_1/pow_grad/mul_2Mulgradients_1/Mean_1_grad/truedivpow*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

gradients_1/pow_grad/mul_3Mulgradients_1/pow_grad/mul_2gradients_1/pow_grad/Select_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
«
gradients_1/pow_grad/Sum_1Sumgradients_1/pow_grad/mul_3,gradients_1/pow_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:

gradients_1/pow_grad/Reshape_1Reshapegradients_1/pow_grad/Sum_1gradients_1/pow_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0
t
%gradients_1/pow_grad/tuple/group_depsNoOp^Adam^gradients_1/pow_grad/Reshape^gradients_1/pow_grad/Reshape_1
Ş
-gradients_1/pow_grad/tuple/control_dependencyIdentitygradients_1/pow_grad/Reshape&^gradients_1/pow_grad/tuple/group_deps*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*/
_class%
#!loc:@gradients_1/pow_grad/Reshape
×
/gradients_1/pow_grad/tuple/control_dependency_1Identitygradients_1/pow_grad/Reshape_1&^gradients_1/pow_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/pow_grad/Reshape_1*
_output_shapes
: *
T0
h
gradients_1/pow_1_grad/ShapeShapesub_4^Adam*
_output_shapes
:*
T0*
out_type0
j
gradients_1/pow_1_grad/Shape_1Shapepow_1/y^Adam*
_output_shapes
: *
out_type0*
T0
À
,gradients_1/pow_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/pow_1_grad/Shapegradients_1/pow_1_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
y
gradients_1/pow_1_grad/mulMulgradients_1/Mean_2_grad/truedivpow_1/y*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
gradients_1/pow_1_grad/sub/yConst^Adam*
_output_shapes
: *
dtype0*
valueB
 *  ?
i
gradients_1/pow_1_grad/subSubpow_1/ygradients_1/pow_1_grad/sub/y*
_output_shapes
: *
T0
r
gradients_1/pow_1_grad/PowPowsub_4gradients_1/pow_1_grad/sub*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

gradients_1/pow_1_grad/mul_1Mulgradients_1/pow_1_grad/mulgradients_1/pow_1_grad/Pow*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
­
gradients_1/pow_1_grad/SumSumgradients_1/pow_1_grad/mul_1,gradients_1/pow_1_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*

Tidx0*
	keep_dims( 

gradients_1/pow_1_grad/ReshapeReshapegradients_1/pow_1_grad/Sumgradients_1/pow_1_grad/Shape*
Tshape0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
l
 gradients_1/pow_1_grad/Greater/yConst^Adam*
dtype0*
valueB
 *    *
_output_shapes
: 

gradients_1/pow_1_grad/GreaterGreatersub_4 gradients_1/pow_1_grad/Greater/y*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
r
&gradients_1/pow_1_grad/ones_like/ShapeShapesub_4^Adam*
out_type0*
T0*
_output_shapes
:
r
&gradients_1/pow_1_grad/ones_like/ConstConst^Adam*
_output_shapes
: *
valueB
 *  ?*
dtype0
¸
 gradients_1/pow_1_grad/ones_likeFill&gradients_1/pow_1_grad/ones_like/Shape&gradients_1/pow_1_grad/ones_like/Const*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

index_type0

gradients_1/pow_1_grad/SelectSelectgradients_1/pow_1_grad/Greatersub_4 gradients_1/pow_1_grad/ones_like*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
n
gradients_1/pow_1_grad/LogLoggradients_1/pow_1_grad/Select*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
j
!gradients_1/pow_1_grad/zeros_like	ZerosLikesub_4^Adam*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¶
gradients_1/pow_1_grad/Select_1Selectgradients_1/pow_1_grad/Greatergradients_1/pow_1_grad/Log!gradients_1/pow_1_grad/zeros_like*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
y
gradients_1/pow_1_grad/mul_2Mulgradients_1/Mean_2_grad/truedivpow_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

gradients_1/pow_1_grad/mul_3Mulgradients_1/pow_1_grad/mul_2gradients_1/pow_1_grad/Select_1*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
±
gradients_1/pow_1_grad/Sum_1Sumgradients_1/pow_1_grad/mul_3.gradients_1/pow_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *
T0*

Tidx0

 gradients_1/pow_1_grad/Reshape_1Reshapegradients_1/pow_1_grad/Sum_1gradients_1/pow_1_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0
z
'gradients_1/pow_1_grad/tuple/group_depsNoOp^Adam^gradients_1/pow_1_grad/Reshape!^gradients_1/pow_1_grad/Reshape_1
æ
/gradients_1/pow_1_grad/tuple/control_dependencyIdentitygradients_1/pow_1_grad/Reshape(^gradients_1/pow_1_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/pow_1_grad/Reshape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
ß
1gradients_1/pow_1_grad/tuple/control_dependency_1Identity gradients_1/pow_1_grad/Reshape_1(^gradients_1/pow_1_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/pow_1_grad/Reshape_1*
T0*
_output_shapes
: 
q
gradients_1/sub_5_grad/ShapeShapeStopGradient_1^Adam*
out_type0*
_output_shapes
:*
T0
s
gradients_1/sub_5_grad/Shape_1Shapemain/v/Squeeze^Adam*
_output_shapes
:*
out_type0*
T0
À
,gradients_1/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_5_grad/Shapegradients_1/sub_5_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
À
gradients_1/sub_5_grad/SumSum/gradients_1/pow_2_grad/tuple/control_dependency,gradients_1/sub_5_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_1/sub_5_grad/ReshapeReshapegradients_1/sub_5_grad/Sumgradients_1/sub_5_grad/Shape*
T0*
Tshape0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

gradients_1/sub_5_grad/NegNeg/gradients_1/pow_2_grad/tuple/control_dependency*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¯
gradients_1/sub_5_grad/Sum_1Sumgradients_1/sub_5_grad/Neg.gradients_1/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
T0*
	keep_dims( 
¥
 gradients_1/sub_5_grad/Reshape_1Reshapegradients_1/sub_5_grad/Sum_1gradients_1/sub_5_grad/Shape_1*
Tshape0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
z
'gradients_1/sub_5_grad/tuple/group_depsNoOp^Adam^gradients_1/sub_5_grad/Reshape!^gradients_1/sub_5_grad/Reshape_1
æ
/gradients_1/sub_5_grad/tuple/control_dependencyIdentitygradients_1/sub_5_grad/Reshape(^gradients_1/sub_5_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/sub_5_grad/Reshape*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
ì
1gradients_1/sub_5_grad/tuple/control_dependency_1Identity gradients_1/sub_5_grad/Reshape_1(^gradients_1/sub_5_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/sub_5_grad/Reshape_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
o
gradients_1/sub_3_grad/ShapeShapeStopGradient^Adam*
out_type0*
T0*
_output_shapes
:
t
gradients_1/sub_3_grad/Shape_1Shapemain/q1/Squeeze^Adam*
out_type0*
_output_shapes
:*
T0
À
,gradients_1/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_3_grad/Shapegradients_1/sub_3_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
¾
gradients_1/sub_3_grad/SumSum-gradients_1/pow_grad/tuple/control_dependency,gradients_1/sub_3_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
T0*
	keep_dims( 

gradients_1/sub_3_grad/ReshapeReshapegradients_1/sub_3_grad/Sumgradients_1/sub_3_grad/Shape*
Tshape0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
~
gradients_1/sub_3_grad/NegNeg-gradients_1/pow_grad/tuple/control_dependency*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¯
gradients_1/sub_3_grad/Sum_1Sumgradients_1/sub_3_grad/Neg.gradients_1/sub_3_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
¥
 gradients_1/sub_3_grad/Reshape_1Reshapegradients_1/sub_3_grad/Sum_1gradients_1/sub_3_grad/Shape_1*
Tshape0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
z
'gradients_1/sub_3_grad/tuple/group_depsNoOp^Adam^gradients_1/sub_3_grad/Reshape!^gradients_1/sub_3_grad/Reshape_1
æ
/gradients_1/sub_3_grad/tuple/control_dependencyIdentitygradients_1/sub_3_grad/Reshape(^gradients_1/sub_3_grad/tuple/group_deps*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*1
_class'
%#loc:@gradients_1/sub_3_grad/Reshape
ì
1gradients_1/sub_3_grad/tuple/control_dependency_1Identity gradients_1/sub_3_grad/Reshape_1(^gradients_1/sub_3_grad/tuple/group_deps*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0*3
_class)
'%loc:@gradients_1/sub_3_grad/Reshape_1
o
gradients_1/sub_4_grad/ShapeShapeStopGradient^Adam*
out_type0*
_output_shapes
:*
T0
t
gradients_1/sub_4_grad/Shape_1Shapemain/q2/Squeeze^Adam*
out_type0*
_output_shapes
:*
T0
À
,gradients_1/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_4_grad/Shapegradients_1/sub_4_grad/Shape_1*2
_output_shapes 
:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
T0
À
gradients_1/sub_4_grad/SumSum/gradients_1/pow_1_grad/tuple/control_dependency,gradients_1/sub_4_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:

gradients_1/sub_4_grad/ReshapeReshapegradients_1/sub_4_grad/Sumgradients_1/sub_4_grad/Shape*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0

gradients_1/sub_4_grad/NegNeg/gradients_1/pow_1_grad/tuple/control_dependency*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
¯
gradients_1/sub_4_grad/Sum_1Sumgradients_1/sub_4_grad/Neg.gradients_1/sub_4_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
T0*
	keep_dims( 
¥
 gradients_1/sub_4_grad/Reshape_1Reshapegradients_1/sub_4_grad/Sum_1gradients_1/sub_4_grad/Shape_1*
Tshape0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
z
'gradients_1/sub_4_grad/tuple/group_depsNoOp^Adam^gradients_1/sub_4_grad/Reshape!^gradients_1/sub_4_grad/Reshape_1
æ
/gradients_1/sub_4_grad/tuple/control_dependencyIdentitygradients_1/sub_4_grad/Reshape(^gradients_1/sub_4_grad/tuple/group_deps*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*1
_class'
%#loc:@gradients_1/sub_4_grad/Reshape*
T0
ì
1gradients_1/sub_4_grad/tuple/control_dependency_1Identity gradients_1/sub_4_grad/Reshape_1(^gradients_1/sub_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_4_grad/Reshape_1*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

%gradients_1/main/v/Squeeze_grad/ShapeShapemain/v/dense_2/BiasAdd^Adam*
out_type0*
T0*
_output_shapes
:
Ì
'gradients_1/main/v/Squeeze_grad/ReshapeReshape1gradients_1/sub_5_grad/tuple/control_dependency_1%gradients_1/main/v/Squeeze_grad/Shape*
Tshape0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0

&gradients_1/main/q1/Squeeze_grad/ShapeShapemain/q1/dense_2/BiasAdd^Adam*
T0*
_output_shapes
:*
out_type0
Î
(gradients_1/main/q1/Squeeze_grad/ReshapeReshape1gradients_1/sub_3_grad/tuple/control_dependency_1&gradients_1/main/q1/Squeeze_grad/Shape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0

&gradients_1/main/q2/Squeeze_grad/ShapeShapemain/q2/dense_2/BiasAdd^Adam*
_output_shapes
:*
T0*
out_type0
Î
(gradients_1/main/q2/Squeeze_grad/ReshapeReshape1gradients_1/sub_4_grad/tuple/control_dependency_1&gradients_1/main/q2/Squeeze_grad/Shape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
Tshape0
§
3gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad'gradients_1/main/v/Squeeze_grad/Reshape*
_output_shapes
:*
T0*
data_formatNHWC
§
8gradients_1/main/v/dense_2/BiasAdd_grad/tuple/group_depsNoOp^Adam(^gradients_1/main/v/Squeeze_grad/Reshape4^gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGrad

@gradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity'gradients_1/main/v/Squeeze_grad/Reshape9^gradients_1/main/v/dense_2/BiasAdd_grad/tuple/group_deps*:
_class0
.,loc:@gradients_1/main/v/Squeeze_grad/Reshape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
«
Bgradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity3gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGrad9^gradients_1/main/v/dense_2/BiasAdd_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGrad*
_output_shapes
:
©
4gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad(gradients_1/main/q1/Squeeze_grad/Reshape*
T0*
data_formatNHWC*
_output_shapes
:
ª
9gradients_1/main/q1/dense_2/BiasAdd_grad/tuple/group_depsNoOp^Adam)^gradients_1/main/q1/Squeeze_grad/Reshape5^gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGrad
¢
Agradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity(gradients_1/main/q1/Squeeze_grad/Reshape:^gradients_1/main/q1/dense_2/BiasAdd_grad/tuple/group_deps*;
_class1
/-loc:@gradients_1/main/q1/Squeeze_grad/Reshape*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¯
Cgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q1/dense_2/BiasAdd_grad/tuple/group_deps*G
_class=
;9loc:@gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:
©
4gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad(gradients_1/main/q2/Squeeze_grad/Reshape*
T0*
data_formatNHWC*
_output_shapes
:
ª
9gradients_1/main/q2/dense_2/BiasAdd_grad/tuple/group_depsNoOp^Adam)^gradients_1/main/q2/Squeeze_grad/Reshape5^gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGrad
¢
Agradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity(gradients_1/main/q2/Squeeze_grad/Reshape:^gradients_1/main/q2/dense_2/BiasAdd_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*;
_class1
/-loc:@gradients_1/main/q2/Squeeze_grad/Reshape
¯
Cgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q2/dense_2/BiasAdd_grad/tuple/group_deps*G
_class=
;9loc:@gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGrad*
_output_shapes
:*
T0
î
-gradients_1/main/v/dense_2/MatMul_grad/MatMulMatMul@gradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependencymain/v/dense_2/kernel/read*
transpose_a( *
transpose_b(*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
à
/gradients_1/main/v/dense_2/MatMul_grad/MatMul_1MatMulmain/v/dense_1/Relu@gradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	¬*
transpose_b( *
T0*
transpose_a(
¨
7gradients_1/main/v/dense_2/MatMul_grad/tuple/group_depsNoOp^Adam.^gradients_1/main/v/dense_2/MatMul_grad/MatMul0^gradients_1/main/v/dense_2/MatMul_grad/MatMul_1
©
?gradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependencyIdentity-gradients_1/main/v/dense_2/MatMul_grad/MatMul8^gradients_1/main/v/dense_2/MatMul_grad/tuple/group_deps*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*@
_class6
42loc:@gradients_1/main/v/dense_2/MatMul_grad/MatMul
¦
Agradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependency_1Identity/gradients_1/main/v/dense_2/MatMul_grad/MatMul_18^gradients_1/main/v/dense_2/MatMul_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients_1/main/v/dense_2/MatMul_grad/MatMul_1*
_output_shapes
:	¬
ñ
.gradients_1/main/q1/dense_2/MatMul_grad/MatMulMatMulAgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependencymain/q1/dense_2/kernel/read*
transpose_a( *
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
transpose_b(
ã
0gradients_1/main/q1/dense_2/MatMul_grad/MatMul_1MatMulmain/q1/dense_1/ReluAgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
_output_shapes
:	¬*
T0
«
8gradients_1/main/q1/dense_2/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q1/dense_2/MatMul_grad/MatMul1^gradients_1/main/q1/dense_2/MatMul_grad/MatMul_1
­
@gradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q1/dense_2/MatMul_grad/MatMul9^gradients_1/main/q1/dense_2/MatMul_grad/tuple/group_deps*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*A
_class7
53loc:@gradients_1/main/q1/dense_2/MatMul_grad/MatMul*
T0
ª
Bgradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q1/dense_2/MatMul_grad/MatMul_19^gradients_1/main/q1/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*C
_class9
75loc:@gradients_1/main/q1/dense_2/MatMul_grad/MatMul_1*
T0
ñ
.gradients_1/main/q2/dense_2/MatMul_grad/MatMulMatMulAgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependencymain/q2/dense_2/kernel/read*
transpose_b(*
transpose_a( *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
ã
0gradients_1/main/q2/dense_2/MatMul_grad/MatMul_1MatMulmain/q2/dense_1/ReluAgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	¬*
T0*
transpose_a(*
transpose_b( 
«
8gradients_1/main/q2/dense_2/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q2/dense_2/MatMul_grad/MatMul1^gradients_1/main/q2/dense_2/MatMul_grad/MatMul_1
­
@gradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q2/dense_2/MatMul_grad/MatMul9^gradients_1/main/q2/dense_2/MatMul_grad/tuple/group_deps*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*A
_class7
53loc:@gradients_1/main/q2/dense_2/MatMul_grad/MatMul
ª
Bgradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q2/dense_2/MatMul_grad/MatMul_19^gradients_1/main/q2/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*C
_class9
75loc:@gradients_1/main/q2/dense_2/MatMul_grad/MatMul_1*
T0
Â
-gradients_1/main/v/dense_1/Relu_grad/ReluGradReluGrad?gradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependencymain/v/dense_1/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
Å
.gradients_1/main/q1/dense_1/Relu_grad/ReluGradReluGrad@gradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependencymain/q1/dense_1/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
Å
.gradients_1/main/q2/dense_1/Relu_grad/ReluGradReluGrad@gradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependencymain/q2/dense_1/Relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
®
3gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad-gradients_1/main/v/dense_1/Relu_grad/ReluGrad*
data_formatNHWC*
T0*
_output_shapes	
:¬
­
8gradients_1/main/v/dense_1/BiasAdd_grad/tuple/group_depsNoOp^Adam4^gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGrad.^gradients_1/main/v/dense_1/Relu_grad/ReluGrad
«
@gradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity-gradients_1/main/v/dense_1/Relu_grad/ReluGrad9^gradients_1/main/v/dense_1/BiasAdd_grad/tuple/group_deps*@
_class6
42loc:@gradients_1/main/v/dense_1/Relu_grad/ReluGrad*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
¬
Bgradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity3gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGrad9^gradients_1/main/v/dense_1/BiasAdd_grad/tuple/group_deps*F
_class<
:8loc:@gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:¬
°
4gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad.gradients_1/main/q1/dense_1/Relu_grad/ReluGrad*
_output_shapes	
:¬*
data_formatNHWC*
T0
°
9gradients_1/main/q1/dense_1/BiasAdd_grad/tuple/group_depsNoOp^Adam5^gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGrad/^gradients_1/main/q1/dense_1/Relu_grad/ReluGrad
¯
Agradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity.gradients_1/main/q1/dense_1/Relu_grad/ReluGrad:^gradients_1/main/q1/dense_1/BiasAdd_grad/tuple/group_deps*A
_class7
53loc:@gradients_1/main/q1/dense_1/Relu_grad/ReluGrad*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*
T0
°
Cgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q1/dense_1/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:¬*G
_class=
;9loc:@gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGrad*
T0
°
4gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad.gradients_1/main/q2/dense_1/Relu_grad/ReluGrad*
T0*
data_formatNHWC*
_output_shapes	
:¬
°
9gradients_1/main/q2/dense_1/BiasAdd_grad/tuple/group_depsNoOp^Adam5^gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGrad/^gradients_1/main/q2/dense_1/Relu_grad/ReluGrad
¯
Agradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity.gradients_1/main/q2/dense_1/Relu_grad/ReluGrad:^gradients_1/main/q2/dense_1/BiasAdd_grad/tuple/group_deps*A
_class7
53loc:@gradients_1/main/q2/dense_1/Relu_grad/ReluGrad*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
°
Cgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q2/dense_1/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:¬*
T0*G
_class=
;9loc:@gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGrad
î
-gradients_1/main/v/dense_1/MatMul_grad/MatMulMatMul@gradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependencymain/v/dense_1/kernel/read*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ß
/gradients_1/main/v/dense_1/MatMul_grad/MatMul_1MatMulmain/v/dense/Relu@gradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependency* 
_output_shapes
:
¬*
transpose_b( *
transpose_a(*
T0
¨
7gradients_1/main/v/dense_1/MatMul_grad/tuple/group_depsNoOp^Adam.^gradients_1/main/v/dense_1/MatMul_grad/MatMul0^gradients_1/main/v/dense_1/MatMul_grad/MatMul_1
©
?gradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependencyIdentity-gradients_1/main/v/dense_1/MatMul_grad/MatMul8^gradients_1/main/v/dense_1/MatMul_grad/tuple/group_deps*@
_class6
42loc:@gradients_1/main/v/dense_1/MatMul_grad/MatMul*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
§
Agradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependency_1Identity/gradients_1/main/v/dense_1/MatMul_grad/MatMul_18^gradients_1/main/v/dense_1/MatMul_grad/tuple/group_deps* 
_output_shapes
:
¬*
T0*B
_class8
64loc:@gradients_1/main/v/dense_1/MatMul_grad/MatMul_1
ñ
.gradients_1/main/q1/dense_1/MatMul_grad/MatMulMatMulAgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependencymain/q1/dense_1/kernel/read*
transpose_b(*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_a( *
T0
â
0gradients_1/main/q1/dense_1/MatMul_grad/MatMul_1MatMulmain/q1/dense/ReluAgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependency* 
_output_shapes
:
¬*
transpose_a(*
transpose_b( *
T0
«
8gradients_1/main/q1/dense_1/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q1/dense_1/MatMul_grad/MatMul1^gradients_1/main/q1/dense_1/MatMul_grad/MatMul_1
­
@gradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q1/dense_1/MatMul_grad/MatMul9^gradients_1/main/q1/dense_1/MatMul_grad/tuple/group_deps*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*A
_class7
53loc:@gradients_1/main/q1/dense_1/MatMul_grad/MatMul*
T0
«
Bgradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q1/dense_1/MatMul_grad/MatMul_19^gradients_1/main/q1/dense_1/MatMul_grad/tuple/group_deps* 
_output_shapes
:
¬*
T0*C
_class9
75loc:@gradients_1/main/q1/dense_1/MatMul_grad/MatMul_1
ñ
.gradients_1/main/q2/dense_1/MatMul_grad/MatMulMatMulAgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependencymain/q2/dense_1/kernel/read*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
transpose_b(*
transpose_a( 
â
0gradients_1/main/q2/dense_1/MatMul_grad/MatMul_1MatMulmain/q2/dense/ReluAgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
¬*
transpose_a(*
transpose_b( 
«
8gradients_1/main/q2/dense_1/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q2/dense_1/MatMul_grad/MatMul1^gradients_1/main/q2/dense_1/MatMul_grad/MatMul_1
­
@gradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q2/dense_1/MatMul_grad/MatMul9^gradients_1/main/q2/dense_1/MatMul_grad/tuple/group_deps*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*A
_class7
53loc:@gradients_1/main/q2/dense_1/MatMul_grad/MatMul*
T0
«
Bgradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q2/dense_1/MatMul_grad/MatMul_19^gradients_1/main/q2/dense_1/MatMul_grad/tuple/group_deps*C
_class9
75loc:@gradients_1/main/q2/dense_1/MatMul_grad/MatMul_1*
T0* 
_output_shapes
:
¬
¾
+gradients_1/main/v/dense/Relu_grad/ReluGradReluGrad?gradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependencymain/v/dense/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Á
,gradients_1/main/q1/dense/Relu_grad/ReluGradReluGrad@gradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependencymain/q1/dense/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
Á
,gradients_1/main/q2/dense/Relu_grad/ReluGradReluGrad@gradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependencymain/q2/dense/Relu*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
T0
ª
1gradients_1/main/v/dense/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients_1/main/v/dense/Relu_grad/ReluGrad*
_output_shapes	
:*
T0*
data_formatNHWC
§
6gradients_1/main/v/dense/BiasAdd_grad/tuple/group_depsNoOp^Adam2^gradients_1/main/v/dense/BiasAdd_grad/BiasAddGrad,^gradients_1/main/v/dense/Relu_grad/ReluGrad
£
>gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependencyIdentity+gradients_1/main/v/dense/Relu_grad/ReluGrad7^gradients_1/main/v/dense/BiasAdd_grad/tuple/group_deps*>
_class4
20loc:@gradients_1/main/v/dense/Relu_grad/ReluGrad*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¤
@gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependency_1Identity1gradients_1/main/v/dense/BiasAdd_grad/BiasAddGrad7^gradients_1/main/v/dense/BiasAdd_grad/tuple/group_deps*D
_class:
86loc:@gradients_1/main/v/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:*
T0
¬
2gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients_1/main/q1/dense/Relu_grad/ReluGrad*
data_formatNHWC*
T0*
_output_shapes	
:
ª
7gradients_1/main/q1/dense/BiasAdd_grad/tuple/group_depsNoOp^Adam3^gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGrad-^gradients_1/main/q1/dense/Relu_grad/ReluGrad
§
?gradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependencyIdentity,gradients_1/main/q1/dense/Relu_grad/ReluGrad8^gradients_1/main/q1/dense/BiasAdd_grad/tuple/group_deps*?
_class5
31loc:@gradients_1/main/q1/dense/Relu_grad/ReluGrad*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¨
Agradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependency_1Identity2gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGrad8^gradients_1/main/q1/dense/BiasAdd_grad/tuple/group_deps*E
_class;
97loc:@gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
¬
2gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients_1/main/q2/dense/Relu_grad/ReluGrad*
_output_shapes	
:*
data_formatNHWC*
T0
ª
7gradients_1/main/q2/dense/BiasAdd_grad/tuple/group_depsNoOp^Adam3^gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGrad-^gradients_1/main/q2/dense/Relu_grad/ReluGrad
§
?gradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependencyIdentity,gradients_1/main/q2/dense/Relu_grad/ReluGrad8^gradients_1/main/q2/dense/BiasAdd_grad/tuple/group_deps*?
_class5
31loc:@gradients_1/main/q2/dense/Relu_grad/ReluGrad*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
¨
Agradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependency_1Identity2gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGrad8^gradients_1/main/q2/dense/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:*E
_class;
97loc:@gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGrad*
T0
ç
+gradients_1/main/v/dense/MatMul_grad/MatMulMatMul>gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependencymain/v/dense/kernel/read*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6*
transpose_a( *
transpose_b(
Ö
-gradients_1/main/v/dense/MatMul_grad/MatMul_1MatMulPlaceholder_1>gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
_output_shapes
:	6*
T0*
transpose_a(
¢
5gradients_1/main/v/dense/MatMul_grad/tuple/group_depsNoOp^Adam,^gradients_1/main/v/dense/MatMul_grad/MatMul.^gradients_1/main/v/dense/MatMul_grad/MatMul_1
 
=gradients_1/main/v/dense/MatMul_grad/tuple/control_dependencyIdentity+gradients_1/main/v/dense/MatMul_grad/MatMul6^gradients_1/main/v/dense/MatMul_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ6*
T0*>
_class4
20loc:@gradients_1/main/v/dense/MatMul_grad/MatMul

?gradients_1/main/v/dense/MatMul_grad/tuple/control_dependency_1Identity-gradients_1/main/v/dense/MatMul_grad/MatMul_16^gradients_1/main/v/dense/MatMul_grad/tuple/group_deps*@
_class6
42loc:@gradients_1/main/v/dense/MatMul_grad/MatMul_1*
_output_shapes
:	6*
T0
ê
,gradients_1/main/q1/dense/MatMul_grad/MatMulMatMul?gradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependencymain/q1/dense/kernel/read*
transpose_a( *
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*
transpose_b(
Ù
.gradients_1/main/q1/dense/MatMul_grad/MatMul_1MatMulmain/q1/concat?gradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( *
_output_shapes
:	B
¥
6gradients_1/main/q1/dense/MatMul_grad/tuple/group_depsNoOp^Adam-^gradients_1/main/q1/dense/MatMul_grad/MatMul/^gradients_1/main/q1/dense/MatMul_grad/MatMul_1
¤
>gradients_1/main/q1/dense/MatMul_grad/tuple/control_dependencyIdentity,gradients_1/main/q1/dense/MatMul_grad/MatMul7^gradients_1/main/q1/dense/MatMul_grad/tuple/group_deps*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*?
_class5
31loc:@gradients_1/main/q1/dense/MatMul_grad/MatMul*
T0
¢
@gradients_1/main/q1/dense/MatMul_grad/tuple/control_dependency_1Identity.gradients_1/main/q1/dense/MatMul_grad/MatMul_17^gradients_1/main/q1/dense/MatMul_grad/tuple/group_deps*A
_class7
53loc:@gradients_1/main/q1/dense/MatMul_grad/MatMul_1*
_output_shapes
:	B*
T0
ê
,gradients_1/main/q2/dense/MatMul_grad/MatMulMatMul?gradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependencymain/q2/dense/kernel/read*
transpose_b(*
transpose_a( *
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB
Ù
.gradients_1/main/q2/dense/MatMul_grad/MatMul_1MatMulmain/q2/concat?gradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
_output_shapes
:	B*
transpose_a(*
T0
¥
6gradients_1/main/q2/dense/MatMul_grad/tuple/group_depsNoOp^Adam-^gradients_1/main/q2/dense/MatMul_grad/MatMul/^gradients_1/main/q2/dense/MatMul_grad/MatMul_1
¤
>gradients_1/main/q2/dense/MatMul_grad/tuple/control_dependencyIdentity,gradients_1/main/q2/dense/MatMul_grad/MatMul7^gradients_1/main/q2/dense/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿB*?
_class5
31loc:@gradients_1/main/q2/dense/MatMul_grad/MatMul
¢
@gradients_1/main/q2/dense/MatMul_grad/tuple/control_dependency_1Identity.gradients_1/main/q2/dense/MatMul_grad/MatMul_17^gradients_1/main/q2/dense/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/main/q2/dense/MatMul_grad/MatMul_1*
_output_shapes
:	B

beta1_power_1/initial_valueConst*
_output_shapes
: *
valueB
 *fff?*%
_class
loc:@main/q1/dense/bias*
dtype0

beta1_power_1
VariableV2*
_output_shapes
: *
	container *
dtype0*%
_class
loc:@main/q1/dense/bias*
shared_name *
shape: 
»
beta1_power_1/AssignAssignbeta1_power_1beta1_power_1/initial_value*
use_locking(*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: *
T0*
validate_shape(
u
beta1_power_1/readIdentitybeta1_power_1*
T0*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: 

beta2_power_1/initial_valueConst*
valueB
 *w¾?*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
dtype0

beta2_power_1
VariableV2*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: *
shared_name *
	container *
shape: *
dtype0
»
beta2_power_1/AssignAssignbeta2_power_1beta2_power_1/initial_value*
_output_shapes
: *
validate_shape(*
use_locking(*
T0*%
_class
loc:@main/q1/dense/bias
u
beta2_power_1/readIdentitybeta2_power_1*
_output_shapes
: *
T0*%
_class
loc:@main/q1/dense/bias
µ
;main/q1/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"B     *'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:*
dtype0

1main/q1/dense/kernel/Adam/Initializer/zeros/ConstConst*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
: *
valueB
 *    *
dtype0

+main/q1/dense/kernel/Adam/Initializer/zerosFill;main/q1/dense/kernel/Adam/Initializer/zeros/shape_as_tensor1main/q1/dense/kernel/Adam/Initializer/zeros/Const*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*

index_type0*
T0
¸
main/q1/dense/kernel/Adam
VariableV2*
shared_name *
dtype0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
shape:	B*
	container 
î
 main/q1/dense/kernel/Adam/AssignAssignmain/q1/dense/kernel/Adam+main/q1/dense/kernel/Adam/Initializer/zeros*
use_locking(*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
:	B*
validate_shape(

main/q1/dense/kernel/Adam/readIdentitymain/q1/dense/kernel/Adam*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*
T0
·
=main/q1/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"B     *
_output_shapes
:*'
_class
loc:@main/q1/dense/kernel*
dtype0
¡
3main/q1/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
: *
valueB
 *    

-main/q1/dense/kernel/Adam_1/Initializer/zerosFill=main/q1/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor3main/q1/dense/kernel/Adam_1/Initializer/zeros/Const*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*

index_type0*
T0
º
main/q1/dense/kernel/Adam_1
VariableV2*'
_class
loc:@main/q1/dense/kernel*
dtype0*
shared_name *
_output_shapes
:	B*
	container *
shape:	B
ô
"main/q1/dense/kernel/Adam_1/AssignAssignmain/q1/dense/kernel/Adam_1-main/q1/dense/kernel/Adam_1/Initializer/zeros*
T0*
_output_shapes
:	B*
use_locking(*
validate_shape(*'
_class
loc:@main/q1/dense/kernel

 main/q1/dense/kernel/Adam_1/readIdentitymain/q1/dense/kernel/Adam_1*
T0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B

)main/q1/dense/bias/Adam/Initializer/zerosConst*%
_class
loc:@main/q1/dense/bias*
valueB*    *
dtype0*
_output_shapes	
:
¬
main/q1/dense/bias/Adam
VariableV2*%
_class
loc:@main/q1/dense/bias*
shape:*
shared_name *
_output_shapes	
:*
dtype0*
	container 
â
main/q1/dense/bias/Adam/AssignAssignmain/q1/dense/bias/Adam)main/q1/dense/bias/Adam/Initializer/zeros*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(*%
_class
loc:@main/q1/dense/bias

main/q1/dense/bias/Adam/readIdentitymain/q1/dense/bias/Adam*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:
¡
+main/q1/dense/bias/Adam_1/Initializer/zerosConst*
dtype0*
_output_shapes	
:*
valueB*    *%
_class
loc:@main/q1/dense/bias
®
main/q1/dense/bias/Adam_1
VariableV2*
shared_name *
	container *
dtype0*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
shape:
è
 main/q1/dense/bias/Adam_1/AssignAssignmain/q1/dense/bias/Adam_1+main/q1/dense/bias/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:

main/q1/dense/bias/Adam_1/readIdentitymain/q1/dense/bias/Adam_1*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
T0
¹
=main/q1/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
valueB"  ,  *)
_class
loc:@main/q1/dense_1/kernel*
dtype0
£
3main/q1/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*)
_class
loc:@main/q1/dense_1/kernel*
_output_shapes
: 

-main/q1/dense_1/kernel/Adam/Initializer/zerosFill=main/q1/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor3main/q1/dense_1/kernel/Adam/Initializer/zeros/Const* 
_output_shapes
:
¬*

index_type0*)
_class
loc:@main/q1/dense_1/kernel*
T0
¾
main/q1/dense_1/kernel/Adam
VariableV2*
shared_name *
	container *
dtype0* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel*
shape:
¬
÷
"main/q1/dense_1/kernel/Adam/AssignAssignmain/q1/dense_1/kernel/Adam-main/q1/dense_1/kernel/Adam/Initializer/zeros*
T0*
use_locking(*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬*
validate_shape(

 main/q1/dense_1/kernel/Adam/readIdentitymain/q1/dense_1/kernel/Adam*)
_class
loc:@main/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬
»
?main/q1/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"  ,  *
dtype0*)
_class
loc:@main/q1/dense_1/kernel*
_output_shapes
:
¥
5main/q1/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
_output_shapes
: *
dtype0*)
_class
loc:@main/q1/dense_1/kernel*
valueB
 *    

/main/q1/dense_1/kernel/Adam_1/Initializer/zerosFill?main/q1/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/q1/dense_1/kernel/Adam_1/Initializer/zeros/Const* 
_output_shapes
:
¬*

index_type0*
T0*)
_class
loc:@main/q1/dense_1/kernel
À
main/q1/dense_1/kernel/Adam_1
VariableV2*
shared_name *)
_class
loc:@main/q1/dense_1/kernel*
shape:
¬*
	container * 
_output_shapes
:
¬*
dtype0
ı
$main/q1/dense_1/kernel/Adam_1/AssignAssignmain/q1/dense_1/kernel/Adam_1/main/q1/dense_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬
£
"main/q1/dense_1/kernel/Adam_1/readIdentitymain/q1/dense_1/kernel/Adam_1*
T0*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬
£
+main/q1/dense_1/bias/Adam/Initializer/zerosConst*
_output_shapes	
:¬*
valueB¬*    *
dtype0*'
_class
loc:@main/q1/dense_1/bias
°
main/q1/dense_1/bias/Adam
VariableV2*
shape:¬*
	container *
dtype0*
_output_shapes	
:¬*
shared_name *'
_class
loc:@main/q1/dense_1/bias
ê
 main/q1/dense_1/bias/Adam/AssignAssignmain/q1/dense_1/bias/Adam+main/q1/dense_1/bias/Adam/Initializer/zeros*
_output_shapes	
:¬*
validate_shape(*'
_class
loc:@main/q1/dense_1/bias*
T0*
use_locking(

main/q1/dense_1/bias/Adam/readIdentitymain/q1/dense_1/bias/Adam*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
T0
¥
-main/q1/dense_1/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
valueB¬*    *
dtype0
²
main/q1/dense_1/bias/Adam_1
VariableV2*
_output_shapes	
:¬*
	container *
dtype0*'
_class
loc:@main/q1/dense_1/bias*
shape:¬*
shared_name 
ğ
"main/q1/dense_1/bias/Adam_1/AssignAssignmain/q1/dense_1/bias/Adam_1-main/q1/dense_1/bias/Adam_1/Initializer/zeros*
T0*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
validate_shape(*
use_locking(

 main/q1/dense_1/bias/Adam_1/readIdentitymain/q1/dense_1/bias/Adam_1*
_output_shapes	
:¬*
T0*'
_class
loc:@main/q1/dense_1/bias
¯
-main/q1/dense_2/kernel/Adam/Initializer/zerosConst*
dtype0*
valueB	¬*    *
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel
¼
main/q1/dense_2/kernel/Adam
VariableV2*
_output_shapes
:	¬*
shape:	¬*
shared_name *
dtype0*
	container *)
_class
loc:@main/q1/dense_2/kernel
ö
"main/q1/dense_2/kernel/Adam/AssignAssignmain/q1/dense_2/kernel/Adam-main/q1/dense_2/kernel/Adam/Initializer/zeros*
T0*
validate_shape(*
use_locking(*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel

 main/q1/dense_2/kernel/Adam/readIdentitymain/q1/dense_2/kernel/Adam*
_output_shapes
:	¬*
T0*)
_class
loc:@main/q1/dense_2/kernel
±
/main/q1/dense_2/kernel/Adam_1/Initializer/zerosConst*
valueB	¬*    *)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:	¬*
dtype0
¾
main/q1/dense_2/kernel/Adam_1
VariableV2*)
_class
loc:@main/q1/dense_2/kernel*
dtype0*
shared_name *
	container *
_output_shapes
:	¬*
shape:	¬
ü
$main/q1/dense_2/kernel/Adam_1/AssignAssignmain/q1/dense_2/kernel/Adam_1/main/q1/dense_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel*
validate_shape(
¢
"main/q1/dense_2/kernel/Adam_1/readIdentitymain/q1/dense_2/kernel/Adam_1*
_output_shapes
:	¬*
T0*)
_class
loc:@main/q1/dense_2/kernel
¡
+main/q1/dense_2/bias/Adam/Initializer/zerosConst*
valueB*    *'
_class
loc:@main/q1/dense_2/bias*
dtype0*
_output_shapes
:
®
main/q1/dense_2/bias/Adam
VariableV2*
_output_shapes
:*
	container *'
_class
loc:@main/q1/dense_2/bias*
shared_name *
dtype0*
shape:
é
 main/q1/dense_2/bias/Adam/AssignAssignmain/q1/dense_2/bias/Adam+main/q1/dense_2/bias/Adam/Initializer/zeros*
use_locking(*'
_class
loc:@main/q1/dense_2/bias*
validate_shape(*
_output_shapes
:*
T0

main/q1/dense_2/bias/Adam/readIdentitymain/q1/dense_2/bias/Adam*
T0*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:
£
-main/q1/dense_2/bias/Adam_1/Initializer/zerosConst*
_output_shapes
:*
valueB*    *'
_class
loc:@main/q1/dense_2/bias*
dtype0
°
main/q1/dense_2/bias/Adam_1
VariableV2*
shared_name *
shape:*
dtype0*
_output_shapes
:*
	container *'
_class
loc:@main/q1/dense_2/bias
ï
"main/q1/dense_2/bias/Adam_1/AssignAssignmain/q1/dense_2/bias/Adam_1-main/q1/dense_2/bias/Adam_1/Initializer/zeros*
_output_shapes
:*
validate_shape(*'
_class
loc:@main/q1/dense_2/bias*
use_locking(*
T0

 main/q1/dense_2/bias/Adam_1/readIdentitymain/q1/dense_2/bias/Adam_1*
T0*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:
µ
;main/q2/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*'
_class
loc:@main/q2/dense/kernel*
dtype0*
valueB"B     *
_output_shapes
:

1main/q2/dense/kernel/Adam/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *'
_class
loc:@main/q2/dense/kernel*
_output_shapes
: 

+main/q2/dense/kernel/Adam/Initializer/zerosFill;main/q2/dense/kernel/Adam/Initializer/zeros/shape_as_tensor1main/q2/dense/kernel/Adam/Initializer/zeros/Const*
_output_shapes
:	B*
T0*

index_type0*'
_class
loc:@main/q2/dense/kernel
¸
main/q2/dense/kernel/Adam
VariableV2*
dtype0*
shared_name *
	container *
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
shape:	B
î
 main/q2/dense/kernel/Adam/AssignAssignmain/q2/dense/kernel/Adam+main/q2/dense/kernel/Adam/Initializer/zeros*'
_class
loc:@main/q2/dense/kernel*
T0*
_output_shapes
:	B*
use_locking(*
validate_shape(

main/q2/dense/kernel/Adam/readIdentitymain/q2/dense/kernel/Adam*
_output_shapes
:	B*
T0*'
_class
loc:@main/q2/dense/kernel
·
=main/q2/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
valueB"B     *'
_class
loc:@main/q2/dense/kernel*
dtype0
¡
3main/q2/dense/kernel/Adam_1/Initializer/zeros/ConstConst*'
_class
loc:@main/q2/dense/kernel*
valueB
 *    *
_output_shapes
: *
dtype0

-main/q2/dense/kernel/Adam_1/Initializer/zerosFill=main/q2/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor3main/q2/dense/kernel/Adam_1/Initializer/zeros/Const*'
_class
loc:@main/q2/dense/kernel*
T0*
_output_shapes
:	B*

index_type0
º
main/q2/dense/kernel/Adam_1
VariableV2*
_output_shapes
:	B*
	container *
shape:	B*
dtype0*'
_class
loc:@main/q2/dense/kernel*
shared_name 
ô
"main/q2/dense/kernel/Adam_1/AssignAssignmain/q2/dense/kernel/Adam_1-main/q2/dense/kernel/Adam_1/Initializer/zeros*
validate_shape(*
T0*'
_class
loc:@main/q2/dense/kernel*
use_locking(*
_output_shapes
:	B

 main/q2/dense/kernel/Adam_1/readIdentitymain/q2/dense/kernel/Adam_1*'
_class
loc:@main/q2/dense/kernel*
T0*
_output_shapes
:	B

)main/q2/dense/bias/Adam/Initializer/zerosConst*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
valueB*    *
dtype0
¬
main/q2/dense/bias/Adam
VariableV2*
_output_shapes	
:*
shared_name *
dtype0*%
_class
loc:@main/q2/dense/bias*
	container *
shape:
â
main/q2/dense/bias/Adam/AssignAssignmain/q2/dense/bias/Adam)main/q2/dense/bias/Adam/Initializer/zeros*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias*
validate_shape(*
use_locking(*
T0

main/q2/dense/bias/Adam/readIdentitymain/q2/dense/bias/Adam*
T0*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias
¡
+main/q2/dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:*
valueB*    *%
_class
loc:@main/q2/dense/bias*
dtype0
®
main/q2/dense/bias/Adam_1
VariableV2*
_output_shapes	
:*
shared_name *
	container *
shape:*
dtype0*%
_class
loc:@main/q2/dense/bias
è
 main/q2/dense/bias/Adam_1/AssignAssignmain/q2/dense/bias/Adam_1+main/q2/dense/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*%
_class
loc:@main/q2/dense/bias*
validate_shape(*
_output_shapes	
:

main/q2/dense/bias/Adam_1/readIdentitymain/q2/dense/bias/Adam_1*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
T0
¹
=main/q2/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*)
_class
loc:@main/q2/dense_1/kernel*
valueB"  ,  *
_output_shapes
:
£
3main/q2/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
_output_shapes
: *)
_class
loc:@main/q2/dense_1/kernel*
dtype0

-main/q2/dense_1/kernel/Adam/Initializer/zerosFill=main/q2/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor3main/q2/dense_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel
¾
main/q2/dense_1/kernel/Adam
VariableV2* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
dtype0*
	container *
shared_name *
shape:
¬
÷
"main/q2/dense_1/kernel/Adam/AssignAssignmain/q2/dense_1/kernel/Adam-main/q2/dense_1/kernel/Adam/Initializer/zeros*
use_locking(* 
_output_shapes
:
¬*
T0*
validate_shape(*)
_class
loc:@main/q2/dense_1/kernel

 main/q2/dense_1/kernel/Adam/readIdentitymain/q2/dense_1/kernel/Adam*
T0*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬
»
?main/q2/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*)
_class
loc:@main/q2/dense_1/kernel*
valueB"  ,  
¥
5main/q2/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *)
_class
loc:@main/q2/dense_1/kernel*
_output_shapes
: 

/main/q2/dense_1/kernel/Adam_1/Initializer/zerosFill?main/q2/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/q2/dense_1/kernel/Adam_1/Initializer/zeros/Const*

index_type0*
T0*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬
À
main/q2/dense_1/kernel/Adam_1
VariableV2*
dtype0* 
_output_shapes
:
¬*
shape:
¬*)
_class
loc:@main/q2/dense_1/kernel*
	container *
shared_name 
ı
$main/q2/dense_1/kernel/Adam_1/AssignAssignmain/q2/dense_1/kernel/Adam_1/main/q2/dense_1/kernel/Adam_1/Initializer/zeros*)
_class
loc:@main/q2/dense_1/kernel*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*
T0
£
"main/q2/dense_1/kernel/Adam_1/readIdentitymain/q2/dense_1/kernel/Adam_1* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
T0
£
+main/q2/dense_1/bias/Adam/Initializer/zerosConst*
dtype0*
valueB¬*    *
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias
°
main/q2/dense_1/bias/Adam
VariableV2*
_output_shapes	
:¬*
	container *
shape:¬*'
_class
loc:@main/q2/dense_1/bias*
dtype0*
shared_name 
ê
 main/q2/dense_1/bias/Adam/AssignAssignmain/q2/dense_1/bias/Adam+main/q2/dense_1/bias/Adam/Initializer/zeros*
T0*
use_locking(*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
validate_shape(

main/q2/dense_1/bias/Adam/readIdentitymain/q2/dense_1/bias/Adam*
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias*
T0
¥
-main/q2/dense_1/bias/Adam_1/Initializer/zerosConst*'
_class
loc:@main/q2/dense_1/bias*
valueB¬*    *
dtype0*
_output_shapes	
:¬
²
main/q2/dense_1/bias/Adam_1
VariableV2*
dtype0*'
_class
loc:@main/q2/dense_1/bias*
shared_name *
	container *
shape:¬*
_output_shapes	
:¬
ğ
"main/q2/dense_1/bias/Adam_1/AssignAssignmain/q2/dense_1/bias/Adam_1-main/q2/dense_1/bias/Adam_1/Initializer/zeros*
_output_shapes	
:¬*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/q2/dense_1/bias

 main/q2/dense_1/bias/Adam_1/readIdentitymain/q2/dense_1/bias/Adam_1*'
_class
loc:@main/q2/dense_1/bias*
T0*
_output_shapes	
:¬
¯
-main/q2/dense_2/kernel/Adam/Initializer/zerosConst*)
_class
loc:@main/q2/dense_2/kernel*
dtype0*
_output_shapes
:	¬*
valueB	¬*    
¼
main/q2/dense_2/kernel/Adam
VariableV2*
	container *
shape:	¬*
shared_name *)
_class
loc:@main/q2/dense_2/kernel*
dtype0*
_output_shapes
:	¬
ö
"main/q2/dense_2/kernel/Adam/AssignAssignmain/q2/dense_2/kernel/Adam-main/q2/dense_2/kernel/Adam/Initializer/zeros*
validate_shape(*
_output_shapes
:	¬*
T0*
use_locking(*)
_class
loc:@main/q2/dense_2/kernel

 main/q2/dense_2/kernel/Adam/readIdentitymain/q2/dense_2/kernel/Adam*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
T0
±
/main/q2/dense_2/kernel/Adam_1/Initializer/zerosConst*
valueB	¬*    *
dtype0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel
¾
main/q2/dense_2/kernel/Adam_1
VariableV2*
dtype0*
	container *
shared_name *)
_class
loc:@main/q2/dense_2/kernel*
shape:	¬*
_output_shapes
:	¬
ü
$main/q2/dense_2/kernel/Adam_1/AssignAssignmain/q2/dense_2/kernel/Adam_1/main/q2/dense_2/kernel/Adam_1/Initializer/zeros*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(*
use_locking(*
T0
¢
"main/q2/dense_2/kernel/Adam_1/readIdentitymain/q2/dense_2/kernel/Adam_1*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
T0
¡
+main/q2/dense_2/bias/Adam/Initializer/zerosConst*
_output_shapes
:*
valueB*    *'
_class
loc:@main/q2/dense_2/bias*
dtype0
®
main/q2/dense_2/bias/Adam
VariableV2*
dtype0*
shared_name *'
_class
loc:@main/q2/dense_2/bias*
shape:*
	container *
_output_shapes
:
é
 main/q2/dense_2/bias/Adam/AssignAssignmain/q2/dense_2/bias/Adam+main/q2/dense_2/bias/Adam/Initializer/zeros*
_output_shapes
:*
T0*'
_class
loc:@main/q2/dense_2/bias*
validate_shape(*
use_locking(

main/q2/dense_2/bias/Adam/readIdentitymain/q2/dense_2/bias/Adam*'
_class
loc:@main/q2/dense_2/bias*
T0*
_output_shapes
:
£
-main/q2/dense_2/bias/Adam_1/Initializer/zerosConst*
dtype0*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
valueB*    
°
main/q2/dense_2/bias/Adam_1
VariableV2*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
dtype0*
	container *
shared_name *
shape:
ï
"main/q2/dense_2/bias/Adam_1/AssignAssignmain/q2/dense_2/bias/Adam_1-main/q2/dense_2/bias/Adam_1/Initializer/zeros*'
_class
loc:@main/q2/dense_2/bias*
use_locking(*
T0*
validate_shape(*
_output_shapes
:

 main/q2/dense_2/bias/Adam_1/readIdentitymain/q2/dense_2/bias/Adam_1*
T0*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:
³
:main/v/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:*
valueB"6     *
dtype0

0main/v/dense/kernel/Adam/Initializer/zeros/ConstConst*&
_class
loc:@main/v/dense/kernel*
valueB
 *    *
_output_shapes
: *
dtype0

*main/v/dense/kernel/Adam/Initializer/zerosFill:main/v/dense/kernel/Adam/Initializer/zeros/shape_as_tensor0main/v/dense/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6
¶
main/v/dense/kernel/Adam
VariableV2*&
_class
loc:@main/v/dense/kernel*
shared_name *
_output_shapes
:	6*
	container *
dtype0*
shape:	6
ê
main/v/dense/kernel/Adam/AssignAssignmain/v/dense/kernel/Adam*main/v/dense/kernel/Adam/Initializer/zeros*
_output_shapes
:	6*
use_locking(*
validate_shape(*
T0*&
_class
loc:@main/v/dense/kernel

main/v/dense/kernel/Adam/readIdentitymain/v/dense/kernel/Adam*
T0*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6
µ
<main/v/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"6     *&
_class
loc:@main/v/dense/kernel*
_output_shapes
:*
dtype0

2main/v/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
_output_shapes
: *&
_class
loc:@main/v/dense/kernel*
dtype0

,main/v/dense/kernel/Adam_1/Initializer/zerosFill<main/v/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor2main/v/dense/kernel/Adam_1/Initializer/zeros/Const*

index_type0*
_output_shapes
:	6*
T0*&
_class
loc:@main/v/dense/kernel
¸
main/v/dense/kernel/Adam_1
VariableV2*
shared_name *&
_class
loc:@main/v/dense/kernel*
shape:	6*
dtype0*
_output_shapes
:	6*
	container 
ğ
!main/v/dense/kernel/Adam_1/AssignAssignmain/v/dense/kernel/Adam_1,main/v/dense/kernel/Adam_1/Initializer/zeros*&
_class
loc:@main/v/dense/kernel*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	6

main/v/dense/kernel/Adam_1/readIdentitymain/v/dense/kernel/Adam_1*&
_class
loc:@main/v/dense/kernel*
T0*
_output_shapes
:	6

(main/v/dense/bias/Adam/Initializer/zerosConst*
valueB*    *
dtype0*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:
ª
main/v/dense/bias/Adam
VariableV2*
	container *$
_class
loc:@main/v/dense/bias*
shared_name *
dtype0*
shape:*
_output_shapes	
:
Ş
main/v/dense/bias/Adam/AssignAssignmain/v/dense/bias/Adam(main/v/dense/bias/Adam/Initializer/zeros*
_output_shapes	
:*
T0*
validate_shape(*$
_class
loc:@main/v/dense/bias*
use_locking(

main/v/dense/bias/Adam/readIdentitymain/v/dense/bias/Adam*
_output_shapes	
:*
T0*$
_class
loc:@main/v/dense/bias

*main/v/dense/bias/Adam_1/Initializer/zerosConst*
dtype0*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:*
valueB*    
¬
main/v/dense/bias/Adam_1
VariableV2*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
shared_name *
shape:*
	container *
dtype0
ä
main/v/dense/bias/Adam_1/AssignAssignmain/v/dense/bias/Adam_1*main/v/dense/bias/Adam_1/Initializer/zeros*
use_locking(*
validate_shape(*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:*
T0

main/v/dense/bias/Adam_1/readIdentitymain/v/dense/bias/Adam_1*
_output_shapes	
:*
T0*$
_class
loc:@main/v/dense/bias
·
<main/v/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*(
_class
loc:@main/v/dense_1/kernel*
dtype0*
_output_shapes
:*
valueB"  ,  
¡
2main/v/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
_output_shapes
: *(
_class
loc:@main/v/dense_1/kernel*
dtype0*
valueB
 *    

,main/v/dense_1/kernel/Adam/Initializer/zerosFill<main/v/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor2main/v/dense_1/kernel/Adam/Initializer/zeros/Const*

index_type0*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
¼
main/v/dense_1/kernel/Adam
VariableV2* 
_output_shapes
:
¬*
	container *
shared_name *
shape:
¬*
dtype0*(
_class
loc:@main/v/dense_1/kernel
ó
!main/v/dense_1/kernel/Adam/AssignAssignmain/v/dense_1/kernel/Adam,main/v/dense_1/kernel/Adam/Initializer/zeros*
validate_shape(* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
use_locking(*
T0

main/v/dense_1/kernel/Adam/readIdentitymain/v/dense_1/kernel/Adam*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
¹
>main/v/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"  ,  *
_output_shapes
:*(
_class
loc:@main/v/dense_1/kernel
£
4main/v/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
_output_shapes
: *(
_class
loc:@main/v/dense_1/kernel*
valueB
 *    *
dtype0

.main/v/dense_1/kernel/Adam_1/Initializer/zerosFill>main/v/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor4main/v/dense_1/kernel/Adam_1/Initializer/zeros/Const* 
_output_shapes
:
¬*
T0*

index_type0*(
_class
loc:@main/v/dense_1/kernel
¾
main/v/dense_1/kernel/Adam_1
VariableV2*
shape:
¬* 
_output_shapes
:
¬*
shared_name *
	container *(
_class
loc:@main/v/dense_1/kernel*
dtype0
ù
#main/v/dense_1/kernel/Adam_1/AssignAssignmain/v/dense_1/kernel/Adam_1.main/v/dense_1/kernel/Adam_1/Initializer/zeros*
validate_shape(*(
_class
loc:@main/v/dense_1/kernel*
use_locking(*
T0* 
_output_shapes
:
¬
 
!main/v/dense_1/kernel/Adam_1/readIdentitymain/v/dense_1/kernel/Adam_1*
T0*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬
¡
*main/v/dense_1/bias/Adam/Initializer/zerosConst*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
valueB¬*    *
dtype0
®
main/v/dense_1/bias/Adam
VariableV2*
_output_shapes	
:¬*
dtype0*
shape:¬*
	container *
shared_name *&
_class
loc:@main/v/dense_1/bias
æ
main/v/dense_1/bias/Adam/AssignAssignmain/v/dense_1/bias/Adam*main/v/dense_1/bias/Adam/Initializer/zeros*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
validate_shape(*
T0*
use_locking(

main/v/dense_1/bias/Adam/readIdentitymain/v/dense_1/bias/Adam*
T0*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias
£
,main/v/dense_1/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias*
dtype0*
valueB¬*    
°
main/v/dense_1/bias/Adam_1
VariableV2*
dtype0*
	container *
shared_name *&
_class
loc:@main/v/dense_1/bias*
shape:¬*
_output_shapes	
:¬
ì
!main/v/dense_1/bias/Adam_1/AssignAssignmain/v/dense_1/bias/Adam_1,main/v/dense_1/bias/Adam_1/Initializer/zeros*
_output_shapes	
:¬*
validate_shape(*
T0*
use_locking(*&
_class
loc:@main/v/dense_1/bias

main/v/dense_1/bias/Adam_1/readIdentitymain/v/dense_1/bias/Adam_1*&
_class
loc:@main/v/dense_1/bias*
T0*
_output_shapes	
:¬
­
,main/v/dense_2/kernel/Adam/Initializer/zerosConst*
valueB	¬*    *(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
dtype0
º
main/v/dense_2/kernel/Adam
VariableV2*
	container *
shape:	¬*
_output_shapes
:	¬*
dtype0*
shared_name *(
_class
loc:@main/v/dense_2/kernel
ò
!main/v/dense_2/kernel/Adam/AssignAssignmain/v/dense_2/kernel/Adam,main/v/dense_2/kernel/Adam/Initializer/zeros*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
T0*
use_locking(*
validate_shape(

main/v/dense_2/kernel/Adam/readIdentitymain/v/dense_2/kernel/Adam*
T0*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel
¯
.main/v/dense_2/kernel/Adam_1/Initializer/zerosConst*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
dtype0*
valueB	¬*    
¼
main/v/dense_2/kernel/Adam_1
VariableV2*
shape:	¬*
dtype0*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
shared_name *
	container 
ø
#main/v/dense_2/kernel/Adam_1/AssignAssignmain/v/dense_2/kernel/Adam_1.main/v/dense_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬

!main/v/dense_2/kernel/Adam_1/readIdentitymain/v/dense_2/kernel/Adam_1*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
T0

*main/v/dense_2/bias/Adam/Initializer/zerosConst*
dtype0*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
valueB*    
¬
main/v/dense_2/bias/Adam
VariableV2*
shape:*&
_class
loc:@main/v/dense_2/bias*
	container *
_output_shapes
:*
dtype0*
shared_name 
å
main/v/dense_2/bias/Adam/AssignAssignmain/v/dense_2/bias/Adam*main/v/dense_2/bias/Adam/Initializer/zeros*
use_locking(*
validate_shape(*
_output_shapes
:*
T0*&
_class
loc:@main/v/dense_2/bias

main/v/dense_2/bias/Adam/readIdentitymain/v/dense_2/bias/Adam*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
T0
¡
,main/v/dense_2/bias/Adam_1/Initializer/zerosConst*
dtype0*&
_class
loc:@main/v/dense_2/bias*
valueB*    *
_output_shapes
:
®
main/v/dense_2/bias/Adam_1
VariableV2*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
shape:*
	container *
shared_name *
dtype0
ë
!main/v/dense_2/bias/Adam_1/AssignAssignmain/v/dense_2/bias/Adam_1,main/v/dense_2/bias/Adam_1/Initializer/zeros*
use_locking(*
_output_shapes
:*
validate_shape(*&
_class
loc:@main/v/dense_2/bias*
T0

main/v/dense_2/bias/Adam_1/readIdentitymain/v/dense_2/bias/Adam_1*&
_class
loc:@main/v/dense_2/bias*
T0*
_output_shapes
:
`
Adam_1/learning_rateConst^Adam*
valueB
 *o:*
_output_shapes
: *
dtype0
X
Adam_1/beta1Const^Adam*
_output_shapes
: *
valueB
 *fff?*
dtype0
X
Adam_1/beta2Const^Adam*
dtype0*
_output_shapes
: *
valueB
 *w¾?
Z
Adam_1/epsilonConst^Adam*
_output_shapes
: *
dtype0*
valueB
 *wÌ+2
­
,Adam_1/update_main/q1/dense/kernel/ApplyAdam	ApplyAdammain/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon@gradients_1/main/q1/dense/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *'
_class
loc:@main/q1/dense/kernel*
use_locking( *
T0*
_output_shapes
:	B
 
*Adam_1/update_main/q1/dense/bias/ApplyAdam	ApplyAdammain/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependency_1*
T0*
use_locking( *%
_class
loc:@main/q1/dense/bias*
use_nesterov( *
_output_shapes	
:
º
.Adam_1/update_main/q1/dense_1/kernel/ApplyAdam	ApplyAdammain/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *)
_class
loc:@main/q1/dense_1/kernel*
use_locking( *
T0* 
_output_shapes
:
¬
¬
,Adam_1/update_main/q1/dense_1/bias/ApplyAdam	ApplyAdammain/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *'
_class
loc:@main/q1/dense_1/bias*
T0*
_output_shapes	
:¬*
use_locking( 
¹
.Adam_1/update_main/q1/dense_2/kernel/ApplyAdam	ApplyAdammain/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependency_1*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel*
T0*
use_locking( *
use_nesterov( 
«
,Adam_1/update_main/q1/dense_2/bias/ApplyAdam	ApplyAdammain/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependency_1*'
_class
loc:@main/q1/dense_2/bias*
T0*
use_locking( *
_output_shapes
:*
use_nesterov( 
­
,Adam_1/update_main/q2/dense/kernel/ApplyAdam	ApplyAdammain/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon@gradients_1/main/q2/dense/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes
:	B*
use_locking( *
use_nesterov( *'
_class
loc:@main/q2/dense/kernel
 
*Adam_1/update_main/q2/dense/bias/ApplyAdam	ApplyAdammain/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependency_1*
T0*
use_locking( *%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
use_nesterov( 
º
.Adam_1/update_main/q2/dense_1/kernel/ApplyAdam	ApplyAdammain/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( * 
_output_shapes
:
¬*
use_nesterov( *)
_class
loc:@main/q2/dense_1/kernel
¬
,Adam_1/update_main/q2/dense_1/bias/ApplyAdam	ApplyAdammain/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependency_1*'
_class
loc:@main/q2/dense_1/bias*
T0*
use_nesterov( *
use_locking( *
_output_shapes	
:¬
¹
.Adam_1/update_main/q2/dense_2/kernel/ApplyAdam	ApplyAdammain/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependency_1*)
_class
loc:@main/q2/dense_2/kernel*
use_locking( *
use_nesterov( *
T0*
_output_shapes
:	¬
«
,Adam_1/update_main/q2/dense_2/bias/ApplyAdam	ApplyAdammain/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
_output_shapes
:*
T0*
use_locking( *'
_class
loc:@main/q2/dense_2/bias
§
+Adam_1/update_main/v/dense/kernel/ApplyAdam	ApplyAdammain/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon?gradients_1/main/v/dense/MatMul_grad/tuple/control_dependency_1*
T0*
use_nesterov( *
use_locking( *&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6

)Adam_1/update_main/v/dense/bias/ApplyAdam	ApplyAdammain/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon@gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependency_1*$
_class
loc:@main/v/dense/bias*
use_locking( *
T0*
_output_shapes	
:*
use_nesterov( 
´
-Adam_1/update_main/v/dense_1/kernel/ApplyAdam	ApplyAdammain/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *(
_class
loc:@main/v/dense_1/kernel*
use_nesterov( * 
_output_shapes
:
¬*
T0
¦
+Adam_1/update_main/v/dense_1/bias/ApplyAdam	ApplyAdammain/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependency_1*&
_class
loc:@main/v/dense_1/bias*
use_locking( *
T0*
_output_shapes	
:¬*
use_nesterov( 
³
-Adam_1/update_main/v/dense_2/kernel/ApplyAdam	ApplyAdammain/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependency_1*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
use_locking( *
use_nesterov( *
T0
¥
+Adam_1/update_main/v/dense_2/bias/ApplyAdam	ApplyAdammain/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependency_1*&
_class
loc:@main/v/dense_2/bias*
T0*
use_locking( *
use_nesterov( *
_output_shapes
:
É

Adam_1/mulMulbeta1_power_1/readAdam_1/beta1+^Adam_1/update_main/q1/dense/bias/ApplyAdam-^Adam_1/update_main/q1/dense/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_1/bias/ApplyAdam/^Adam_1/update_main/q1/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_2/bias/ApplyAdam/^Adam_1/update_main/q1/dense_2/kernel/ApplyAdam+^Adam_1/update_main/q2/dense/bias/ApplyAdam-^Adam_1/update_main/q2/dense/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_1/bias/ApplyAdam/^Adam_1/update_main/q2/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_2/bias/ApplyAdam/^Adam_1/update_main/q2/dense_2/kernel/ApplyAdam*^Adam_1/update_main/v/dense/bias/ApplyAdam,^Adam_1/update_main/v/dense/kernel/ApplyAdam,^Adam_1/update_main/v/dense_1/bias/ApplyAdam.^Adam_1/update_main/v/dense_1/kernel/ApplyAdam,^Adam_1/update_main/v/dense_2/bias/ApplyAdam.^Adam_1/update_main/v/dense_2/kernel/ApplyAdam*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
T0
£
Adam_1/AssignAssignbeta1_power_1
Adam_1/mul*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
use_locking( *
_output_shapes
: *
T0
Ë
Adam_1/mul_1Mulbeta2_power_1/readAdam_1/beta2+^Adam_1/update_main/q1/dense/bias/ApplyAdam-^Adam_1/update_main/q1/dense/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_1/bias/ApplyAdam/^Adam_1/update_main/q1/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_2/bias/ApplyAdam/^Adam_1/update_main/q1/dense_2/kernel/ApplyAdam+^Adam_1/update_main/q2/dense/bias/ApplyAdam-^Adam_1/update_main/q2/dense/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_1/bias/ApplyAdam/^Adam_1/update_main/q2/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_2/bias/ApplyAdam/^Adam_1/update_main/q2/dense_2/kernel/ApplyAdam*^Adam_1/update_main/v/dense/bias/ApplyAdam,^Adam_1/update_main/v/dense/kernel/ApplyAdam,^Adam_1/update_main/v/dense_1/bias/ApplyAdam.^Adam_1/update_main/v/dense_1/kernel/ApplyAdam,^Adam_1/update_main/v/dense_2/bias/ApplyAdam.^Adam_1/update_main/v/dense_2/kernel/ApplyAdam*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
T0
§
Adam_1/Assign_1Assignbeta2_power_1Adam_1/mul_1*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*%
_class
loc:@main/q1/dense/bias

Adam_1NoOp^Adam^Adam_1/Assign^Adam_1/Assign_1+^Adam_1/update_main/q1/dense/bias/ApplyAdam-^Adam_1/update_main/q1/dense/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_1/bias/ApplyAdam/^Adam_1/update_main/q1/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_2/bias/ApplyAdam/^Adam_1/update_main/q1/dense_2/kernel/ApplyAdam+^Adam_1/update_main/q2/dense/bias/ApplyAdam-^Adam_1/update_main/q2/dense/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_1/bias/ApplyAdam/^Adam_1/update_main/q2/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_2/bias/ApplyAdam/^Adam_1/update_main/q2/dense_2/kernel/ApplyAdam*^Adam_1/update_main/v/dense/bias/ApplyAdam,^Adam_1/update_main/v/dense/kernel/ApplyAdam,^Adam_1/update_main/v/dense_1/bias/ApplyAdam.^Adam_1/update_main/v/dense_1/kernel/ApplyAdam,^Adam_1/update_main/v/dense_2/bias/ApplyAdam.^Adam_1/update_main/v/dense_2/kernel/ApplyAdam
U
mul_7/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
\
mul_7Mulmul_7/xtarget/pi/dense/kernel/read*
_output_shapes
:	6*
T0
U
mul_8/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
Z
mul_8Mulmul_8/xmain/pi/dense/kernel/read*
T0*
_output_shapes
:	6
F
add_3AddV2mul_7mul_8*
T0*
_output_shapes
:	6
­
AssignAssigntarget/pi/dense/kerneladd_3*)
_class
loc:@target/pi/dense/kernel*
validate_shape(*
T0*
_output_shapes
:	6*
use_locking(
U
mul_9/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
V
mul_9Mulmul_9/xtarget/pi/dense/bias/read*
_output_shapes	
:*
T0
V
mul_10/xConst^Adam_1*
_output_shapes
: *
valueB
 *
×£;*
dtype0
V
mul_10Mulmul_10/xmain/pi/dense/bias/read*
_output_shapes	
:*
T0
C
add_4AddV2mul_9mul_10*
T0*
_output_shapes	
:
§
Assign_1Assigntarget/pi/dense/biasadd_4*
validate_shape(*
_output_shapes	
:*
T0*'
_class
loc:@target/pi/dense/bias*
use_locking(
V
mul_11/xConst^Adam_1*
valueB
 *R¸~?*
dtype0*
_output_shapes
: 
a
mul_11Mulmul_11/xtarget/pi/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
V
mul_12/xConst^Adam_1*
dtype0*
valueB
 *
×£;*
_output_shapes
: 
_
mul_12Mulmul_12/xmain/pi/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
I
add_5AddV2mul_11mul_12*
T0* 
_output_shapes
:
¬
´
Assign_2Assigntarget/pi/dense_1/kerneladd_5*+
_class!
loc:@target/pi/dense_1/kernel*
T0*
validate_shape(*
use_locking(* 
_output_shapes
:
¬
V
mul_13/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
Z
mul_13Mulmul_13/xtarget/pi/dense_1/bias/read*
T0*
_output_shapes	
:¬
V
mul_14/xConst^Adam_1*
valueB
 *
×£;*
_output_shapes
: *
dtype0
X
mul_14Mulmul_14/xmain/pi/dense_1/bias/read*
_output_shapes	
:¬*
T0
D
add_6AddV2mul_13mul_14*
T0*
_output_shapes	
:¬
«
Assign_3Assigntarget/pi/dense_1/biasadd_6*
T0*
use_locking(*
_output_shapes	
:¬*)
_class
loc:@target/pi/dense_1/bias*
validate_shape(
V
mul_15/xConst^Adam_1*
_output_shapes
: *
valueB
 *R¸~?*
dtype0
`
mul_15Mulmul_15/xtarget/pi/dense_2/kernel/read*
_output_shapes
:	¬*
T0
V
mul_16/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
^
mul_16Mulmul_16/xmain/pi/dense_2/kernel/read*
T0*
_output_shapes
:	¬
H
add_7AddV2mul_15mul_16*
T0*
_output_shapes
:	¬
³
Assign_4Assigntarget/pi/dense_2/kerneladd_7*+
_class!
loc:@target/pi/dense_2/kernel*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	¬
V
mul_17/xConst^Adam_1*
valueB
 *R¸~?*
_output_shapes
: *
dtype0
Y
mul_17Mulmul_17/xtarget/pi/dense_2/bias/read*
_output_shapes
:*
T0
V
mul_18/xConst^Adam_1*
_output_shapes
: *
valueB
 *
×£;*
dtype0
W
mul_18Mulmul_18/xmain/pi/dense_2/bias/read*
T0*
_output_shapes
:
C
add_8AddV2mul_17mul_18*
_output_shapes
:*
T0
ª
Assign_5Assigntarget/pi/dense_2/biasadd_8*
use_locking(*
_output_shapes
:*)
_class
loc:@target/pi/dense_2/bias*
T0*
validate_shape(
V
mul_19/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
`
mul_19Mulmul_19/xtarget/pi/dense_3/kernel/read*
T0*
_output_shapes
:	¬
V
mul_20/xConst^Adam_1*
valueB
 *
×£;*
dtype0*
_output_shapes
: 
^
mul_20Mulmul_20/xmain/pi/dense_3/kernel/read*
_output_shapes
:	¬*
T0
H
add_9AddV2mul_19mul_20*
_output_shapes
:	¬*
T0
³
Assign_6Assigntarget/pi/dense_3/kerneladd_9*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_3/kernel
V
mul_21/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *R¸~?
Y
mul_21Mulmul_21/xtarget/pi/dense_3/bias/read*
T0*
_output_shapes
:
V
mul_22/xConst^Adam_1*
valueB
 *
×£;*
_output_shapes
: *
dtype0
W
mul_22Mulmul_22/xmain/pi/dense_3/bias/read*
_output_shapes
:*
T0
D
add_10AddV2mul_21mul_22*
T0*
_output_shapes
:
«
Assign_7Assigntarget/pi/dense_3/biasadd_10*
use_locking(*)
_class
loc:@target/pi/dense_3/bias*
T0*
validate_shape(*
_output_shapes
:
V
mul_23/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *R¸~?
^
mul_23Mulmul_23/xtarget/q1/dense/kernel/read*
_output_shapes
:	B*
T0
V
mul_24/xConst^Adam_1*
valueB
 *
×£;*
_output_shapes
: *
dtype0
\
mul_24Mulmul_24/xmain/q1/dense/kernel/read*
T0*
_output_shapes
:	B
I
add_11AddV2mul_23mul_24*
T0*
_output_shapes
:	B
°
Assign_8Assigntarget/q1/dense/kerneladd_11*)
_class
loc:@target/q1/dense/kernel*
use_locking(*
_output_shapes
:	B*
T0*
validate_shape(
V
mul_25/xConst^Adam_1*
valueB
 *R¸~?*
dtype0*
_output_shapes
: 
X
mul_25Mulmul_25/xtarget/q1/dense/bias/read*
T0*
_output_shapes	
:
V
mul_26/xConst^Adam_1*
dtype0*
valueB
 *
×£;*
_output_shapes
: 
V
mul_26Mulmul_26/xmain/q1/dense/bias/read*
_output_shapes	
:*
T0
E
add_12AddV2mul_25mul_26*
_output_shapes	
:*
T0
¨
Assign_9Assigntarget/q1/dense/biasadd_12*
use_locking(*
_output_shapes	
:*'
_class
loc:@target/q1/dense/bias*
validate_shape(*
T0
V
mul_27/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
a
mul_27Mulmul_27/xtarget/q1/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
V
mul_28/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
_
mul_28Mulmul_28/xmain/q1/dense_1/kernel/read*
T0* 
_output_shapes
:
¬
J
add_13AddV2mul_27mul_28*
T0* 
_output_shapes
:
¬
¶
	Assign_10Assigntarget/q1/dense_1/kerneladd_13*
validate_shape(* 
_output_shapes
:
¬*+
_class!
loc:@target/q1/dense_1/kernel*
use_locking(*
T0
V
mul_29/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
Z
mul_29Mulmul_29/xtarget/q1/dense_1/bias/read*
T0*
_output_shapes	
:¬
V
mul_30/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
×£;
X
mul_30Mulmul_30/xmain/q1/dense_1/bias/read*
T0*
_output_shapes	
:¬
E
add_14AddV2mul_29mul_30*
T0*
_output_shapes	
:¬
­
	Assign_11Assigntarget/q1/dense_1/biasadd_14*
T0*
validate_shape(*
_output_shapes	
:¬*
use_locking(*)
_class
loc:@target/q1/dense_1/bias
V
mul_31/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
`
mul_31Mulmul_31/xtarget/q1/dense_2/kernel/read*
T0*
_output_shapes
:	¬
V
mul_32/xConst^Adam_1*
valueB
 *
×£;*
_output_shapes
: *
dtype0
^
mul_32Mulmul_32/xmain/q1/dense_2/kernel/read*
T0*
_output_shapes
:	¬
I
add_15AddV2mul_31mul_32*
_output_shapes
:	¬*
T0
µ
	Assign_12Assigntarget/q1/dense_2/kerneladd_15*
T0*+
_class!
loc:@target/q1/dense_2/kernel*
validate_shape(*
use_locking(*
_output_shapes
:	¬
V
mul_33/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
Y
mul_33Mulmul_33/xtarget/q1/dense_2/bias/read*
_output_shapes
:*
T0
V
mul_34/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
×£;
W
mul_34Mulmul_34/xmain/q1/dense_2/bias/read*
_output_shapes
:*
T0
D
add_16AddV2mul_33mul_34*
T0*
_output_shapes
:
¬
	Assign_13Assigntarget/q1/dense_2/biasadd_16*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*)
_class
loc:@target/q1/dense_2/bias
V
mul_35/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
^
mul_35Mulmul_35/xtarget/q2/dense/kernel/read*
T0*
_output_shapes
:	B
V
mul_36/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
\
mul_36Mulmul_36/xmain/q2/dense/kernel/read*
T0*
_output_shapes
:	B
I
add_17AddV2mul_35mul_36*
_output_shapes
:	B*
T0
±
	Assign_14Assigntarget/q2/dense/kerneladd_17*
_output_shapes
:	B*
use_locking(*
T0*
validate_shape(*)
_class
loc:@target/q2/dense/kernel
V
mul_37/xConst^Adam_1*
valueB
 *R¸~?*
_output_shapes
: *
dtype0
X
mul_37Mulmul_37/xtarget/q2/dense/bias/read*
T0*
_output_shapes	
:
V
mul_38/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
×£;
V
mul_38Mulmul_38/xmain/q2/dense/bias/read*
T0*
_output_shapes	
:
E
add_18AddV2mul_37mul_38*
T0*
_output_shapes	
:
©
	Assign_15Assigntarget/q2/dense/biasadd_18*'
_class
loc:@target/q2/dense/bias*
T0*
use_locking(*
_output_shapes	
:*
validate_shape(
V
mul_39/xConst^Adam_1*
valueB
 *R¸~?*
_output_shapes
: *
dtype0
a
mul_39Mulmul_39/xtarget/q2/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
V
mul_40/xConst^Adam_1*
valueB
 *
×£;*
_output_shapes
: *
dtype0
_
mul_40Mulmul_40/xmain/q2/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
J
add_19AddV2mul_39mul_40* 
_output_shapes
:
¬*
T0
¶
	Assign_16Assigntarget/q2/dense_1/kerneladd_19*
validate_shape(*+
_class!
loc:@target/q2/dense_1/kernel*
use_locking(*
T0* 
_output_shapes
:
¬
V
mul_41/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
Z
mul_41Mulmul_41/xtarget/q2/dense_1/bias/read*
T0*
_output_shapes	
:¬
V
mul_42/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
X
mul_42Mulmul_42/xmain/q2/dense_1/bias/read*
T0*
_output_shapes	
:¬
E
add_20AddV2mul_41mul_42*
_output_shapes	
:¬*
T0
­
	Assign_17Assigntarget/q2/dense_1/biasadd_20*
use_locking(*
validate_shape(*)
_class
loc:@target/q2/dense_1/bias*
_output_shapes	
:¬*
T0
V
mul_43/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
`
mul_43Mulmul_43/xtarget/q2/dense_2/kernel/read*
T0*
_output_shapes
:	¬
V
mul_44/xConst^Adam_1*
_output_shapes
: *
valueB
 *
×£;*
dtype0
^
mul_44Mulmul_44/xmain/q2/dense_2/kernel/read*
_output_shapes
:	¬*
T0
I
add_21AddV2mul_43mul_44*
_output_shapes
:	¬*
T0
µ
	Assign_18Assigntarget/q2/dense_2/kerneladd_21*
validate_shape(*
use_locking(*+
_class!
loc:@target/q2/dense_2/kernel*
T0*
_output_shapes
:	¬
V
mul_45/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *R¸~?
Y
mul_45Mulmul_45/xtarget/q2/dense_2/bias/read*
T0*
_output_shapes
:
V
mul_46/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
W
mul_46Mulmul_46/xmain/q2/dense_2/bias/read*
T0*
_output_shapes
:
D
add_22AddV2mul_45mul_46*
T0*
_output_shapes
:
¬
	Assign_19Assigntarget/q2/dense_2/biasadd_22*
validate_shape(*
use_locking(*
_output_shapes
:*)
_class
loc:@target/q2/dense_2/bias*
T0
V
mul_47/xConst^Adam_1*
dtype0*
valueB
 *R¸~?*
_output_shapes
: 
]
mul_47Mulmul_47/xtarget/v/dense/kernel/read*
T0*
_output_shapes
:	6
V
mul_48/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
×£;
[
mul_48Mulmul_48/xmain/v/dense/kernel/read*
T0*
_output_shapes
:	6
I
add_23AddV2mul_47mul_48*
_output_shapes
:	6*
T0
¯
	Assign_20Assigntarget/v/dense/kerneladd_23*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	6*(
_class
loc:@target/v/dense/kernel
V
mul_49/xConst^Adam_1*
valueB
 *R¸~?*
dtype0*
_output_shapes
: 
W
mul_49Mulmul_49/xtarget/v/dense/bias/read*
_output_shapes	
:*
T0
V
mul_50/xConst^Adam_1*
valueB
 *
×£;*
dtype0*
_output_shapes
: 
U
mul_50Mulmul_50/xmain/v/dense/bias/read*
_output_shapes	
:*
T0
E
add_24AddV2mul_49mul_50*
T0*
_output_shapes	
:
§
	Assign_21Assigntarget/v/dense/biasadd_24*
T0*
validate_shape(*&
_class
loc:@target/v/dense/bias*
use_locking(*
_output_shapes	
:
V
mul_51/xConst^Adam_1*
valueB
 *R¸~?*
dtype0*
_output_shapes
: 
`
mul_51Mulmul_51/xtarget/v/dense_1/kernel/read*
T0* 
_output_shapes
:
¬
V
mul_52/xConst^Adam_1*
dtype0*
valueB
 *
×£;*
_output_shapes
: 
^
mul_52Mulmul_52/xmain/v/dense_1/kernel/read*
T0* 
_output_shapes
:
¬
J
add_25AddV2mul_51mul_52* 
_output_shapes
:
¬*
T0
´
	Assign_22Assigntarget/v/dense_1/kerneladd_25*
T0**
_class 
loc:@target/v/dense_1/kernel*
use_locking(* 
_output_shapes
:
¬*
validate_shape(
V
mul_53/xConst^Adam_1*
_output_shapes
: *
valueB
 *R¸~?*
dtype0
Y
mul_53Mulmul_53/xtarget/v/dense_1/bias/read*
_output_shapes	
:¬*
T0
V
mul_54/xConst^Adam_1*
valueB
 *
×£;*
dtype0*
_output_shapes
: 
W
mul_54Mulmul_54/xmain/v/dense_1/bias/read*
T0*
_output_shapes	
:¬
E
add_26AddV2mul_53mul_54*
_output_shapes	
:¬*
T0
«
	Assign_23Assigntarget/v/dense_1/biasadd_26*
validate_shape(*(
_class
loc:@target/v/dense_1/bias*
use_locking(*
_output_shapes	
:¬*
T0
V
mul_55/xConst^Adam_1*
valueB
 *R¸~?*
_output_shapes
: *
dtype0
_
mul_55Mulmul_55/xtarget/v/dense_2/kernel/read*
_output_shapes
:	¬*
T0
V
mul_56/xConst^Adam_1*
_output_shapes
: *
valueB
 *
×£;*
dtype0
]
mul_56Mulmul_56/xmain/v/dense_2/kernel/read*
T0*
_output_shapes
:	¬
I
add_27AddV2mul_55mul_56*
_output_shapes
:	¬*
T0
³
	Assign_24Assigntarget/v/dense_2/kerneladd_27*
T0*
_output_shapes
:	¬*
validate_shape(**
_class 
loc:@target/v/dense_2/kernel*
use_locking(
V
mul_57/xConst^Adam_1*
valueB
 *R¸~?*
_output_shapes
: *
dtype0
X
mul_57Mulmul_57/xtarget/v/dense_2/bias/read*
T0*
_output_shapes
:
V
mul_58/xConst^Adam_1*
dtype0*
valueB
 *
×£;*
_output_shapes
: 
V
mul_58Mulmul_58/xmain/v/dense_2/bias/read*
_output_shapes
:*
T0
D
add_28AddV2mul_57mul_58*
T0*
_output_shapes
:
ª
	Assign_25Assigntarget/v/dense_2/biasadd_28*(
_class
loc:@target/v/dense_2/bias*
use_locking(*
_output_shapes
:*
validate_shape(*
T0
Ç

group_depsNoOp^Adam_1^Assign	^Assign_1
^Assign_10
^Assign_11
^Assign_12
^Assign_13
^Assign_14
^Assign_15
^Assign_16
^Assign_17
^Assign_18
^Assign_19	^Assign_2
^Assign_20
^Assign_21
^Assign_22
^Assign_23
^Assign_24
^Assign_25	^Assign_3	^Assign_4	^Assign_5	^Assign_6	^Assign_7	^Assign_8	^Assign_9
Ä
	Assign_26Assigntarget/pi/dense/kernelmain/pi/dense/kernel/read*
_output_shapes
:	6*
T0*
validate_shape(*)
_class
loc:@target/pi/dense/kernel*
use_locking(
º
	Assign_27Assigntarget/pi/dense/biasmain/pi/dense/bias/read*'
_class
loc:@target/pi/dense/bias*
T0*
_output_shapes	
:*
validate_shape(*
use_locking(
Ë
	Assign_28Assigntarget/pi/dense_1/kernelmain/pi/dense_1/kernel/read*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*+
_class!
loc:@target/pi/dense_1/kernel*
T0
À
	Assign_29Assigntarget/pi/dense_1/biasmain/pi/dense_1/bias/read*)
_class
loc:@target/pi/dense_1/bias*
T0*
_output_shapes	
:¬*
use_locking(*
validate_shape(
Ê
	Assign_30Assigntarget/pi/dense_2/kernelmain/pi/dense_2/kernel/read*
T0*
_output_shapes
:	¬*
validate_shape(*+
_class!
loc:@target/pi/dense_2/kernel*
use_locking(
¿
	Assign_31Assigntarget/pi/dense_2/biasmain/pi/dense_2/bias/read*
T0*
validate_shape(*
_output_shapes
:*)
_class
loc:@target/pi/dense_2/bias*
use_locking(
Ê
	Assign_32Assigntarget/pi/dense_3/kernelmain/pi/dense_3/kernel/read*
use_locking(*+
_class!
loc:@target/pi/dense_3/kernel*
validate_shape(*
_output_shapes
:	¬*
T0
¿
	Assign_33Assigntarget/pi/dense_3/biasmain/pi/dense_3/bias/read*
_output_shapes
:*
T0*
validate_shape(*)
_class
loc:@target/pi/dense_3/bias*
use_locking(
Ä
	Assign_34Assigntarget/q1/dense/kernelmain/q1/dense/kernel/read*
use_locking(*
_output_shapes
:	B*)
_class
loc:@target/q1/dense/kernel*
T0*
validate_shape(
º
	Assign_35Assigntarget/q1/dense/biasmain/q1/dense/bias/read*
T0*'
_class
loc:@target/q1/dense/bias*
_output_shapes	
:*
validate_shape(*
use_locking(
Ë
	Assign_36Assigntarget/q1/dense_1/kernelmain/q1/dense_1/kernel/read*
T0*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*+
_class!
loc:@target/q1/dense_1/kernel
À
	Assign_37Assigntarget/q1/dense_1/biasmain/q1/dense_1/bias/read*
validate_shape(*
_output_shapes	
:¬*
T0*)
_class
loc:@target/q1/dense_1/bias*
use_locking(
Ê
	Assign_38Assigntarget/q1/dense_2/kernelmain/q1/dense_2/kernel/read*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
:	¬*
T0*
validate_shape(*
use_locking(
¿
	Assign_39Assigntarget/q1/dense_2/biasmain/q1/dense_2/bias/read*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*)
_class
loc:@target/q1/dense_2/bias
Ä
	Assign_40Assigntarget/q2/dense/kernelmain/q2/dense/kernel/read*
_output_shapes
:	B*
validate_shape(*
use_locking(*)
_class
loc:@target/q2/dense/kernel*
T0
º
	Assign_41Assigntarget/q2/dense/biasmain/q2/dense/bias/read*
validate_shape(*
_output_shapes	
:*
T0*'
_class
loc:@target/q2/dense/bias*
use_locking(
Ë
	Assign_42Assigntarget/q2/dense_1/kernelmain/q2/dense_1/kernel/read*+
_class!
loc:@target/q2/dense_1/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
¬*
T0
À
	Assign_43Assigntarget/q2/dense_1/biasmain/q2/dense_1/bias/read*
T0*
_output_shapes	
:¬*
use_locking(*)
_class
loc:@target/q2/dense_1/bias*
validate_shape(
Ê
	Assign_44Assigntarget/q2/dense_2/kernelmain/q2/dense_2/kernel/read*
use_locking(*
_output_shapes
:	¬*
validate_shape(*
T0*+
_class!
loc:@target/q2/dense_2/kernel
¿
	Assign_45Assigntarget/q2/dense_2/biasmain/q2/dense_2/bias/read*
T0*
validate_shape(*)
_class
loc:@target/q2/dense_2/bias*
use_locking(*
_output_shapes
:
Á
	Assign_46Assigntarget/v/dense/kernelmain/v/dense/kernel/read*
validate_shape(*(
_class
loc:@target/v/dense/kernel*
use_locking(*
T0*
_output_shapes
:	6
·
	Assign_47Assigntarget/v/dense/biasmain/v/dense/bias/read*
use_locking(*
validate_shape(*
_output_shapes	
:*
T0*&
_class
loc:@target/v/dense/bias
È
	Assign_48Assigntarget/v/dense_1/kernelmain/v/dense_1/kernel/read* 
_output_shapes
:
¬*
T0**
_class 
loc:@target/v/dense_1/kernel*
use_locking(*
validate_shape(
½
	Assign_49Assigntarget/v/dense_1/biasmain/v/dense_1/bias/read*
use_locking(*
_output_shapes	
:¬*
validate_shape(*
T0*(
_class
loc:@target/v/dense_1/bias
Ç
	Assign_50Assigntarget/v/dense_2/kernelmain/v/dense_2/kernel/read*
T0**
_class 
loc:@target/v/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
validate_shape(
¼
	Assign_51Assigntarget/v/dense_2/biasmain/v/dense_2/bias/read*
_output_shapes
:*
validate_shape(*
T0*(
_class
loc:@target/v/dense_2/bias*
use_locking(
Ì
group_deps_1NoOp
^Assign_26
^Assign_27
^Assign_28
^Assign_29
^Assign_30
^Assign_31
^Assign_32
^Assign_33
^Assign_34
^Assign_35
^Assign_36
^Assign_37
^Assign_38
^Assign_39
^Assign_40
^Assign_41
^Assign_42
^Assign_43
^Assign_44
^Assign_45
^Assign_46
^Assign_47
^Assign_48
^Assign_49
^Assign_50
^Assign_51
ô
init_1NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^beta1_power/Assign^beta1_power_1/Assign^beta2_power/Assign^beta2_power_1/Assign^main/pi/dense/bias/Adam/Assign!^main/pi/dense/bias/Adam_1/Assign^main/pi/dense/bias/Assign!^main/pi/dense/kernel/Adam/Assign#^main/pi/dense/kernel/Adam_1/Assign^main/pi/dense/kernel/Assign!^main/pi/dense_1/bias/Adam/Assign#^main/pi/dense_1/bias/Adam_1/Assign^main/pi/dense_1/bias/Assign#^main/pi/dense_1/kernel/Adam/Assign%^main/pi/dense_1/kernel/Adam_1/Assign^main/pi/dense_1/kernel/Assign!^main/pi/dense_2/bias/Adam/Assign#^main/pi/dense_2/bias/Adam_1/Assign^main/pi/dense_2/bias/Assign#^main/pi/dense_2/kernel/Adam/Assign%^main/pi/dense_2/kernel/Adam_1/Assign^main/pi/dense_2/kernel/Assign!^main/pi/dense_3/bias/Adam/Assign#^main/pi/dense_3/bias/Adam_1/Assign^main/pi/dense_3/bias/Assign#^main/pi/dense_3/kernel/Adam/Assign%^main/pi/dense_3/kernel/Adam_1/Assign^main/pi/dense_3/kernel/Assign^main/q1/dense/bias/Adam/Assign!^main/q1/dense/bias/Adam_1/Assign^main/q1/dense/bias/Assign!^main/q1/dense/kernel/Adam/Assign#^main/q1/dense/kernel/Adam_1/Assign^main/q1/dense/kernel/Assign!^main/q1/dense_1/bias/Adam/Assign#^main/q1/dense_1/bias/Adam_1/Assign^main/q1/dense_1/bias/Assign#^main/q1/dense_1/kernel/Adam/Assign%^main/q1/dense_1/kernel/Adam_1/Assign^main/q1/dense_1/kernel/Assign!^main/q1/dense_2/bias/Adam/Assign#^main/q1/dense_2/bias/Adam_1/Assign^main/q1/dense_2/bias/Assign#^main/q1/dense_2/kernel/Adam/Assign%^main/q1/dense_2/kernel/Adam_1/Assign^main/q1/dense_2/kernel/Assign^main/q2/dense/bias/Adam/Assign!^main/q2/dense/bias/Adam_1/Assign^main/q2/dense/bias/Assign!^main/q2/dense/kernel/Adam/Assign#^main/q2/dense/kernel/Adam_1/Assign^main/q2/dense/kernel/Assign!^main/q2/dense_1/bias/Adam/Assign#^main/q2/dense_1/bias/Adam_1/Assign^main/q2/dense_1/bias/Assign#^main/q2/dense_1/kernel/Adam/Assign%^main/q2/dense_1/kernel/Adam_1/Assign^main/q2/dense_1/kernel/Assign!^main/q2/dense_2/bias/Adam/Assign#^main/q2/dense_2/bias/Adam_1/Assign^main/q2/dense_2/bias/Assign#^main/q2/dense_2/kernel/Adam/Assign%^main/q2/dense_2/kernel/Adam_1/Assign^main/q2/dense_2/kernel/Assign^main/v/dense/bias/Adam/Assign ^main/v/dense/bias/Adam_1/Assign^main/v/dense/bias/Assign ^main/v/dense/kernel/Adam/Assign"^main/v/dense/kernel/Adam_1/Assign^main/v/dense/kernel/Assign ^main/v/dense_1/bias/Adam/Assign"^main/v/dense_1/bias/Adam_1/Assign^main/v/dense_1/bias/Assign"^main/v/dense_1/kernel/Adam/Assign$^main/v/dense_1/kernel/Adam_1/Assign^main/v/dense_1/kernel/Assign ^main/v/dense_2/bias/Adam/Assign"^main/v/dense_2/bias/Adam_1/Assign^main/v/dense_2/bias/Assign"^main/v/dense_2/kernel/Adam/Assign$^main/v/dense_2/kernel/Adam_1/Assign^main/v/dense_2/kernel/Assign^target/pi/dense/bias/Assign^target/pi/dense/kernel/Assign^target/pi/dense_1/bias/Assign ^target/pi/dense_1/kernel/Assign^target/pi/dense_2/bias/Assign ^target/pi/dense_2/kernel/Assign^target/pi/dense_3/bias/Assign ^target/pi/dense_3/kernel/Assign^target/q1/dense/bias/Assign^target/q1/dense/kernel/Assign^target/q1/dense_1/bias/Assign ^target/q1/dense_1/kernel/Assign^target/q1/dense_2/bias/Assign ^target/q1/dense_2/kernel/Assign^target/q2/dense/bias/Assign^target/q2/dense/kernel/Assign^target/q2/dense_1/bias/Assign ^target/q2/dense_1/kernel/Assign^target/q2/dense_2/bias/Assign ^target/q2/dense_2/kernel/Assign^target/v/dense/bias/Assign^target/v/dense/kernel/Assign^target/v/dense_1/bias/Assign^target/v/dense_1/kernel/Assign^target/v/dense_2/bias/Assign^target/v/dense_2/kernel/Assign
[
save_1/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
_output_shapes
: *
shape: *
dtype0
i
save_1/ConstPlaceholderWithDefaultsave_1/filename*
_output_shapes
: *
dtype0*
shape: 

save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_9337eb6a481d417183136240479a8902/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
S
save_1/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
^
save_1/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 

save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards*
_output_shapes
: 
Â
save_1/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:q*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel
Ê
save_1/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:q*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 
Ê
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2
Variable_3
Variable_4beta1_powerbeta1_power_1beta2_powerbeta2_power_1main/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1main/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1main/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1main/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1main/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1main/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1main/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1main/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1main/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1main/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1main/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1main/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1main/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1main/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1main/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1main/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1main/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1main/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1main/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1main/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1main/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1main/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1main/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1main/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1main/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1main/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1target/pi/dense/biastarget/pi/dense/kerneltarget/pi/dense_1/biastarget/pi/dense_1/kerneltarget/pi/dense_2/biastarget/pi/dense_2/kerneltarget/pi/dense_3/biastarget/pi/dense_3/kerneltarget/q1/dense/biastarget/q1/dense/kerneltarget/q1/dense_1/biastarget/q1/dense_1/kerneltarget/q1/dense_2/biastarget/q1/dense_2/kerneltarget/q2/dense/biastarget/q2/dense/kerneltarget/q2/dense_1/biastarget/q2/dense_1/kerneltarget/q2/dense_2/biastarget/q2/dense_2/kerneltarget/v/dense/biastarget/v/dense/kerneltarget/v/dense_1/biastarget/v/dense_1/kerneltarget/v/dense_2/biastarget/v/dense_2/kernel*
dtypesu
s2q

save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2*
T0*
_output_shapes
: *)
_class
loc:@save_1/ShardedFilename
£
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*
_output_shapes
:*
T0*
N*

axis 

save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency*
_output_shapes
: *
T0
Å
save_1/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:q*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel
Í
!save_1/RestoreV2/shape_and_slicesConst*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:q
Ë
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*Ú
_output_shapesÇ
Ä:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*
dtypesu
s2q
¢
save_1/AssignAssignVariablesave_1/RestoreV2*
use_locking(*
_class
loc:@Variable*
_output_shapes

:@*
validate_shape(*
T0
ª
save_1/Assign_1Assign
Variable_1save_1/RestoreV2:1*
_output_shapes

:@@*
T0*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
ª
save_1/Assign_2Assign
Variable_2save_1/RestoreV2:2*
_output_shapes

:@@*
use_locking(*
validate_shape(*
_class
loc:@Variable_2*
T0
ª
save_1/Assign_3Assign
Variable_3save_1/RestoreV2:3*
_class
loc:@Variable_3*
validate_shape(*
use_locking(*
T0*
_output_shapes

:@@
ª
save_1/Assign_4Assign
Variable_4save_1/RestoreV2:4*
_class
loc:@Variable_4*
use_locking(*
_output_shapes

:@*
validate_shape(*
T0
«
save_1/Assign_5Assignbeta1_powersave_1/RestoreV2:5*%
_class
loc:@main/pi/dense/bias*
_output_shapes
: *
validate_shape(*
T0*
use_locking(
­
save_1/Assign_6Assignbeta1_power_1save_1/RestoreV2:6*
use_locking(*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
T0*
validate_shape(
«
save_1/Assign_7Assignbeta2_powersave_1/RestoreV2:7*
use_locking(*
validate_shape(*
T0*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias
­
save_1/Assign_8Assignbeta2_power_1save_1/RestoreV2:8*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
use_locking(*
_output_shapes
: *
T0
·
save_1/Assign_9Assignmain/pi/dense/biassave_1/RestoreV2:9*
T0*%
_class
loc:@main/pi/dense/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
¾
save_1/Assign_10Assignmain/pi/dense/bias/Adamsave_1/RestoreV2:10*
T0*
validate_shape(*
_output_shapes	
:*
use_locking(*%
_class
loc:@main/pi/dense/bias
À
save_1/Assign_11Assignmain/pi/dense/bias/Adam_1save_1/RestoreV2:11*
T0*
validate_shape(*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
use_locking(
Á
save_1/Assign_12Assignmain/pi/dense/kernelsave_1/RestoreV2:12*
validate_shape(*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*
use_locking(*
T0
Æ
save_1/Assign_13Assignmain/pi/dense/kernel/Adamsave_1/RestoreV2:13*
use_locking(*
validate_shape(*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*
T0
È
save_1/Assign_14Assignmain/pi/dense/kernel/Adam_1save_1/RestoreV2:14*
validate_shape(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*
use_locking(*
T0
½
save_1/Assign_15Assignmain/pi/dense_1/biassave_1/RestoreV2:15*
use_locking(*'
_class
loc:@main/pi/dense_1/bias*
validate_shape(*
T0*
_output_shapes	
:¬
Â
save_1/Assign_16Assignmain/pi/dense_1/bias/Adamsave_1/RestoreV2:16*
validate_shape(*'
_class
loc:@main/pi/dense_1/bias*
T0*
_output_shapes	
:¬*
use_locking(
Ä
save_1/Assign_17Assignmain/pi/dense_1/bias/Adam_1save_1/RestoreV2:17*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias
Æ
save_1/Assign_18Assignmain/pi/dense_1/kernelsave_1/RestoreV2:18*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_1/kernel*
use_locking(* 
_output_shapes
:
¬
Ë
save_1/Assign_19Assignmain/pi/dense_1/kernel/Adamsave_1/RestoreV2:19* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*
validate_shape(*
T0*
use_locking(
Í
save_1/Assign_20Assignmain/pi/dense_1/kernel/Adam_1save_1/RestoreV2:20* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/pi/dense_1/kernel*
T0*
use_locking(
¼
save_1/Assign_21Assignmain/pi/dense_2/biassave_1/RestoreV2:21*
use_locking(*'
_class
loc:@main/pi/dense_2/bias*
T0*
validate_shape(*
_output_shapes
:
Á
save_1/Assign_22Assignmain/pi/dense_2/bias/Adamsave_1/RestoreV2:22*
use_locking(*
_output_shapes
:*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
T0
Ã
save_1/Assign_23Assignmain/pi/dense_2/bias/Adam_1save_1/RestoreV2:23*
T0*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
use_locking(*
_output_shapes
:
Å
save_1/Assign_24Assignmain/pi/dense_2/kernelsave_1/RestoreV2:24*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel*
use_locking(*
validate_shape(
Ê
save_1/Assign_25Assignmain/pi/dense_2/kernel/Adamsave_1/RestoreV2:25*
T0*
_output_shapes
:	¬*
validate_shape(*
use_locking(*)
_class
loc:@main/pi/dense_2/kernel
Ì
save_1/Assign_26Assignmain/pi/dense_2/kernel/Adam_1save_1/RestoreV2:26*
validate_shape(*
use_locking(*)
_class
loc:@main/pi/dense_2/kernel*
T0*
_output_shapes
:	¬
¼
save_1/Assign_27Assignmain/pi/dense_3/biassave_1/RestoreV2:27*
validate_shape(*
T0*
use_locking(*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:
Á
save_1/Assign_28Assignmain/pi/dense_3/bias/Adamsave_1/RestoreV2:28*
validate_shape(*
T0*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:*
use_locking(
Ã
save_1/Assign_29Assignmain/pi/dense_3/bias/Adam_1save_1/RestoreV2:29*'
_class
loc:@main/pi/dense_3/bias*
T0*
_output_shapes
:*
validate_shape(*
use_locking(
Å
save_1/Assign_30Assignmain/pi/dense_3/kernelsave_1/RestoreV2:30*
validate_shape(*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
T0*
use_locking(
Ê
save_1/Assign_31Assignmain/pi/dense_3/kernel/Adamsave_1/RestoreV2:31*
validate_shape(*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
use_locking(*
T0
Ì
save_1/Assign_32Assignmain/pi/dense_3/kernel/Adam_1save_1/RestoreV2:32*
validate_shape(*
use_locking(*
T0*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬
¹
save_1/Assign_33Assignmain/q1/dense/biassave_1/RestoreV2:33*
use_locking(*
_output_shapes	
:*
T0*%
_class
loc:@main/q1/dense/bias*
validate_shape(
¾
save_1/Assign_34Assignmain/q1/dense/bias/Adamsave_1/RestoreV2:34*
T0*%
_class
loc:@main/q1/dense/bias*
validate_shape(*
_output_shapes	
:*
use_locking(
À
save_1/Assign_35Assignmain/q1/dense/bias/Adam_1save_1/RestoreV2:35*
_output_shapes	
:*
T0*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
use_locking(
Á
save_1/Assign_36Assignmain/q1/dense/kernelsave_1/RestoreV2:36*
validate_shape(*
use_locking(*
T0*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel
Æ
save_1/Assign_37Assignmain/q1/dense/kernel/Adamsave_1/RestoreV2:37*
validate_shape(*
T0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
use_locking(
È
save_1/Assign_38Assignmain/q1/dense/kernel/Adam_1save_1/RestoreV2:38*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*
T0*
use_locking(*
validate_shape(
½
save_1/Assign_39Assignmain/q1/dense_1/biassave_1/RestoreV2:39*
use_locking(*
_output_shapes	
:¬*
validate_shape(*
T0*'
_class
loc:@main/q1/dense_1/bias
Â
save_1/Assign_40Assignmain/q1/dense_1/bias/Adamsave_1/RestoreV2:40*
_output_shapes	
:¬*
use_locking(*
validate_shape(*
T0*'
_class
loc:@main/q1/dense_1/bias
Ä
save_1/Assign_41Assignmain/q1/dense_1/bias/Adam_1save_1/RestoreV2:41*
use_locking(*
validate_shape(*'
_class
loc:@main/q1/dense_1/bias*
T0*
_output_shapes	
:¬
Æ
save_1/Assign_42Assignmain/q1/dense_1/kernelsave_1/RestoreV2:42*
T0*
validate_shape(*
use_locking(*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬
Ë
save_1/Assign_43Assignmain/q1/dense_1/kernel/Adamsave_1/RestoreV2:43*
use_locking(*
validate_shape(*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel
Í
save_1/Assign_44Assignmain/q1/dense_1/kernel/Adam_1save_1/RestoreV2:44*
T0*
validate_shape(*
use_locking(*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬
¼
save_1/Assign_45Assignmain/q1/dense_2/biassave_1/RestoreV2:45*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias
Á
save_1/Assign_46Assignmain/q1/dense_2/bias/Adamsave_1/RestoreV2:46*
use_locking(*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:*
T0*
validate_shape(
Ã
save_1/Assign_47Assignmain/q1/dense_2/bias/Adam_1save_1/RestoreV2:47*
_output_shapes
:*
T0*
validate_shape(*'
_class
loc:@main/q1/dense_2/bias*
use_locking(
Å
save_1/Assign_48Assignmain/q1/dense_2/kernelsave_1/RestoreV2:48*)
_class
loc:@main/q1/dense_2/kernel*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	¬
Ê
save_1/Assign_49Assignmain/q1/dense_2/kernel/Adamsave_1/RestoreV2:49*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:	¬*
use_locking(*
validate_shape(*
T0
Ì
save_1/Assign_50Assignmain/q1/dense_2/kernel/Adam_1save_1/RestoreV2:50*
use_locking(*
_output_shapes
:	¬*
T0*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel
¹
save_1/Assign_51Assignmain/q2/dense/biassave_1/RestoreV2:51*
T0*
_output_shapes	
:*
validate_shape(*
use_locking(*%
_class
loc:@main/q2/dense/bias
¾
save_1/Assign_52Assignmain/q2/dense/bias/Adamsave_1/RestoreV2:52*
validate_shape(*
T0*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias*
use_locking(
À
save_1/Assign_53Assignmain/q2/dense/bias/Adam_1save_1/RestoreV2:53*%
_class
loc:@main/q2/dense/bias*
T0*
_output_shapes	
:*
use_locking(*
validate_shape(
Á
save_1/Assign_54Assignmain/q2/dense/kernelsave_1/RestoreV2:54*
use_locking(*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
validate_shape(*
T0
Æ
save_1/Assign_55Assignmain/q2/dense/kernel/Adamsave_1/RestoreV2:55*'
_class
loc:@main/q2/dense/kernel*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	B
È
save_1/Assign_56Assignmain/q2/dense/kernel/Adam_1save_1/RestoreV2:56*
use_locking(*
validate_shape(*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B*
T0
½
save_1/Assign_57Assignmain/q2/dense_1/biassave_1/RestoreV2:57*
T0*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
validate_shape(*
use_locking(
Â
save_1/Assign_58Assignmain/q2/dense_1/bias/Adamsave_1/RestoreV2:58*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
Ä
save_1/Assign_59Assignmain/q2/dense_1/bias/Adam_1save_1/RestoreV2:59*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias
Æ
save_1/Assign_60Assignmain/q2/dense_1/kernelsave_1/RestoreV2:60*
T0*
use_locking(*
validate_shape(* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel
Ë
save_1/Assign_61Assignmain/q2/dense_1/kernel/Adamsave_1/RestoreV2:61* 
_output_shapes
:
¬*
T0*)
_class
loc:@main/q2/dense_1/kernel*
use_locking(*
validate_shape(
Í
save_1/Assign_62Assignmain/q2/dense_1/kernel/Adam_1save_1/RestoreV2:62*
use_locking(*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
validate_shape(
¼
save_1/Assign_63Assignmain/q2/dense_2/biassave_1/RestoreV2:63*
use_locking(*
validate_shape(*
_output_shapes
:*
T0*'
_class
loc:@main/q2/dense_2/bias
Á
save_1/Assign_64Assignmain/q2/dense_2/bias/Adamsave_1/RestoreV2:64*
_output_shapes
:*
use_locking(*
validate_shape(*'
_class
loc:@main/q2/dense_2/bias*
T0
Ã
save_1/Assign_65Assignmain/q2/dense_2/bias/Adam_1save_1/RestoreV2:65*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
T0*
validate_shape(*
use_locking(
Å
save_1/Assign_66Assignmain/q2/dense_2/kernelsave_1/RestoreV2:66*
_output_shapes
:	¬*
use_locking(*
T0*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(
Ê
save_1/Assign_67Assignmain/q2/dense_2/kernel/Adamsave_1/RestoreV2:67*
use_locking(*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬*
T0
Ì
save_1/Assign_68Assignmain/q2/dense_2/kernel/Adam_1save_1/RestoreV2:68*
_output_shapes
:	¬*
validate_shape(*
T0*)
_class
loc:@main/q2/dense_2/kernel*
use_locking(
·
save_1/Assign_69Assignmain/v/dense/biassave_1/RestoreV2:69*
use_locking(*
T0*
validate_shape(*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:
¼
save_1/Assign_70Assignmain/v/dense/bias/Adamsave_1/RestoreV2:70*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(*$
_class
loc:@main/v/dense/bias
¾
save_1/Assign_71Assignmain/v/dense/bias/Adam_1save_1/RestoreV2:71*
_output_shapes	
:*
T0*$
_class
loc:@main/v/dense/bias*
validate_shape(*
use_locking(
¿
save_1/Assign_72Assignmain/v/dense/kernelsave_1/RestoreV2:72*&
_class
loc:@main/v/dense/kernel*
validate_shape(*
_output_shapes
:	6*
use_locking(*
T0
Ä
save_1/Assign_73Assignmain/v/dense/kernel/Adamsave_1/RestoreV2:73*
T0*
use_locking(*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6*
validate_shape(
Æ
save_1/Assign_74Assignmain/v/dense/kernel/Adam_1save_1/RestoreV2:74*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
use_locking(*
T0
»
save_1/Assign_75Assignmain/v/dense_1/biassave_1/RestoreV2:75*
validate_shape(*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
T0
À
save_1/Assign_76Assignmain/v/dense_1/bias/Adamsave_1/RestoreV2:76*
validate_shape(*
T0*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
use_locking(
Â
save_1/Assign_77Assignmain/v/dense_1/bias/Adam_1save_1/RestoreV2:77*
validate_shape(*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
T0
Ä
save_1/Assign_78Assignmain/v/dense_1/kernelsave_1/RestoreV2:78* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*
T0*(
_class
loc:@main/v/dense_1/kernel
É
save_1/Assign_79Assignmain/v/dense_1/kernel/Adamsave_1/RestoreV2:79*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0*
validate_shape(*
use_locking(
Ë
save_1/Assign_80Assignmain/v/dense_1/kernel/Adam_1save_1/RestoreV2:80*
T0* 
_output_shapes
:
¬*
use_locking(*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(
º
save_1/Assign_81Assignmain/v/dense_2/biassave_1/RestoreV2:81*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
T0*
_output_shapes
:*
validate_shape(
¿
save_1/Assign_82Assignmain/v/dense_2/bias/Adamsave_1/RestoreV2:82*
use_locking(*
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias*
validate_shape(*
T0
Á
save_1/Assign_83Assignmain/v/dense_2/bias/Adam_1save_1/RestoreV2:83*
T0*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
_output_shapes
:*
validate_shape(
Ã
save_1/Assign_84Assignmain/v/dense_2/kernelsave_1/RestoreV2:84*
_output_shapes
:	¬*
validate_shape(*
T0*(
_class
loc:@main/v/dense_2/kernel*
use_locking(
È
save_1/Assign_85Assignmain/v/dense_2/kernel/Adamsave_1/RestoreV2:85*
_output_shapes
:	¬*
validate_shape(*
T0*
use_locking(*(
_class
loc:@main/v/dense_2/kernel
Ê
save_1/Assign_86Assignmain/v/dense_2/kernel/Adam_1save_1/RestoreV2:86*
T0*(
_class
loc:@main/v/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬*
use_locking(
½
save_1/Assign_87Assigntarget/pi/dense/biassave_1/RestoreV2:87*'
_class
loc:@target/pi/dense/bias*
validate_shape(*
T0*
_output_shapes	
:*
use_locking(
Å
save_1/Assign_88Assigntarget/pi/dense/kernelsave_1/RestoreV2:88*
T0*
_output_shapes
:	6*
use_locking(*)
_class
loc:@target/pi/dense/kernel*
validate_shape(
Á
save_1/Assign_89Assigntarget/pi/dense_1/biassave_1/RestoreV2:89*)
_class
loc:@target/pi/dense_1/bias*
use_locking(*
_output_shapes	
:¬*
validate_shape(*
T0
Ê
save_1/Assign_90Assigntarget/pi/dense_1/kernelsave_1/RestoreV2:90*+
_class!
loc:@target/pi/dense_1/kernel*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*
T0
À
save_1/Assign_91Assigntarget/pi/dense_2/biassave_1/RestoreV2:91*
use_locking(*)
_class
loc:@target/pi/dense_2/bias*
T0*
validate_shape(*
_output_shapes
:
É
save_1/Assign_92Assigntarget/pi/dense_2/kernelsave_1/RestoreV2:92*
validate_shape(*
T0*
use_locking(*+
_class!
loc:@target/pi/dense_2/kernel*
_output_shapes
:	¬
À
save_1/Assign_93Assigntarget/pi/dense_3/biassave_1/RestoreV2:93*
_output_shapes
:*)
_class
loc:@target/pi/dense_3/bias*
validate_shape(*
use_locking(*
T0
É
save_1/Assign_94Assigntarget/pi/dense_3/kernelsave_1/RestoreV2:94*
use_locking(*
validate_shape(*+
_class!
loc:@target/pi/dense_3/kernel*
T0*
_output_shapes
:	¬
½
save_1/Assign_95Assigntarget/q1/dense/biassave_1/RestoreV2:95*'
_class
loc:@target/q1/dense/bias*
use_locking(*
validate_shape(*
T0*
_output_shapes	
:
Å
save_1/Assign_96Assigntarget/q1/dense/kernelsave_1/RestoreV2:96*
T0*
_output_shapes
:	B*
use_locking(*
validate_shape(*)
_class
loc:@target/q1/dense/kernel
Á
save_1/Assign_97Assigntarget/q1/dense_1/biassave_1/RestoreV2:97*
T0*
use_locking(*
validate_shape(*)
_class
loc:@target/q1/dense_1/bias*
_output_shapes	
:¬
Ê
save_1/Assign_98Assigntarget/q1/dense_1/kernelsave_1/RestoreV2:98*+
_class!
loc:@target/q1/dense_1/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
¬*
T0
À
save_1/Assign_99Assigntarget/q1/dense_2/biassave_1/RestoreV2:99*
T0*
use_locking(*
validate_shape(*)
_class
loc:@target/q1/dense_2/bias*
_output_shapes
:
Ë
save_1/Assign_100Assigntarget/q1/dense_2/kernelsave_1/RestoreV2:100*+
_class!
loc:@target/q1/dense_2/kernel*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	¬
¿
save_1/Assign_101Assigntarget/q2/dense/biassave_1/RestoreV2:101*'
_class
loc:@target/q2/dense/bias*
T0*
use_locking(*
validate_shape(*
_output_shapes	
:
Ç
save_1/Assign_102Assigntarget/q2/dense/kernelsave_1/RestoreV2:102*
T0*
use_locking(*
validate_shape(*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
:	B
Ã
save_1/Assign_103Assigntarget/q2/dense_1/biassave_1/RestoreV2:103*
_output_shapes	
:¬*
T0*)
_class
loc:@target/q2/dense_1/bias*
validate_shape(*
use_locking(
Ì
save_1/Assign_104Assigntarget/q2/dense_1/kernelsave_1/RestoreV2:104*+
_class!
loc:@target/q2/dense_1/kernel*
T0*
use_locking(*
validate_shape(* 
_output_shapes
:
¬
Â
save_1/Assign_105Assigntarget/q2/dense_2/biassave_1/RestoreV2:105*
T0*)
_class
loc:@target/q2/dense_2/bias*
use_locking(*
_output_shapes
:*
validate_shape(
Ë
save_1/Assign_106Assigntarget/q2/dense_2/kernelsave_1/RestoreV2:106*
T0*
use_locking(*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(
½
save_1/Assign_107Assigntarget/v/dense/biassave_1/RestoreV2:107*
_output_shapes	
:*
T0*&
_class
loc:@target/v/dense/bias*
validate_shape(*
use_locking(
Å
save_1/Assign_108Assigntarget/v/dense/kernelsave_1/RestoreV2:108*
T0*
use_locking(*
_output_shapes
:	6*(
_class
loc:@target/v/dense/kernel*
validate_shape(
Á
save_1/Assign_109Assigntarget/v/dense_1/biassave_1/RestoreV2:109*
T0*(
_class
loc:@target/v/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
validate_shape(
Ê
save_1/Assign_110Assigntarget/v/dense_1/kernelsave_1/RestoreV2:110* 
_output_shapes
:
¬*
T0*
use_locking(**
_class 
loc:@target/v/dense_1/kernel*
validate_shape(
À
save_1/Assign_111Assigntarget/v/dense_2/biassave_1/RestoreV2:111*(
_class
loc:@target/v/dense_2/bias*
validate_shape(*
use_locking(*
_output_shapes
:*
T0
É
save_1/Assign_112Assigntarget/v/dense_2/kernelsave_1/RestoreV2:112*
use_locking(**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
T0

save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_100^save_1/Assign_101^save_1/Assign_102^save_1/Assign_103^save_1/Assign_104^save_1/Assign_105^save_1/Assign_106^save_1/Assign_107^save_1/Assign_108^save_1/Assign_109^save_1/Assign_11^save_1/Assign_110^save_1/Assign_111^save_1/Assign_112^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_3^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_4^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_46^save_1/Assign_47^save_1/Assign_48^save_1/Assign_49^save_1/Assign_5^save_1/Assign_50^save_1/Assign_51^save_1/Assign_52^save_1/Assign_53^save_1/Assign_54^save_1/Assign_55^save_1/Assign_56^save_1/Assign_57^save_1/Assign_58^save_1/Assign_59^save_1/Assign_6^save_1/Assign_60^save_1/Assign_61^save_1/Assign_62^save_1/Assign_63^save_1/Assign_64^save_1/Assign_65^save_1/Assign_66^save_1/Assign_67^save_1/Assign_68^save_1/Assign_69^save_1/Assign_7^save_1/Assign_70^save_1/Assign_71^save_1/Assign_72^save_1/Assign_73^save_1/Assign_74^save_1/Assign_75^save_1/Assign_76^save_1/Assign_77^save_1/Assign_78^save_1/Assign_79^save_1/Assign_8^save_1/Assign_80^save_1/Assign_81^save_1/Assign_82^save_1/Assign_83^save_1/Assign_84^save_1/Assign_85^save_1/Assign_86^save_1/Assign_87^save_1/Assign_88^save_1/Assign_89^save_1/Assign_9^save_1/Assign_90^save_1/Assign_91^save_1/Assign_92^save_1/Assign_93^save_1/Assign_94^save_1/Assign_95^save_1/Assign_96^save_1/Assign_97^save_1/Assign_98^save_1/Assign_99
1
save_1/restore_allNoOp^save_1/restore_shard
[
save_2/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_2/filenamePlaceholderWithDefaultsave_2/filename/input*
dtype0*
shape: *
_output_shapes
: 
i
save_2/ConstPlaceholderWithDefaultsave_2/filename*
dtype0*
shape: *
_output_shapes
: 

save_2/StringJoin/inputs_1Const*<
value3B1 B+_temp_f6dca76bad934e9596a99ccdda4f68a7/part*
dtype0*
_output_shapes
: 
{
save_2/StringJoin
StringJoinsave_2/Constsave_2/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
S
save_2/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_2/ShardedFilename/shardConst*
_output_shapes
: *
value	B : *
dtype0

save_2/ShardedFilenameShardedFilenamesave_2/StringJoinsave_2/ShardedFilename/shardsave_2/num_shards*
_output_shapes
: 
Â
save_2/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:q*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel
Ê
save_2/SaveV2/shape_and_slicesConst*
_output_shapes
:q*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Ê
save_2/SaveV2SaveV2save_2/ShardedFilenamesave_2/SaveV2/tensor_namessave_2/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2
Variable_3
Variable_4beta1_powerbeta1_power_1beta2_powerbeta2_power_1main/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1main/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1main/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1main/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1main/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1main/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1main/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1main/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1main/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1main/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1main/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1main/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1main/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1main/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1main/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1main/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1main/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1main/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1main/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1main/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1main/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1main/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1main/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1main/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1main/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1main/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1target/pi/dense/biastarget/pi/dense/kerneltarget/pi/dense_1/biastarget/pi/dense_1/kerneltarget/pi/dense_2/biastarget/pi/dense_2/kerneltarget/pi/dense_3/biastarget/pi/dense_3/kerneltarget/q1/dense/biastarget/q1/dense/kerneltarget/q1/dense_1/biastarget/q1/dense_1/kerneltarget/q1/dense_2/biastarget/q1/dense_2/kerneltarget/q2/dense/biastarget/q2/dense/kerneltarget/q2/dense_1/biastarget/q2/dense_1/kerneltarget/q2/dense_2/biastarget/q2/dense_2/kerneltarget/v/dense/biastarget/v/dense/kerneltarget/v/dense_1/biastarget/v/dense_1/kerneltarget/v/dense_2/biastarget/v/dense_2/kernel*
dtypesu
s2q

save_2/control_dependencyIdentitysave_2/ShardedFilename^save_2/SaveV2*
T0*)
_class
loc:@save_2/ShardedFilename*
_output_shapes
: 
£
-save_2/MergeV2Checkpoints/checkpoint_prefixesPacksave_2/ShardedFilename^save_2/control_dependency*
_output_shapes
:*

axis *
T0*
N

save_2/MergeV2CheckpointsMergeV2Checkpoints-save_2/MergeV2Checkpoints/checkpoint_prefixessave_2/Const*
delete_old_dirs(

save_2/IdentityIdentitysave_2/Const^save_2/MergeV2Checkpoints^save_2/control_dependency*
_output_shapes
: *
T0
Å
save_2/RestoreV2/tensor_namesConst*
dtype0*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
_output_shapes
:q
Í
!save_2/RestoreV2/shape_and_slicesConst*
dtype0*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:q
Ë
save_2/RestoreV2	RestoreV2save_2/Constsave_2/RestoreV2/tensor_names!save_2/RestoreV2/shape_and_slices*Ú
_output_shapesÇ
Ä:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*
dtypesu
s2q
¢
save_2/AssignAssignVariablesave_2/RestoreV2*
_output_shapes

:@*
T0*
_class
loc:@Variable*
use_locking(*
validate_shape(
ª
save_2/Assign_1Assign
Variable_1save_2/RestoreV2:1*
use_locking(*
_output_shapes

:@@*
_class
loc:@Variable_1*
validate_shape(*
T0
ª
save_2/Assign_2Assign
Variable_2save_2/RestoreV2:2*
T0*
use_locking(*
validate_shape(*
_class
loc:@Variable_2*
_output_shapes

:@@
ª
save_2/Assign_3Assign
Variable_3save_2/RestoreV2:3*
_class
loc:@Variable_3*
_output_shapes

:@@*
validate_shape(*
T0*
use_locking(
ª
save_2/Assign_4Assign
Variable_4save_2/RestoreV2:4*
_output_shapes

:@*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(
«
save_2/Assign_5Assignbeta1_powersave_2/RestoreV2:5*
validate_shape(*
use_locking(*
T0*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias
­
save_2/Assign_6Assignbeta1_power_1save_2/RestoreV2:6*
use_locking(*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: *
T0*
validate_shape(
«
save_2/Assign_7Assignbeta2_powersave_2/RestoreV2:7*
use_locking(*
T0*%
_class
loc:@main/pi/dense/bias*
validate_shape(*
_output_shapes
: 
­
save_2/Assign_8Assignbeta2_power_1save_2/RestoreV2:8*
validate_shape(*
use_locking(*
_output_shapes
: *
T0*%
_class
loc:@main/q1/dense/bias
·
save_2/Assign_9Assignmain/pi/dense/biassave_2/RestoreV2:9*
_output_shapes	
:*
use_locking(*%
_class
loc:@main/pi/dense/bias*
T0*
validate_shape(
¾
save_2/Assign_10Assignmain/pi/dense/bias/Adamsave_2/RestoreV2:10*
_output_shapes	
:*
T0*
use_locking(*
validate_shape(*%
_class
loc:@main/pi/dense/bias
À
save_2/Assign_11Assignmain/pi/dense/bias/Adam_1save_2/RestoreV2:11*
validate_shape(*
use_locking(*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias*
T0
Á
save_2/Assign_12Assignmain/pi/dense/kernelsave_2/RestoreV2:12*
_output_shapes
:	6*
T0*'
_class
loc:@main/pi/dense/kernel*
validate_shape(*
use_locking(
Æ
save_2/Assign_13Assignmain/pi/dense/kernel/Adamsave_2/RestoreV2:13*
use_locking(*
T0*
validate_shape(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6
È
save_2/Assign_14Assignmain/pi/dense/kernel/Adam_1save_2/RestoreV2:14*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*
validate_shape(*
use_locking(
½
save_2/Assign_15Assignmain/pi/dense_1/biassave_2/RestoreV2:15*
use_locking(*
_output_shapes	
:¬*
validate_shape(*'
_class
loc:@main/pi/dense_1/bias*
T0
Â
save_2/Assign_16Assignmain/pi/dense_1/bias/Adamsave_2/RestoreV2:16*
validate_shape(*
T0*
_output_shapes	
:¬*
use_locking(*'
_class
loc:@main/pi/dense_1/bias
Ä
save_2/Assign_17Assignmain/pi/dense_1/bias/Adam_1save_2/RestoreV2:17*
use_locking(*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
T0*
validate_shape(
Æ
save_2/Assign_18Assignmain/pi/dense_1/kernelsave_2/RestoreV2:18* 
_output_shapes
:
¬*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_1/kernel*
use_locking(
Ë
save_2/Assign_19Assignmain/pi/dense_1/kernel/Adamsave_2/RestoreV2:19* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*
validate_shape(*
T0*
use_locking(
Í
save_2/Assign_20Assignmain/pi/dense_1/kernel/Adam_1save_2/RestoreV2:20*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
use_locking(
¼
save_2/Assign_21Assignmain/pi/dense_2/biassave_2/RestoreV2:21*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
T0*
use_locking(
Á
save_2/Assign_22Assignmain/pi/dense_2/bias/Adamsave_2/RestoreV2:22*
validate_shape(*
_output_shapes
:*
T0*
use_locking(*'
_class
loc:@main/pi/dense_2/bias
Ã
save_2/Assign_23Assignmain/pi/dense_2/bias/Adam_1save_2/RestoreV2:23*
use_locking(*
T0*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:
Å
save_2/Assign_24Assignmain/pi/dense_2/kernelsave_2/RestoreV2:24*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
T0*
use_locking(*
validate_shape(
Ê
save_2/Assign_25Assignmain/pi/dense_2/kernel/Adamsave_2/RestoreV2:25*
T0*
validate_shape(*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
use_locking(
Ì
save_2/Assign_26Assignmain/pi/dense_2/kernel/Adam_1save_2/RestoreV2:26*
_output_shapes
:	¬*
use_locking(*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_2/kernel
¼
save_2/Assign_27Assignmain/pi/dense_3/biassave_2/RestoreV2:27*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*'
_class
loc:@main/pi/dense_3/bias
Á
save_2/Assign_28Assignmain/pi/dense_3/bias/Adamsave_2/RestoreV2:28*
use_locking(*
_output_shapes
:*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(*
T0
Ã
save_2/Assign_29Assignmain/pi/dense_3/bias/Adam_1save_2/RestoreV2:29*
_output_shapes
:*
T0*
use_locking(*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(
Å
save_2/Assign_30Assignmain/pi/dense_3/kernelsave_2/RestoreV2:30*
_output_shapes
:	¬*
use_locking(*)
_class
loc:@main/pi/dense_3/kernel*
validate_shape(*
T0
Ê
save_2/Assign_31Assignmain/pi/dense_3/kernel/Adamsave_2/RestoreV2:31*
use_locking(*
T0*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
validate_shape(
Ì
save_2/Assign_32Assignmain/pi/dense_3/kernel/Adam_1save_2/RestoreV2:32*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
use_locking(*
validate_shape(*
T0
¹
save_2/Assign_33Assignmain/q1/dense/biassave_2/RestoreV2:33*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
use_locking(*
T0
¾
save_2/Assign_34Assignmain/q1/dense/bias/Adamsave_2/RestoreV2:34*
_output_shapes	
:*
T0*%
_class
loc:@main/q1/dense/bias*
use_locking(*
validate_shape(
À
save_2/Assign_35Assignmain/q1/dense/bias/Adam_1save_2/RestoreV2:35*
use_locking(*
T0*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:
Á
save_2/Assign_36Assignmain/q1/dense/kernelsave_2/RestoreV2:36*'
_class
loc:@main/q1/dense/kernel*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	B
Æ
save_2/Assign_37Assignmain/q1/dense/kernel/Adamsave_2/RestoreV2:37*
validate_shape(*'
_class
loc:@main/q1/dense/kernel*
use_locking(*
T0*
_output_shapes
:	B
È
save_2/Assign_38Assignmain/q1/dense/kernel/Adam_1save_2/RestoreV2:38*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
T0*
use_locking(*
validate_shape(
½
save_2/Assign_39Assignmain/q1/dense_1/biassave_2/RestoreV2:39*
use_locking(*
_output_shapes	
:¬*
T0*'
_class
loc:@main/q1/dense_1/bias*
validate_shape(
Â
save_2/Assign_40Assignmain/q1/dense_1/bias/Adamsave_2/RestoreV2:40*
validate_shape(*
use_locking(*'
_class
loc:@main/q1/dense_1/bias*
T0*
_output_shapes	
:¬
Ä
save_2/Assign_41Assignmain/q1/dense_1/bias/Adam_1save_2/RestoreV2:41*
T0*
validate_shape(*'
_class
loc:@main/q1/dense_1/bias*
use_locking(*
_output_shapes	
:¬
Æ
save_2/Assign_42Assignmain/q1/dense_1/kernelsave_2/RestoreV2:42* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*)
_class
loc:@main/q1/dense_1/kernel*
T0
Ë
save_2/Assign_43Assignmain/q1/dense_1/kernel/Adamsave_2/RestoreV2:43*
validate_shape(*
T0*
use_locking(* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel
Í
save_2/Assign_44Assignmain/q1/dense_1/kernel/Adam_1save_2/RestoreV2:44*
T0*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel
¼
save_2/Assign_45Assignmain/q1/dense_2/biassave_2/RestoreV2:45*
validate_shape(*
_output_shapes
:*
T0*
use_locking(*'
_class
loc:@main/q1/dense_2/bias
Á
save_2/Assign_46Assignmain/q1/dense_2/bias/Adamsave_2/RestoreV2:46*
T0*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
use_locking(*
validate_shape(
Ã
save_2/Assign_47Assignmain/q1/dense_2/bias/Adam_1save_2/RestoreV2:47*
use_locking(*
_output_shapes
:*
validate_shape(*
T0*'
_class
loc:@main/q1/dense_2/bias
Å
save_2/Assign_48Assignmain/q1/dense_2/kernelsave_2/RestoreV2:48*
use_locking(*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel*
validate_shape(
Ê
save_2/Assign_49Assignmain/q1/dense_2/kernel/Adamsave_2/RestoreV2:49*
_output_shapes
:	¬*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel*
use_locking(*
T0
Ì
save_2/Assign_50Assignmain/q1/dense_2/kernel/Adam_1save_2/RestoreV2:50*)
_class
loc:@main/q1/dense_2/kernel*
T0*
_output_shapes
:	¬*
use_locking(*
validate_shape(
¹
save_2/Assign_51Assignmain/q2/dense/biassave_2/RestoreV2:51*
_output_shapes	
:*
use_locking(*
T0*
validate_shape(*%
_class
loc:@main/q2/dense/bias
¾
save_2/Assign_52Assignmain/q2/dense/bias/Adamsave_2/RestoreV2:52*%
_class
loc:@main/q2/dense/bias*
T0*
use_locking(*
_output_shapes	
:*
validate_shape(
À
save_2/Assign_53Assignmain/q2/dense/bias/Adam_1save_2/RestoreV2:53*
use_locking(*
T0*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias*
validate_shape(
Á
save_2/Assign_54Assignmain/q2/dense/kernelsave_2/RestoreV2:54*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B*
use_locking(*
validate_shape(*
T0
Æ
save_2/Assign_55Assignmain/q2/dense/kernel/Adamsave_2/RestoreV2:55*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel
È
save_2/Assign_56Assignmain/q2/dense/kernel/Adam_1save_2/RestoreV2:56*
T0*
validate_shape(*
_output_shapes
:	B*
use_locking(*'
_class
loc:@main/q2/dense/kernel
½
save_2/Assign_57Assignmain/q2/dense_1/biassave_2/RestoreV2:57*
_output_shapes	
:¬*
use_locking(*
validate_shape(*
T0*'
_class
loc:@main/q2/dense_1/bias
Â
save_2/Assign_58Assignmain/q2/dense_1/bias/Adamsave_2/RestoreV2:58*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
T0*
validate_shape(
Ä
save_2/Assign_59Assignmain/q2/dense_1/bias/Adam_1save_2/RestoreV2:59*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
T0*
validate_shape(
Æ
save_2/Assign_60Assignmain/q2/dense_1/kernelsave_2/RestoreV2:60*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*)
_class
loc:@main/q2/dense_1/kernel*
T0
Ë
save_2/Assign_61Assignmain/q2/dense_1/kernel/Adamsave_2/RestoreV2:61*
use_locking(*)
_class
loc:@main/q2/dense_1/kernel*
validate_shape(*
T0* 
_output_shapes
:
¬
Í
save_2/Assign_62Assignmain/q2/dense_1/kernel/Adam_1save_2/RestoreV2:62* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
use_locking(*
validate_shape(*
T0
¼
save_2/Assign_63Assignmain/q2/dense_2/biassave_2/RestoreV2:63*
validate_shape(*
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias*
use_locking(*
T0
Á
save_2/Assign_64Assignmain/q2/dense_2/bias/Adamsave_2/RestoreV2:64*
use_locking(*
validate_shape(*
T0*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:
Ã
save_2/Assign_65Assignmain/q2/dense_2/bias/Adam_1save_2/RestoreV2:65*
T0*'
_class
loc:@main/q2/dense_2/bias*
validate_shape(*
use_locking(*
_output_shapes
:
Å
save_2/Assign_66Assignmain/q2/dense_2/kernelsave_2/RestoreV2:66*
validate_shape(*
use_locking(*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
T0
Ê
save_2/Assign_67Assignmain/q2/dense_2/kernel/Adamsave_2/RestoreV2:67*
use_locking(*
_output_shapes
:	¬*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel*
T0
Ì
save_2/Assign_68Assignmain/q2/dense_2/kernel/Adam_1save_2/RestoreV2:68*
validate_shape(*
T0*
_output_shapes
:	¬*
use_locking(*)
_class
loc:@main/q2/dense_2/kernel
·
save_2/Assign_69Assignmain/v/dense/biassave_2/RestoreV2:69*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:*
T0*
use_locking(*
validate_shape(
¼
save_2/Assign_70Assignmain/v/dense/bias/Adamsave_2/RestoreV2:70*
_output_shapes	
:*
use_locking(*
validate_shape(*
T0*$
_class
loc:@main/v/dense/bias
¾
save_2/Assign_71Assignmain/v/dense/bias/Adam_1save_2/RestoreV2:71*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
T0*
use_locking(*
validate_shape(
¿
save_2/Assign_72Assignmain/v/dense/kernelsave_2/RestoreV2:72*
_output_shapes
:	6*
validate_shape(*
use_locking(*&
_class
loc:@main/v/dense/kernel*
T0
Ä
save_2/Assign_73Assignmain/v/dense/kernel/Adamsave_2/RestoreV2:73*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
use_locking(*
T0
Æ
save_2/Assign_74Assignmain/v/dense/kernel/Adam_1save_2/RestoreV2:74*
use_locking(*
_output_shapes
:	6*
T0*&
_class
loc:@main/v/dense/kernel*
validate_shape(
»
save_2/Assign_75Assignmain/v/dense_1/biassave_2/RestoreV2:75*
T0*
_output_shapes	
:¬*
use_locking(*
validate_shape(*&
_class
loc:@main/v/dense_1/bias
À
save_2/Assign_76Assignmain/v/dense_1/bias/Adamsave_2/RestoreV2:76*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
validate_shape(*
_output_shapes	
:¬*
T0
Â
save_2/Assign_77Assignmain/v/dense_1/bias/Adam_1save_2/RestoreV2:77*&
_class
loc:@main/v/dense_1/bias*
use_locking(*
_output_shapes	
:¬*
T0*
validate_shape(
Ä
save_2/Assign_78Assignmain/v/dense_1/kernelsave_2/RestoreV2:78*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(*
T0*
use_locking(* 
_output_shapes
:
¬
É
save_2/Assign_79Assignmain/v/dense_1/kernel/Adamsave_2/RestoreV2:79* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(*
use_locking(*
T0
Ë
save_2/Assign_80Assignmain/v/dense_1/kernel/Adam_1save_2/RestoreV2:80*
use_locking(*
T0*
validate_shape(* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel
º
save_2/Assign_81Assignmain/v/dense_2/biassave_2/RestoreV2:81*
use_locking(*
validate_shape(*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
T0
¿
save_2/Assign_82Assignmain/v/dense_2/bias/Adamsave_2/RestoreV2:82*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
T0*
use_locking(*
validate_shape(
Á
save_2/Assign_83Assignmain/v/dense_2/bias/Adam_1save_2/RestoreV2:83*
_output_shapes
:*
T0*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
validate_shape(
Ã
save_2/Assign_84Assignmain/v/dense_2/kernelsave_2/RestoreV2:84*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel
È
save_2/Assign_85Assignmain/v/dense_2/kernel/Adamsave_2/RestoreV2:85*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(*
T0
Ê
save_2/Assign_86Assignmain/v/dense_2/kernel/Adam_1save_2/RestoreV2:86*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
use_locking(*
validate_shape(*
T0
½
save_2/Assign_87Assigntarget/pi/dense/biassave_2/RestoreV2:87*
T0*
_output_shapes	
:*
use_locking(*
validate_shape(*'
_class
loc:@target/pi/dense/bias
Å
save_2/Assign_88Assigntarget/pi/dense/kernelsave_2/RestoreV2:88*
_output_shapes
:	6*
validate_shape(*
T0*
use_locking(*)
_class
loc:@target/pi/dense/kernel
Á
save_2/Assign_89Assigntarget/pi/dense_1/biassave_2/RestoreV2:89*
T0*
validate_shape(*
_output_shapes	
:¬*)
_class
loc:@target/pi/dense_1/bias*
use_locking(
Ê
save_2/Assign_90Assigntarget/pi/dense_1/kernelsave_2/RestoreV2:90*+
_class!
loc:@target/pi/dense_1/kernel*
T0* 
_output_shapes
:
¬*
use_locking(*
validate_shape(
À
save_2/Assign_91Assigntarget/pi/dense_2/biassave_2/RestoreV2:91*
T0*
use_locking(*
validate_shape(*
_output_shapes
:*)
_class
loc:@target/pi/dense_2/bias
É
save_2/Assign_92Assigntarget/pi/dense_2/kernelsave_2/RestoreV2:92*
use_locking(*+
_class!
loc:@target/pi/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬*
T0
À
save_2/Assign_93Assigntarget/pi/dense_3/biassave_2/RestoreV2:93*
T0*
validate_shape(*
_output_shapes
:*
use_locking(*)
_class
loc:@target/pi/dense_3/bias
É
save_2/Assign_94Assigntarget/pi/dense_3/kernelsave_2/RestoreV2:94*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_3/kernel*
validate_shape(*
use_locking(
½
save_2/Assign_95Assigntarget/q1/dense/biassave_2/RestoreV2:95*'
_class
loc:@target/q1/dense/bias*
use_locking(*
_output_shapes	
:*
T0*
validate_shape(
Å
save_2/Assign_96Assigntarget/q1/dense/kernelsave_2/RestoreV2:96*
_output_shapes
:	B*)
_class
loc:@target/q1/dense/kernel*
use_locking(*
T0*
validate_shape(
Á
save_2/Assign_97Assigntarget/q1/dense_1/biassave_2/RestoreV2:97*
use_locking(*)
_class
loc:@target/q1/dense_1/bias*
validate_shape(*
T0*
_output_shapes	
:¬
Ê
save_2/Assign_98Assigntarget/q1/dense_1/kernelsave_2/RestoreV2:98*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*
T0
À
save_2/Assign_99Assigntarget/q1/dense_2/biassave_2/RestoreV2:99*
T0*
_output_shapes
:*
validate_shape(*)
_class
loc:@target/q1/dense_2/bias*
use_locking(
Ë
save_2/Assign_100Assigntarget/q1/dense_2/kernelsave_2/RestoreV2:100*
_output_shapes
:	¬*
validate_shape(*+
_class!
loc:@target/q1/dense_2/kernel*
use_locking(*
T0
¿
save_2/Assign_101Assigntarget/q2/dense/biassave_2/RestoreV2:101*
T0*
validate_shape(*'
_class
loc:@target/q2/dense/bias*
use_locking(*
_output_shapes	
:
Ç
save_2/Assign_102Assigntarget/q2/dense/kernelsave_2/RestoreV2:102*
T0*
use_locking(*)
_class
loc:@target/q2/dense/kernel*
validate_shape(*
_output_shapes
:	B
Ã
save_2/Assign_103Assigntarget/q2/dense_1/biassave_2/RestoreV2:103*)
_class
loc:@target/q2/dense_1/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:¬
Ì
save_2/Assign_104Assigntarget/q2/dense_1/kernelsave_2/RestoreV2:104*+
_class!
loc:@target/q2/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*
T0
Â
save_2/Assign_105Assigntarget/q2/dense_2/biassave_2/RestoreV2:105*
T0*)
_class
loc:@target/q2/dense_2/bias*
use_locking(*
_output_shapes
:*
validate_shape(
Ë
save_2/Assign_106Assigntarget/q2/dense_2/kernelsave_2/RestoreV2:106*
use_locking(*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/q2/dense_2/kernel*
validate_shape(
½
save_2/Assign_107Assigntarget/v/dense/biassave_2/RestoreV2:107*
_output_shapes	
:*
use_locking(*
T0*&
_class
loc:@target/v/dense/bias*
validate_shape(
Å
save_2/Assign_108Assigntarget/v/dense/kernelsave_2/RestoreV2:108*
validate_shape(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
T0*
use_locking(
Á
save_2/Assign_109Assigntarget/v/dense_1/biassave_2/RestoreV2:109*
use_locking(*
T0*
_output_shapes	
:¬*(
_class
loc:@target/v/dense_1/bias*
validate_shape(
Ê
save_2/Assign_110Assigntarget/v/dense_1/kernelsave_2/RestoreV2:110*
T0**
_class 
loc:@target/v/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
use_locking(
À
save_2/Assign_111Assigntarget/v/dense_2/biassave_2/RestoreV2:111*
use_locking(*
validate_shape(*
T0*(
_class
loc:@target/v/dense_2/bias*
_output_shapes
:
É
save_2/Assign_112Assigntarget/v/dense_2/kernelsave_2/RestoreV2:112*
T0*
validate_shape(*
_output_shapes
:	¬*
use_locking(**
_class 
loc:@target/v/dense_2/kernel

save_2/restore_shardNoOp^save_2/Assign^save_2/Assign_1^save_2/Assign_10^save_2/Assign_100^save_2/Assign_101^save_2/Assign_102^save_2/Assign_103^save_2/Assign_104^save_2/Assign_105^save_2/Assign_106^save_2/Assign_107^save_2/Assign_108^save_2/Assign_109^save_2/Assign_11^save_2/Assign_110^save_2/Assign_111^save_2/Assign_112^save_2/Assign_12^save_2/Assign_13^save_2/Assign_14^save_2/Assign_15^save_2/Assign_16^save_2/Assign_17^save_2/Assign_18^save_2/Assign_19^save_2/Assign_2^save_2/Assign_20^save_2/Assign_21^save_2/Assign_22^save_2/Assign_23^save_2/Assign_24^save_2/Assign_25^save_2/Assign_26^save_2/Assign_27^save_2/Assign_28^save_2/Assign_29^save_2/Assign_3^save_2/Assign_30^save_2/Assign_31^save_2/Assign_32^save_2/Assign_33^save_2/Assign_34^save_2/Assign_35^save_2/Assign_36^save_2/Assign_37^save_2/Assign_38^save_2/Assign_39^save_2/Assign_4^save_2/Assign_40^save_2/Assign_41^save_2/Assign_42^save_2/Assign_43^save_2/Assign_44^save_2/Assign_45^save_2/Assign_46^save_2/Assign_47^save_2/Assign_48^save_2/Assign_49^save_2/Assign_5^save_2/Assign_50^save_2/Assign_51^save_2/Assign_52^save_2/Assign_53^save_2/Assign_54^save_2/Assign_55^save_2/Assign_56^save_2/Assign_57^save_2/Assign_58^save_2/Assign_59^save_2/Assign_6^save_2/Assign_60^save_2/Assign_61^save_2/Assign_62^save_2/Assign_63^save_2/Assign_64^save_2/Assign_65^save_2/Assign_66^save_2/Assign_67^save_2/Assign_68^save_2/Assign_69^save_2/Assign_7^save_2/Assign_70^save_2/Assign_71^save_2/Assign_72^save_2/Assign_73^save_2/Assign_74^save_2/Assign_75^save_2/Assign_76^save_2/Assign_77^save_2/Assign_78^save_2/Assign_79^save_2/Assign_8^save_2/Assign_80^save_2/Assign_81^save_2/Assign_82^save_2/Assign_83^save_2/Assign_84^save_2/Assign_85^save_2/Assign_86^save_2/Assign_87^save_2/Assign_88^save_2/Assign_89^save_2/Assign_9^save_2/Assign_90^save_2/Assign_91^save_2/Assign_92^save_2/Assign_93^save_2/Assign_94^save_2/Assign_95^save_2/Assign_96^save_2/Assign_97^save_2/Assign_98^save_2/Assign_99
1
save_2/restore_allNoOp^save_2/restore_shard
[
save_3/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
r
save_3/filenamePlaceholderWithDefaultsave_3/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_3/ConstPlaceholderWithDefaultsave_3/filename*
shape: *
dtype0*
_output_shapes
: 

save_3/StringJoin/inputs_1Const*
_output_shapes
: *<
value3B1 B+_temp_a82581b628db4bad9cfb65ef7d032db7/part*
dtype0
{
save_3/StringJoin
StringJoinsave_3/Constsave_3/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
S
save_3/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
^
save_3/ShardedFilename/shardConst*
_output_shapes
: *
value	B : *
dtype0

save_3/ShardedFilenameShardedFilenamesave_3/StringJoinsave_3/ShardedFilename/shardsave_3/num_shards*
_output_shapes
: 
Â
save_3/SaveV2/tensor_namesConst*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
dtype0*
_output_shapes
:q
Ê
save_3/SaveV2/shape_and_slicesConst*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:q*
dtype0
Ê
save_3/SaveV2SaveV2save_3/ShardedFilenamesave_3/SaveV2/tensor_namessave_3/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2
Variable_3
Variable_4beta1_powerbeta1_power_1beta2_powerbeta2_power_1main/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1main/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1main/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1main/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1main/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1main/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1main/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1main/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1main/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1main/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1main/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1main/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1main/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1main/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1main/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1main/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1main/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1main/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1main/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1main/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1main/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1main/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1main/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1main/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1main/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1main/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1target/pi/dense/biastarget/pi/dense/kerneltarget/pi/dense_1/biastarget/pi/dense_1/kerneltarget/pi/dense_2/biastarget/pi/dense_2/kerneltarget/pi/dense_3/biastarget/pi/dense_3/kerneltarget/q1/dense/biastarget/q1/dense/kerneltarget/q1/dense_1/biastarget/q1/dense_1/kerneltarget/q1/dense_2/biastarget/q1/dense_2/kerneltarget/q2/dense/biastarget/q2/dense/kerneltarget/q2/dense_1/biastarget/q2/dense_1/kerneltarget/q2/dense_2/biastarget/q2/dense_2/kerneltarget/v/dense/biastarget/v/dense/kerneltarget/v/dense_1/biastarget/v/dense_1/kerneltarget/v/dense_2/biastarget/v/dense_2/kernel*
dtypesu
s2q

save_3/control_dependencyIdentitysave_3/ShardedFilename^save_3/SaveV2*
T0*)
_class
loc:@save_3/ShardedFilename*
_output_shapes
: 
£
-save_3/MergeV2Checkpoints/checkpoint_prefixesPacksave_3/ShardedFilename^save_3/control_dependency*
_output_shapes
:*
T0*

axis *
N

save_3/MergeV2CheckpointsMergeV2Checkpoints-save_3/MergeV2Checkpoints/checkpoint_prefixessave_3/Const*
delete_old_dirs(

save_3/IdentityIdentitysave_3/Const^save_3/MergeV2Checkpoints^save_3/control_dependency*
_output_shapes
: *
T0
Å
save_3/RestoreV2/tensor_namesConst*
dtype0*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
_output_shapes
:q
Í
!save_3/RestoreV2/shape_and_slicesConst*
_output_shapes
:q*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Ë
save_3/RestoreV2	RestoreV2save_3/Constsave_3/RestoreV2/tensor_names!save_3/RestoreV2/shape_and_slices*
dtypesu
s2q*Ú
_output_shapesÇ
Ä:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
¢
save_3/AssignAssignVariablesave_3/RestoreV2*
_output_shapes

:@*
T0*
validate_shape(*
use_locking(*
_class
loc:@Variable
ª
save_3/Assign_1Assign
Variable_1save_3/RestoreV2:1*
T0*
_output_shapes

:@@*
_class
loc:@Variable_1*
validate_shape(*
use_locking(
ª
save_3/Assign_2Assign
Variable_2save_3/RestoreV2:2*
T0*
validate_shape(*
use_locking(*
_output_shapes

:@@*
_class
loc:@Variable_2
ª
save_3/Assign_3Assign
Variable_3save_3/RestoreV2:3*
_class
loc:@Variable_3*
use_locking(*
_output_shapes

:@@*
T0*
validate_shape(
ª
save_3/Assign_4Assign
Variable_4save_3/RestoreV2:4*
T0*
_class
loc:@Variable_4*
validate_shape(*
use_locking(*
_output_shapes

:@
«
save_3/Assign_5Assignbeta1_powersave_3/RestoreV2:5*
_output_shapes
: *
use_locking(*%
_class
loc:@main/pi/dense/bias*
T0*
validate_shape(
­
save_3/Assign_6Assignbeta1_power_1save_3/RestoreV2:6*
validate_shape(*
T0*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
use_locking(
«
save_3/Assign_7Assignbeta2_powersave_3/RestoreV2:7*
validate_shape(*
T0*
use_locking(*%
_class
loc:@main/pi/dense/bias*
_output_shapes
: 
­
save_3/Assign_8Assignbeta2_power_1save_3/RestoreV2:8*
T0*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: *
use_locking(*
validate_shape(
·
save_3/Assign_9Assignmain/pi/dense/biassave_3/RestoreV2:9*
use_locking(*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
T0*
validate_shape(
¾
save_3/Assign_10Assignmain/pi/dense/bias/Adamsave_3/RestoreV2:10*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(*%
_class
loc:@main/pi/dense/bias
À
save_3/Assign_11Assignmain/pi/dense/bias/Adam_1save_3/RestoreV2:11*%
_class
loc:@main/pi/dense/bias*
validate_shape(*
T0*
_output_shapes	
:*
use_locking(
Á
save_3/Assign_12Assignmain/pi/dense/kernelsave_3/RestoreV2:12*
_output_shapes
:	6*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/pi/dense/kernel
Æ
save_3/Assign_13Assignmain/pi/dense/kernel/Adamsave_3/RestoreV2:13*
use_locking(*
_output_shapes
:	6*
validate_shape(*'
_class
loc:@main/pi/dense/kernel*
T0
È
save_3/Assign_14Assignmain/pi/dense/kernel/Adam_1save_3/RestoreV2:14*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*
validate_shape(*
use_locking(*
T0
½
save_3/Assign_15Assignmain/pi/dense_1/biassave_3/RestoreV2:15*
T0*
use_locking(*
_output_shapes	
:¬*
validate_shape(*'
_class
loc:@main/pi/dense_1/bias
Â
save_3/Assign_16Assignmain/pi/dense_1/bias/Adamsave_3/RestoreV2:16*
use_locking(*
validate_shape(*'
_class
loc:@main/pi/dense_1/bias*
T0*
_output_shapes	
:¬
Ä
save_3/Assign_17Assignmain/pi/dense_1/bias/Adam_1save_3/RestoreV2:17*
T0*
use_locking(*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
validate_shape(
Æ
save_3/Assign_18Assignmain/pi/dense_1/kernelsave_3/RestoreV2:18*
validate_shape(* 
_output_shapes
:
¬*
T0*
use_locking(*)
_class
loc:@main/pi/dense_1/kernel
Ë
save_3/Assign_19Assignmain/pi/dense_1/kernel/Adamsave_3/RestoreV2:19*)
_class
loc:@main/pi/dense_1/kernel*
use_locking(*
validate_shape(* 
_output_shapes
:
¬*
T0
Í
save_3/Assign_20Assignmain/pi/dense_1/kernel/Adam_1save_3/RestoreV2:20*
T0*)
_class
loc:@main/pi/dense_1/kernel*
use_locking(*
validate_shape(* 
_output_shapes
:
¬
¼
save_3/Assign_21Assignmain/pi/dense_2/biassave_3/RestoreV2:21*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
use_locking(*
T0*
_output_shapes
:
Á
save_3/Assign_22Assignmain/pi/dense_2/bias/Adamsave_3/RestoreV2:22*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
T0*
validate_shape(*
use_locking(
Ã
save_3/Assign_23Assignmain/pi/dense_2/bias/Adam_1save_3/RestoreV2:23*
T0*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
use_locking(
Å
save_3/Assign_24Assignmain/pi/dense_2/kernelsave_3/RestoreV2:24*
T0*
use_locking(*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬
Ê
save_3/Assign_25Assignmain/pi/dense_2/kernel/Adamsave_3/RestoreV2:25*
T0*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(*
use_locking(*
_output_shapes
:	¬
Ì
save_3/Assign_26Assignmain/pi/dense_2/kernel/Adam_1save_3/RestoreV2:26*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_2/kernel*
use_locking(*
validate_shape(
¼
save_3/Assign_27Assignmain/pi/dense_3/biassave_3/RestoreV2:27*
validate_shape(*'
_class
loc:@main/pi/dense_3/bias*
T0*
_output_shapes
:*
use_locking(
Á
save_3/Assign_28Assignmain/pi/dense_3/bias/Adamsave_3/RestoreV2:28*
_output_shapes
:*
validate_shape(*'
_class
loc:@main/pi/dense_3/bias*
T0*
use_locking(
Ã
save_3/Assign_29Assignmain/pi/dense_3/bias/Adam_1save_3/RestoreV2:29*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:*
T0*
validate_shape(*
use_locking(
Å
save_3/Assign_30Assignmain/pi/dense_3/kernelsave_3/RestoreV2:30*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
use_locking(*
validate_shape(*
T0
Ê
save_3/Assign_31Assignmain/pi/dense_3/kernel/Adamsave_3/RestoreV2:31*
validate_shape(*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
T0*
use_locking(
Ì
save_3/Assign_32Assignmain/pi/dense_3/kernel/Adam_1save_3/RestoreV2:32*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
use_locking(*
validate_shape(*
T0
¹
save_3/Assign_33Assignmain/q1/dense/biassave_3/RestoreV2:33*
validate_shape(*
T0*
use_locking(*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:
¾
save_3/Assign_34Assignmain/q1/dense/bias/Adamsave_3/RestoreV2:34*
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias*
T0*
use_locking(*
validate_shape(
À
save_3/Assign_35Assignmain/q1/dense/bias/Adam_1save_3/RestoreV2:35*
_output_shapes	
:*
T0*
validate_shape(*
use_locking(*%
_class
loc:@main/q1/dense/bias
Á
save_3/Assign_36Assignmain/q1/dense/kernelsave_3/RestoreV2:36*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
validate_shape(*
T0*
use_locking(
Æ
save_3/Assign_37Assignmain/q1/dense/kernel/Adamsave_3/RestoreV2:37*
validate_shape(*
use_locking(*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
:	B
È
save_3/Assign_38Assignmain/q1/dense/kernel/Adam_1save_3/RestoreV2:38*
_output_shapes
:	B*
use_locking(*'
_class
loc:@main/q1/dense/kernel*
validate_shape(*
T0
½
save_3/Assign_39Assignmain/q1/dense_1/biassave_3/RestoreV2:39*
_output_shapes	
:¬*
use_locking(*
T0*
validate_shape(*'
_class
loc:@main/q1/dense_1/bias
Â
save_3/Assign_40Assignmain/q1/dense_1/bias/Adamsave_3/RestoreV2:40*
T0*
validate_shape(*
_output_shapes	
:¬*
use_locking(*'
_class
loc:@main/q1/dense_1/bias
Ä
save_3/Assign_41Assignmain/q1/dense_1/bias/Adam_1save_3/RestoreV2:41*
T0*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
validate_shape(
Æ
save_3/Assign_42Assignmain/q1/dense_1/kernelsave_3/RestoreV2:42*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel*
T0
Ë
save_3/Assign_43Assignmain/q1/dense_1/kernel/Adamsave_3/RestoreV2:43*
T0*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*)
_class
loc:@main/q1/dense_1/kernel
Í
save_3/Assign_44Assignmain/q1/dense_1/kernel/Adam_1save_3/RestoreV2:44*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*
T0*)
_class
loc:@main/q1/dense_1/kernel
¼
save_3/Assign_45Assignmain/q1/dense_2/biassave_3/RestoreV2:45*
validate_shape(*'
_class
loc:@main/q1/dense_2/bias*
use_locking(*
T0*
_output_shapes
:
Á
save_3/Assign_46Assignmain/q1/dense_2/bias/Adamsave_3/RestoreV2:46*
_output_shapes
:*
T0*'
_class
loc:@main/q1/dense_2/bias*
validate_shape(*
use_locking(
Ã
save_3/Assign_47Assignmain/q1/dense_2/bias/Adam_1save_3/RestoreV2:47*
use_locking(*'
_class
loc:@main/q1/dense_2/bias*
T0*
validate_shape(*
_output_shapes
:
Å
save_3/Assign_48Assignmain/q1/dense_2/kernelsave_3/RestoreV2:48*)
_class
loc:@main/q1/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
T0*
validate_shape(
Ê
save_3/Assign_49Assignmain/q1/dense_2/kernel/Adamsave_3/RestoreV2:49*
use_locking(*
_output_shapes
:	¬*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel*
T0
Ì
save_3/Assign_50Assignmain/q1/dense_2/kernel/Adam_1save_3/RestoreV2:50*)
_class
loc:@main/q1/dense_2/kernel*
T0*
_output_shapes
:	¬*
use_locking(*
validate_shape(
¹
save_3/Assign_51Assignmain/q2/dense/biassave_3/RestoreV2:51*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*%
_class
loc:@main/q2/dense/bias
¾
save_3/Assign_52Assignmain/q2/dense/bias/Adamsave_3/RestoreV2:52*%
_class
loc:@main/q2/dense/bias*
validate_shape(*
_output_shapes	
:*
T0*
use_locking(
À
save_3/Assign_53Assignmain/q2/dense/bias/Adam_1save_3/RestoreV2:53*
use_locking(*
validate_shape(*%
_class
loc:@main/q2/dense/bias*
T0*
_output_shapes	
:
Á
save_3/Assign_54Assignmain/q2/dense/kernelsave_3/RestoreV2:54*
_output_shapes
:	B*
validate_shape(*
use_locking(*'
_class
loc:@main/q2/dense/kernel*
T0
Æ
save_3/Assign_55Assignmain/q2/dense/kernel/Adamsave_3/RestoreV2:55*
_output_shapes
:	B*
use_locking(*
T0*'
_class
loc:@main/q2/dense/kernel*
validate_shape(
È
save_3/Assign_56Assignmain/q2/dense/kernel/Adam_1save_3/RestoreV2:56*
T0*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
validate_shape(*
use_locking(
½
save_3/Assign_57Assignmain/q2/dense_1/biassave_3/RestoreV2:57*
validate_shape(*
_output_shapes	
:¬*
use_locking(*'
_class
loc:@main/q2/dense_1/bias*
T0
Â
save_3/Assign_58Assignmain/q2/dense_1/bias/Adamsave_3/RestoreV2:58*
validate_shape(*
_output_shapes	
:¬*
T0*
use_locking(*'
_class
loc:@main/q2/dense_1/bias
Ä
save_3/Assign_59Assignmain/q2/dense_1/bias/Adam_1save_3/RestoreV2:59*
_output_shapes	
:¬*
T0*
use_locking(*
validate_shape(*'
_class
loc:@main/q2/dense_1/bias
Æ
save_3/Assign_60Assignmain/q2/dense_1/kernelsave_3/RestoreV2:60* 
_output_shapes
:
¬*
use_locking(*
validate_shape(*
T0*)
_class
loc:@main/q2/dense_1/kernel
Ë
save_3/Assign_61Assignmain/q2/dense_1/kernel/Adamsave_3/RestoreV2:61*
use_locking(*
T0*
validate_shape(*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬
Í
save_3/Assign_62Assignmain/q2/dense_1/kernel/Adam_1save_3/RestoreV2:62*
T0* 
_output_shapes
:
¬*
use_locking(*)
_class
loc:@main/q2/dense_1/kernel*
validate_shape(
¼
save_3/Assign_63Assignmain/q2/dense_2/biassave_3/RestoreV2:63*
T0*
_output_shapes
:*
validate_shape(*'
_class
loc:@main/q2/dense_2/bias*
use_locking(
Á
save_3/Assign_64Assignmain/q2/dense_2/bias/Adamsave_3/RestoreV2:64*
_output_shapes
:*
T0*'
_class
loc:@main/q2/dense_2/bias*
use_locking(*
validate_shape(
Ã
save_3/Assign_65Assignmain/q2/dense_2/bias/Adam_1save_3/RestoreV2:65*'
_class
loc:@main/q2/dense_2/bias*
T0*
_output_shapes
:*
validate_shape(*
use_locking(
Å
save_3/Assign_66Assignmain/q2/dense_2/kernelsave_3/RestoreV2:66*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel*
T0*
use_locking(*
_output_shapes
:	¬
Ê
save_3/Assign_67Assignmain/q2/dense_2/kernel/Adamsave_3/RestoreV2:67*)
_class
loc:@main/q2/dense_2/kernel*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	¬
Ì
save_3/Assign_68Assignmain/q2/dense_2/kernel/Adam_1save_3/RestoreV2:68*)
_class
loc:@main/q2/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
T0*
validate_shape(
·
save_3/Assign_69Assignmain/v/dense/biassave_3/RestoreV2:69*$
_class
loc:@main/v/dense/bias*
use_locking(*
T0*
_output_shapes	
:*
validate_shape(
¼
save_3/Assign_70Assignmain/v/dense/bias/Adamsave_3/RestoreV2:70*$
_class
loc:@main/v/dense/bias*
validate_shape(*
T0*
_output_shapes	
:*
use_locking(
¾
save_3/Assign_71Assignmain/v/dense/bias/Adam_1save_3/RestoreV2:71*
_output_shapes	
:*
validate_shape(*
use_locking(*
T0*$
_class
loc:@main/v/dense/bias
¿
save_3/Assign_72Assignmain/v/dense/kernelsave_3/RestoreV2:72*&
_class
loc:@main/v/dense/kernel*
T0*
_output_shapes
:	6*
use_locking(*
validate_shape(
Ä
save_3/Assign_73Assignmain/v/dense/kernel/Adamsave_3/RestoreV2:73*&
_class
loc:@main/v/dense/kernel*
T0*
_output_shapes
:	6*
use_locking(*
validate_shape(
Æ
save_3/Assign_74Assignmain/v/dense/kernel/Adam_1save_3/RestoreV2:74*
T0*
_output_shapes
:	6*
use_locking(*
validate_shape(*&
_class
loc:@main/v/dense/kernel
»
save_3/Assign_75Assignmain/v/dense_1/biassave_3/RestoreV2:75*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias
À
save_3/Assign_76Assignmain/v/dense_1/bias/Adamsave_3/RestoreV2:76*&
_class
loc:@main/v/dense_1/bias*
T0*
use_locking(*
_output_shapes	
:¬*
validate_shape(
Â
save_3/Assign_77Assignmain/v/dense_1/bias/Adam_1save_3/RestoreV2:77*&
_class
loc:@main/v/dense_1/bias*
use_locking(*
_output_shapes	
:¬*
T0*
validate_shape(
Ä
save_3/Assign_78Assignmain/v/dense_1/kernelsave_3/RestoreV2:78*
use_locking(* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
T0*
validate_shape(
É
save_3/Assign_79Assignmain/v/dense_1/kernel/Adamsave_3/RestoreV2:79*
use_locking(*
validate_shape(*
T0*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬
Ë
save_3/Assign_80Assignmain/v/dense_1/kernel/Adam_1save_3/RestoreV2:80* 
_output_shapes
:
¬*
T0*
validate_shape(*(
_class
loc:@main/v/dense_1/kernel*
use_locking(
º
save_3/Assign_81Assignmain/v/dense_2/biassave_3/RestoreV2:81*
T0*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
use_locking(*
validate_shape(
¿
save_3/Assign_82Assignmain/v/dense_2/bias/Adamsave_3/RestoreV2:82*
use_locking(*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
validate_shape(*
T0
Á
save_3/Assign_83Assignmain/v/dense_2/bias/Adam_1save_3/RestoreV2:83*
use_locking(*
_output_shapes
:*
validate_shape(*&
_class
loc:@main/v/dense_2/bias*
T0
Ã
save_3/Assign_84Assignmain/v/dense_2/kernelsave_3/RestoreV2:84*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
T0*
use_locking(
È
save_3/Assign_85Assignmain/v/dense_2/kernel/Adamsave_3/RestoreV2:85*
use_locking(*
T0*
_output_shapes
:	¬*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel
Ê
save_3/Assign_86Assignmain/v/dense_2/kernel/Adam_1save_3/RestoreV2:86*(
_class
loc:@main/v/dense_2/kernel*
T0*
_output_shapes
:	¬*
validate_shape(*
use_locking(
½
save_3/Assign_87Assigntarget/pi/dense/biassave_3/RestoreV2:87*
use_locking(*
T0*'
_class
loc:@target/pi/dense/bias*
validate_shape(*
_output_shapes	
:
Å
save_3/Assign_88Assigntarget/pi/dense/kernelsave_3/RestoreV2:88*
use_locking(*
_output_shapes
:	6*
validate_shape(*
T0*)
_class
loc:@target/pi/dense/kernel
Á
save_3/Assign_89Assigntarget/pi/dense_1/biassave_3/RestoreV2:89*)
_class
loc:@target/pi/dense_1/bias*
validate_shape(*
T0*
use_locking(*
_output_shapes	
:¬
Ê
save_3/Assign_90Assigntarget/pi/dense_1/kernelsave_3/RestoreV2:90*+
_class!
loc:@target/pi/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*
T0
À
save_3/Assign_91Assigntarget/pi/dense_2/biassave_3/RestoreV2:91*
T0*
_output_shapes
:*
use_locking(*)
_class
loc:@target/pi/dense_2/bias*
validate_shape(
É
save_3/Assign_92Assigntarget/pi/dense_2/kernelsave_3/RestoreV2:92*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel*
validate_shape(*
T0*
use_locking(
À
save_3/Assign_93Assigntarget/pi/dense_3/biassave_3/RestoreV2:93*
T0*
validate_shape(*)
_class
loc:@target/pi/dense_3/bias*
_output_shapes
:*
use_locking(
É
save_3/Assign_94Assigntarget/pi/dense_3/kernelsave_3/RestoreV2:94*
use_locking(*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_3/kernel*
T0*
validate_shape(
½
save_3/Assign_95Assigntarget/q1/dense/biassave_3/RestoreV2:95*
use_locking(*
T0*'
_class
loc:@target/q1/dense/bias*
_output_shapes	
:*
validate_shape(
Å
save_3/Assign_96Assigntarget/q1/dense/kernelsave_3/RestoreV2:96*
_output_shapes
:	B*
validate_shape(*
use_locking(*)
_class
loc:@target/q1/dense/kernel*
T0
Á
save_3/Assign_97Assigntarget/q1/dense_1/biassave_3/RestoreV2:97*
use_locking(*
validate_shape(*
T0*
_output_shapes	
:¬*)
_class
loc:@target/q1/dense_1/bias
Ê
save_3/Assign_98Assigntarget/q1/dense_1/kernelsave_3/RestoreV2:98*
T0*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*+
_class!
loc:@target/q1/dense_1/kernel
À
save_3/Assign_99Assigntarget/q1/dense_2/biassave_3/RestoreV2:99*
use_locking(*
_output_shapes
:*
validate_shape(*)
_class
loc:@target/q1/dense_2/bias*
T0
Ë
save_3/Assign_100Assigntarget/q1/dense_2/kernelsave_3/RestoreV2:100*
T0*
use_locking(*
_output_shapes
:	¬*
validate_shape(*+
_class!
loc:@target/q1/dense_2/kernel
¿
save_3/Assign_101Assigntarget/q2/dense/biassave_3/RestoreV2:101*
_output_shapes	
:*
T0*
use_locking(*'
_class
loc:@target/q2/dense/bias*
validate_shape(
Ç
save_3/Assign_102Assigntarget/q2/dense/kernelsave_3/RestoreV2:102*
validate_shape(*
T0*
_output_shapes
:	B*
use_locking(*)
_class
loc:@target/q2/dense/kernel
Ã
save_3/Assign_103Assigntarget/q2/dense_1/biassave_3/RestoreV2:103*
_output_shapes	
:¬*
validate_shape(*
use_locking(*
T0*)
_class
loc:@target/q2/dense_1/bias
Ì
save_3/Assign_104Assigntarget/q2/dense_1/kernelsave_3/RestoreV2:104*+
_class!
loc:@target/q2/dense_1/kernel*
T0*
validate_shape(* 
_output_shapes
:
¬*
use_locking(
Â
save_3/Assign_105Assigntarget/q2/dense_2/biassave_3/RestoreV2:105*
T0*
validate_shape(*
_output_shapes
:*
use_locking(*)
_class
loc:@target/q2/dense_2/bias
Ë
save_3/Assign_106Assigntarget/q2/dense_2/kernelsave_3/RestoreV2:106*
validate_shape(*
_output_shapes
:	¬*+
_class!
loc:@target/q2/dense_2/kernel*
T0*
use_locking(
½
save_3/Assign_107Assigntarget/v/dense/biassave_3/RestoreV2:107*
use_locking(*&
_class
loc:@target/v/dense/bias*
_output_shapes	
:*
T0*
validate_shape(
Å
save_3/Assign_108Assigntarget/v/dense/kernelsave_3/RestoreV2:108*
T0*
validate_shape(*
use_locking(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6
Á
save_3/Assign_109Assigntarget/v/dense_1/biassave_3/RestoreV2:109*(
_class
loc:@target/v/dense_1/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:¬
Ê
save_3/Assign_110Assigntarget/v/dense_1/kernelsave_3/RestoreV2:110* 
_output_shapes
:
¬**
_class 
loc:@target/v/dense_1/kernel*
use_locking(*
validate_shape(*
T0
À
save_3/Assign_111Assigntarget/v/dense_2/biassave_3/RestoreV2:111*
use_locking(*
validate_shape(*
_output_shapes
:*(
_class
loc:@target/v/dense_2/bias*
T0
É
save_3/Assign_112Assigntarget/v/dense_2/kernelsave_3/RestoreV2:112*
validate_shape(*
T0**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬*
use_locking(

save_3/restore_shardNoOp^save_3/Assign^save_3/Assign_1^save_3/Assign_10^save_3/Assign_100^save_3/Assign_101^save_3/Assign_102^save_3/Assign_103^save_3/Assign_104^save_3/Assign_105^save_3/Assign_106^save_3/Assign_107^save_3/Assign_108^save_3/Assign_109^save_3/Assign_11^save_3/Assign_110^save_3/Assign_111^save_3/Assign_112^save_3/Assign_12^save_3/Assign_13^save_3/Assign_14^save_3/Assign_15^save_3/Assign_16^save_3/Assign_17^save_3/Assign_18^save_3/Assign_19^save_3/Assign_2^save_3/Assign_20^save_3/Assign_21^save_3/Assign_22^save_3/Assign_23^save_3/Assign_24^save_3/Assign_25^save_3/Assign_26^save_3/Assign_27^save_3/Assign_28^save_3/Assign_29^save_3/Assign_3^save_3/Assign_30^save_3/Assign_31^save_3/Assign_32^save_3/Assign_33^save_3/Assign_34^save_3/Assign_35^save_3/Assign_36^save_3/Assign_37^save_3/Assign_38^save_3/Assign_39^save_3/Assign_4^save_3/Assign_40^save_3/Assign_41^save_3/Assign_42^save_3/Assign_43^save_3/Assign_44^save_3/Assign_45^save_3/Assign_46^save_3/Assign_47^save_3/Assign_48^save_3/Assign_49^save_3/Assign_5^save_3/Assign_50^save_3/Assign_51^save_3/Assign_52^save_3/Assign_53^save_3/Assign_54^save_3/Assign_55^save_3/Assign_56^save_3/Assign_57^save_3/Assign_58^save_3/Assign_59^save_3/Assign_6^save_3/Assign_60^save_3/Assign_61^save_3/Assign_62^save_3/Assign_63^save_3/Assign_64^save_3/Assign_65^save_3/Assign_66^save_3/Assign_67^save_3/Assign_68^save_3/Assign_69^save_3/Assign_7^save_3/Assign_70^save_3/Assign_71^save_3/Assign_72^save_3/Assign_73^save_3/Assign_74^save_3/Assign_75^save_3/Assign_76^save_3/Assign_77^save_3/Assign_78^save_3/Assign_79^save_3/Assign_8^save_3/Assign_80^save_3/Assign_81^save_3/Assign_82^save_3/Assign_83^save_3/Assign_84^save_3/Assign_85^save_3/Assign_86^save_3/Assign_87^save_3/Assign_88^save_3/Assign_89^save_3/Assign_9^save_3/Assign_90^save_3/Assign_91^save_3/Assign_92^save_3/Assign_93^save_3/Assign_94^save_3/Assign_95^save_3/Assign_96^save_3/Assign_97^save_3/Assign_98^save_3/Assign_99
1
save_3/restore_allNoOp^save_3/restore_shard
[
save_4/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_4/filenamePlaceholderWithDefaultsave_4/filename/input*
_output_shapes
: *
shape: *
dtype0
i
save_4/ConstPlaceholderWithDefaultsave_4/filename*
dtype0*
_output_shapes
: *
shape: 

save_4/StringJoin/inputs_1Const*
dtype0*<
value3B1 B+_temp_c4a1309c36b546dab02fab42fadd6305/part*
_output_shapes
: 
{
save_4/StringJoin
StringJoinsave_4/Constsave_4/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
S
save_4/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
^
save_4/ShardedFilename/shardConst*
_output_shapes
: *
value	B : *
dtype0

save_4/ShardedFilenameShardedFilenamesave_4/StringJoinsave_4/ShardedFilename/shardsave_4/num_shards*
_output_shapes
: 
Â
save_4/SaveV2/tensor_namesConst*
_output_shapes
:q*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
dtype0
Ê
save_4/SaveV2/shape_and_slicesConst*
dtype0*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:q
Ê
save_4/SaveV2SaveV2save_4/ShardedFilenamesave_4/SaveV2/tensor_namessave_4/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2
Variable_3
Variable_4beta1_powerbeta1_power_1beta2_powerbeta2_power_1main/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1main/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1main/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1main/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1main/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1main/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1main/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1main/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1main/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1main/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1main/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1main/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1main/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1main/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1main/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1main/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1main/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1main/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1main/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1main/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1main/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1main/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1main/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1main/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1main/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1main/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1target/pi/dense/biastarget/pi/dense/kerneltarget/pi/dense_1/biastarget/pi/dense_1/kerneltarget/pi/dense_2/biastarget/pi/dense_2/kerneltarget/pi/dense_3/biastarget/pi/dense_3/kerneltarget/q1/dense/biastarget/q1/dense/kerneltarget/q1/dense_1/biastarget/q1/dense_1/kerneltarget/q1/dense_2/biastarget/q1/dense_2/kerneltarget/q2/dense/biastarget/q2/dense/kerneltarget/q2/dense_1/biastarget/q2/dense_1/kerneltarget/q2/dense_2/biastarget/q2/dense_2/kerneltarget/v/dense/biastarget/v/dense/kerneltarget/v/dense_1/biastarget/v/dense_1/kerneltarget/v/dense_2/biastarget/v/dense_2/kernel*
dtypesu
s2q

save_4/control_dependencyIdentitysave_4/ShardedFilename^save_4/SaveV2*
T0*)
_class
loc:@save_4/ShardedFilename*
_output_shapes
: 
£
-save_4/MergeV2Checkpoints/checkpoint_prefixesPacksave_4/ShardedFilename^save_4/control_dependency*
_output_shapes
:*
N*

axis *
T0

save_4/MergeV2CheckpointsMergeV2Checkpoints-save_4/MergeV2Checkpoints/checkpoint_prefixessave_4/Const*
delete_old_dirs(

save_4/IdentityIdentitysave_4/Const^save_4/MergeV2Checkpoints^save_4/control_dependency*
T0*
_output_shapes
: 
Å
save_4/RestoreV2/tensor_namesConst*ó
valueéBæqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
_output_shapes
:q*
dtype0
Í
!save_4/RestoreV2/shape_and_slicesConst*÷
valueíBêqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:q
Ë
save_4/RestoreV2	RestoreV2save_4/Constsave_4/RestoreV2/tensor_names!save_4/RestoreV2/shape_and_slices*
dtypesu
s2q*Ú
_output_shapesÇ
Ä:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
¢
save_4/AssignAssignVariablesave_4/RestoreV2*
use_locking(*
_output_shapes

:@*
T0*
validate_shape(*
_class
loc:@Variable
ª
save_4/Assign_1Assign
Variable_1save_4/RestoreV2:1*
_class
loc:@Variable_1*
validate_shape(*
T0*
use_locking(*
_output_shapes

:@@
ª
save_4/Assign_2Assign
Variable_2save_4/RestoreV2:2*
use_locking(*
validate_shape(*
_class
loc:@Variable_2*
T0*
_output_shapes

:@@
ª
save_4/Assign_3Assign
Variable_3save_4/RestoreV2:3*
validate_shape(*
_output_shapes

:@@*
_class
loc:@Variable_3*
T0*
use_locking(
ª
save_4/Assign_4Assign
Variable_4save_4/RestoreV2:4*
T0*
_output_shapes

:@*
_class
loc:@Variable_4*
use_locking(*
validate_shape(
«
save_4/Assign_5Assignbeta1_powersave_4/RestoreV2:5*
T0*
validate_shape(*%
_class
loc:@main/pi/dense/bias*
use_locking(*
_output_shapes
: 
­
save_4/Assign_6Assignbeta1_power_1save_4/RestoreV2:6*
validate_shape(*
_output_shapes
: *
T0*
use_locking(*%
_class
loc:@main/q1/dense/bias
«
save_4/Assign_7Assignbeta2_powersave_4/RestoreV2:7*
use_locking(*
validate_shape(*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias*
T0
­
save_4/Assign_8Assignbeta2_power_1save_4/RestoreV2:8*
validate_shape(*
T0*
use_locking(*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: 
·
save_4/Assign_9Assignmain/pi/dense/biassave_4/RestoreV2:9*
_output_shapes	
:*
validate_shape(*%
_class
loc:@main/pi/dense/bias*
T0*
use_locking(
¾
save_4/Assign_10Assignmain/pi/dense/bias/Adamsave_4/RestoreV2:10*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias*
use_locking(*
validate_shape(*
T0
À
save_4/Assign_11Assignmain/pi/dense/bias/Adam_1save_4/RestoreV2:11*
use_locking(*
T0*
_output_shapes	
:*
validate_shape(*%
_class
loc:@main/pi/dense/bias
Á
save_4/Assign_12Assignmain/pi/dense/kernelsave_4/RestoreV2:12*
use_locking(*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*
validate_shape(*
T0
Æ
save_4/Assign_13Assignmain/pi/dense/kernel/Adamsave_4/RestoreV2:13*
validate_shape(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*
T0*
use_locking(
È
save_4/Assign_14Assignmain/pi/dense/kernel/Adam_1save_4/RestoreV2:14*
T0*
_output_shapes
:	6*
use_locking(*'
_class
loc:@main/pi/dense/kernel*
validate_shape(
½
save_4/Assign_15Assignmain/pi/dense_1/biassave_4/RestoreV2:15*
validate_shape(*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias*
T0*
use_locking(
Â
save_4/Assign_16Assignmain/pi/dense_1/bias/Adamsave_4/RestoreV2:16*
T0*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
validate_shape(*
use_locking(
Ä
save_4/Assign_17Assignmain/pi/dense_1/bias/Adam_1save_4/RestoreV2:17*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias
Æ
save_4/Assign_18Assignmain/pi/dense_1/kernelsave_4/RestoreV2:18* 
_output_shapes
:
¬*
T0*
validate_shape(*
use_locking(*)
_class
loc:@main/pi/dense_1/kernel
Ë
save_4/Assign_19Assignmain/pi/dense_1/kernel/Adamsave_4/RestoreV2:19*)
_class
loc:@main/pi/dense_1/kernel*
T0*
validate_shape(*
use_locking(* 
_output_shapes
:
¬
Í
save_4/Assign_20Assignmain/pi/dense_1/kernel/Adam_1save_4/RestoreV2:20*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/pi/dense_1/kernel*
T0
¼
save_4/Assign_21Assignmain/pi/dense_2/biassave_4/RestoreV2:21*
use_locking(*
validate_shape(*
_output_shapes
:*'
_class
loc:@main/pi/dense_2/bias*
T0
Á
save_4/Assign_22Assignmain/pi/dense_2/bias/Adamsave_4/RestoreV2:22*
T0*
_output_shapes
:*'
_class
loc:@main/pi/dense_2/bias*
validate_shape(*
use_locking(
Ã
save_4/Assign_23Assignmain/pi/dense_2/bias/Adam_1save_4/RestoreV2:23*'
_class
loc:@main/pi/dense_2/bias*
T0*
_output_shapes
:*
use_locking(*
validate_shape(
Å
save_4/Assign_24Assignmain/pi/dense_2/kernelsave_4/RestoreV2:24*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_2/kernel*
use_locking(*
_output_shapes
:	¬
Ê
save_4/Assign_25Assignmain/pi/dense_2/kernel/Adamsave_4/RestoreV2:25*
_output_shapes
:	¬*
use_locking(*
T0*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(
Ì
save_4/Assign_26Assignmain/pi/dense_2/kernel/Adam_1save_4/RestoreV2:26*
validate_shape(*)
_class
loc:@main/pi/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
T0
¼
save_4/Assign_27Assignmain/pi/dense_3/biassave_4/RestoreV2:27*
validate_shape(*
T0*
use_locking(*
_output_shapes
:*'
_class
loc:@main/pi/dense_3/bias
Á
save_4/Assign_28Assignmain/pi/dense_3/bias/Adamsave_4/RestoreV2:28*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(*
T0*
_output_shapes
:*
use_locking(
Ã
save_4/Assign_29Assignmain/pi/dense_3/bias/Adam_1save_4/RestoreV2:29*
T0*
use_locking(*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(*
_output_shapes
:
Å
save_4/Assign_30Assignmain/pi/dense_3/kernelsave_4/RestoreV2:30*
use_locking(*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
validate_shape(*
T0
Ê
save_4/Assign_31Assignmain/pi/dense_3/kernel/Adamsave_4/RestoreV2:31*
_output_shapes
:	¬*
use_locking(*)
_class
loc:@main/pi/dense_3/kernel*
T0*
validate_shape(
Ì
save_4/Assign_32Assignmain/pi/dense_3/kernel/Adam_1save_4/RestoreV2:32*
use_locking(*
_output_shapes
:	¬*
validate_shape(*)
_class
loc:@main/pi/dense_3/kernel*
T0
¹
save_4/Assign_33Assignmain/q1/dense/biassave_4/RestoreV2:33*
_output_shapes	
:*
T0*
validate_shape(*
use_locking(*%
_class
loc:@main/q1/dense/bias
¾
save_4/Assign_34Assignmain/q1/dense/bias/Adamsave_4/RestoreV2:34*
_output_shapes	
:*
validate_shape(*
use_locking(*
T0*%
_class
loc:@main/q1/dense/bias
À
save_4/Assign_35Assignmain/q1/dense/bias/Adam_1save_4/RestoreV2:35*
use_locking(*
validate_shape(*
T0*
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias
Á
save_4/Assign_36Assignmain/q1/dense/kernelsave_4/RestoreV2:36*
validate_shape(*
T0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
use_locking(
Æ
save_4/Assign_37Assignmain/q1/dense/kernel/Adamsave_4/RestoreV2:37*
T0*
validate_shape(*
use_locking(*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel
È
save_4/Assign_38Assignmain/q1/dense/kernel/Adam_1save_4/RestoreV2:38*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*
T0*
validate_shape(*
use_locking(
½
save_4/Assign_39Assignmain/q1/dense_1/biassave_4/RestoreV2:39*
use_locking(*
T0*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
validate_shape(
Â
save_4/Assign_40Assignmain/q1/dense_1/bias/Adamsave_4/RestoreV2:40*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
validate_shape(*
T0*
use_locking(
Ä
save_4/Assign_41Assignmain/q1/dense_1/bias/Adam_1save_4/RestoreV2:41*
validate_shape(*
T0*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
use_locking(
Æ
save_4/Assign_42Assignmain/q1/dense_1/kernelsave_4/RestoreV2:42*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel*
use_locking(*
validate_shape(
Ë
save_4/Assign_43Assignmain/q1/dense_1/kernel/Adamsave_4/RestoreV2:43*
validate_shape(*
use_locking(*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel
Í
save_4/Assign_44Assignmain/q1/dense_1/kernel/Adam_1save_4/RestoreV2:44*)
_class
loc:@main/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬*
use_locking(*
validate_shape(
¼
save_4/Assign_45Assignmain/q1/dense_2/biassave_4/RestoreV2:45*'
_class
loc:@main/q1/dense_2/bias*
validate_shape(*
T0*
use_locking(*
_output_shapes
:
Á
save_4/Assign_46Assignmain/q1/dense_2/bias/Adamsave_4/RestoreV2:46*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
use_locking(*
validate_shape(*
T0
Ã
save_4/Assign_47Assignmain/q1/dense_2/bias/Adam_1save_4/RestoreV2:47*
T0*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
validate_shape(*
use_locking(
Å
save_4/Assign_48Assignmain/q1/dense_2/kernelsave_4/RestoreV2:48*
_output_shapes
:	¬*
use_locking(*
T0*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel
Ê
save_4/Assign_49Assignmain/q1/dense_2/kernel/Adamsave_4/RestoreV2:49*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel
Ì
save_4/Assign_50Assignmain/q1/dense_2/kernel/Adam_1save_4/RestoreV2:50*)
_class
loc:@main/q1/dense_2/kernel*
T0*
validate_shape(*
_output_shapes
:	¬*
use_locking(
¹
save_4/Assign_51Assignmain/q2/dense/biassave_4/RestoreV2:51*
T0*
validate_shape(*
use_locking(*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:
¾
save_4/Assign_52Assignmain/q2/dense/bias/Adamsave_4/RestoreV2:52*
use_locking(*
validate_shape(*
T0*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:
À
save_4/Assign_53Assignmain/q2/dense/bias/Adam_1save_4/RestoreV2:53*%
_class
loc:@main/q2/dense/bias*
validate_shape(*
use_locking(*
_output_shapes	
:*
T0
Á
save_4/Assign_54Assignmain/q2/dense/kernelsave_4/RestoreV2:54*
T0*
validate_shape(*
use_locking(*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel
Æ
save_4/Assign_55Assignmain/q2/dense/kernel/Adamsave_4/RestoreV2:55*
_output_shapes
:	B*
use_locking(*'
_class
loc:@main/q2/dense/kernel*
T0*
validate_shape(
È
save_4/Assign_56Assignmain/q2/dense/kernel/Adam_1save_4/RestoreV2:56*
T0*
_output_shapes
:	B*
validate_shape(*
use_locking(*'
_class
loc:@main/q2/dense/kernel
½
save_4/Assign_57Assignmain/q2/dense_1/biassave_4/RestoreV2:57*
use_locking(*'
_class
loc:@main/q2/dense_1/bias*
T0*
_output_shapes	
:¬*
validate_shape(
Â
save_4/Assign_58Assignmain/q2/dense_1/bias/Adamsave_4/RestoreV2:58*
use_locking(*
_output_shapes	
:¬*
T0*'
_class
loc:@main/q2/dense_1/bias*
validate_shape(
Ä
save_4/Assign_59Assignmain/q2/dense_1/bias/Adam_1save_4/RestoreV2:59*
_output_shapes	
:¬*
T0*
use_locking(*'
_class
loc:@main/q2/dense_1/bias*
validate_shape(
Æ
save_4/Assign_60Assignmain/q2/dense_1/kernelsave_4/RestoreV2:60*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
use_locking(*
validate_shape(
Ë
save_4/Assign_61Assignmain/q2/dense_1/kernel/Adamsave_4/RestoreV2:61* 
_output_shapes
:
¬*
T0*
use_locking(*
validate_shape(*)
_class
loc:@main/q2/dense_1/kernel
Í
save_4/Assign_62Assignmain/q2/dense_1/kernel/Adam_1save_4/RestoreV2:62* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*)
_class
loc:@main/q2/dense_1/kernel*
T0
¼
save_4/Assign_63Assignmain/q2/dense_2/biassave_4/RestoreV2:63*
T0*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
use_locking(*
validate_shape(
Á
save_4/Assign_64Assignmain/q2/dense_2/bias/Adamsave_4/RestoreV2:64*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*'
_class
loc:@main/q2/dense_2/bias
Ã
save_4/Assign_65Assignmain/q2/dense_2/bias/Adam_1save_4/RestoreV2:65*'
_class
loc:@main/q2/dense_2/bias*
validate_shape(*
T0*
_output_shapes
:*
use_locking(
Å
save_4/Assign_66Assignmain/q2/dense_2/kernelsave_4/RestoreV2:66*
validate_shape(*
_output_shapes
:	¬*
use_locking(*
T0*)
_class
loc:@main/q2/dense_2/kernel
Ê
save_4/Assign_67Assignmain/q2/dense_2/kernel/Adamsave_4/RestoreV2:67*
use_locking(*
_output_shapes
:	¬*
T0*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel
Ì
save_4/Assign_68Assignmain/q2/dense_2/kernel/Adam_1save_4/RestoreV2:68*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
use_locking(*
T0*
validate_shape(
·
save_4/Assign_69Assignmain/v/dense/biassave_4/RestoreV2:69*
T0*$
_class
loc:@main/v/dense/bias*
validate_shape(*
_output_shapes	
:*
use_locking(
¼
save_4/Assign_70Assignmain/v/dense/bias/Adamsave_4/RestoreV2:70*
T0*
validate_shape(*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
use_locking(
¾
save_4/Assign_71Assignmain/v/dense/bias/Adam_1save_4/RestoreV2:71*
validate_shape(*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:*
use_locking(*
T0
¿
save_4/Assign_72Assignmain/v/dense/kernelsave_4/RestoreV2:72*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
T0*
use_locking(
Ä
save_4/Assign_73Assignmain/v/dense/kernel/Adamsave_4/RestoreV2:73*
use_locking(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
validate_shape(*
T0
Æ
save_4/Assign_74Assignmain/v/dense/kernel/Adam_1save_4/RestoreV2:74*
use_locking(*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
T0
»
save_4/Assign_75Assignmain/v/dense_1/biassave_4/RestoreV2:75*
_output_shapes	
:¬*
T0*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
validate_shape(
À
save_4/Assign_76Assignmain/v/dense_1/bias/Adamsave_4/RestoreV2:76*
validate_shape(*
T0*
use_locking(*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias
Â
save_4/Assign_77Assignmain/v/dense_1/bias/Adam_1save_4/RestoreV2:77*
use_locking(*
validate_shape(*&
_class
loc:@main/v/dense_1/bias*
T0*
_output_shapes	
:¬
Ä
save_4/Assign_78Assignmain/v/dense_1/kernelsave_4/RestoreV2:78* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(*
use_locking(*
T0
É
save_4/Assign_79Assignmain/v/dense_1/kernel/Adamsave_4/RestoreV2:79* 
_output_shapes
:
¬*
use_locking(*(
_class
loc:@main/v/dense_1/kernel*
T0*
validate_shape(
Ë
save_4/Assign_80Assignmain/v/dense_1/kernel/Adam_1save_4/RestoreV2:80* 
_output_shapes
:
¬*
validate_shape(*(
_class
loc:@main/v/dense_1/kernel*
use_locking(*
T0
º
save_4/Assign_81Assignmain/v/dense_2/biassave_4/RestoreV2:81*
_output_shapes
:*
T0*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
validate_shape(
¿
save_4/Assign_82Assignmain/v/dense_2/bias/Adamsave_4/RestoreV2:82*
use_locking(*
T0*
validate_shape(*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:
Á
save_4/Assign_83Assignmain/v/dense_2/bias/Adam_1save_4/RestoreV2:83*
use_locking(*
validate_shape(*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
T0
Ã
save_4/Assign_84Assignmain/v/dense_2/kernelsave_4/RestoreV2:84*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel*
T0*
use_locking(*
_output_shapes
:	¬
È
save_4/Assign_85Assignmain/v/dense_2/kernel/Adamsave_4/RestoreV2:85*
validate_shape(*
T0*
_output_shapes
:	¬*
use_locking(*(
_class
loc:@main/v/dense_2/kernel
Ê
save_4/Assign_86Assignmain/v/dense_2/kernel/Adam_1save_4/RestoreV2:86*
use_locking(*
T0*
_output_shapes
:	¬*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel
½
save_4/Assign_87Assigntarget/pi/dense/biassave_4/RestoreV2:87*
use_locking(*
T0*'
_class
loc:@target/pi/dense/bias*
_output_shapes	
:*
validate_shape(
Å
save_4/Assign_88Assigntarget/pi/dense/kernelsave_4/RestoreV2:88*
T0*
use_locking(*)
_class
loc:@target/pi/dense/kernel*
validate_shape(*
_output_shapes
:	6
Á
save_4/Assign_89Assigntarget/pi/dense_1/biassave_4/RestoreV2:89*
T0*
_output_shapes	
:¬*
validate_shape(*)
_class
loc:@target/pi/dense_1/bias*
use_locking(
Ê
save_4/Assign_90Assigntarget/pi/dense_1/kernelsave_4/RestoreV2:90*+
_class!
loc:@target/pi/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*
T0
À
save_4/Assign_91Assigntarget/pi/dense_2/biassave_4/RestoreV2:91*
use_locking(*
_output_shapes
:*
validate_shape(*
T0*)
_class
loc:@target/pi/dense_2/bias
É
save_4/Assign_92Assigntarget/pi/dense_2/kernelsave_4/RestoreV2:92*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel*
use_locking(*
validate_shape(
À
save_4/Assign_93Assigntarget/pi/dense_3/biassave_4/RestoreV2:93*
validate_shape(*)
_class
loc:@target/pi/dense_3/bias*
use_locking(*
_output_shapes
:*
T0
É
save_4/Assign_94Assigntarget/pi/dense_3/kernelsave_4/RestoreV2:94*
validate_shape(*
use_locking(*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_3/kernel
½
save_4/Assign_95Assigntarget/q1/dense/biassave_4/RestoreV2:95*
validate_shape(*'
_class
loc:@target/q1/dense/bias*
use_locking(*
T0*
_output_shapes	
:
Å
save_4/Assign_96Assigntarget/q1/dense/kernelsave_4/RestoreV2:96*
T0*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:	B*
validate_shape(*
use_locking(
Á
save_4/Assign_97Assigntarget/q1/dense_1/biassave_4/RestoreV2:97*
T0*
_output_shapes	
:¬*)
_class
loc:@target/q1/dense_1/bias*
validate_shape(*
use_locking(
Ê
save_4/Assign_98Assigntarget/q1/dense_1/kernelsave_4/RestoreV2:98* 
_output_shapes
:
¬*
validate_shape(*+
_class!
loc:@target/q1/dense_1/kernel*
T0*
use_locking(
À
save_4/Assign_99Assigntarget/q1/dense_2/biassave_4/RestoreV2:99*
T0*
validate_shape(*)
_class
loc:@target/q1/dense_2/bias*
use_locking(*
_output_shapes
:
Ë
save_4/Assign_100Assigntarget/q1/dense_2/kernelsave_4/RestoreV2:100*+
_class!
loc:@target/q1/dense_2/kernel*
use_locking(*
validate_shape(*
_output_shapes
:	¬*
T0
¿
save_4/Assign_101Assigntarget/q2/dense/biassave_4/RestoreV2:101*
T0*
validate_shape(*'
_class
loc:@target/q2/dense/bias*
_output_shapes	
:*
use_locking(
Ç
save_4/Assign_102Assigntarget/q2/dense/kernelsave_4/RestoreV2:102*
validate_shape(*
_output_shapes
:	B*
T0*)
_class
loc:@target/q2/dense/kernel*
use_locking(
Ã
save_4/Assign_103Assigntarget/q2/dense_1/biassave_4/RestoreV2:103*
use_locking(*
_output_shapes	
:¬*
T0*)
_class
loc:@target/q2/dense_1/bias*
validate_shape(
Ì
save_4/Assign_104Assigntarget/q2/dense_1/kernelsave_4/RestoreV2:104*
T0* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*+
_class!
loc:@target/q2/dense_1/kernel
Â
save_4/Assign_105Assigntarget/q2/dense_2/biassave_4/RestoreV2:105*
use_locking(*)
_class
loc:@target/q2/dense_2/bias*
_output_shapes
:*
validate_shape(*
T0
Ë
save_4/Assign_106Assigntarget/q2/dense_2/kernelsave_4/RestoreV2:106*
validate_shape(*
use_locking(*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬*
T0
½
save_4/Assign_107Assigntarget/v/dense/biassave_4/RestoreV2:107*
T0*
validate_shape(*
_output_shapes	
:*&
_class
loc:@target/v/dense/bias*
use_locking(
Å
save_4/Assign_108Assigntarget/v/dense/kernelsave_4/RestoreV2:108*
validate_shape(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
T0*
use_locking(
Á
save_4/Assign_109Assigntarget/v/dense_1/biassave_4/RestoreV2:109*
T0*(
_class
loc:@target/v/dense_1/bias*
use_locking(*
_output_shapes	
:¬*
validate_shape(
Ê
save_4/Assign_110Assigntarget/v/dense_1/kernelsave_4/RestoreV2:110* 
_output_shapes
:
¬*
T0*
validate_shape(*
use_locking(**
_class 
loc:@target/v/dense_1/kernel
À
save_4/Assign_111Assigntarget/v/dense_2/biassave_4/RestoreV2:111*
use_locking(*
validate_shape(*
T0*(
_class
loc:@target/v/dense_2/bias*
_output_shapes
:
É
save_4/Assign_112Assigntarget/v/dense_2/kernelsave_4/RestoreV2:112*
use_locking(**
_class 
loc:@target/v/dense_2/kernel*
T0*
_output_shapes
:	¬*
validate_shape(

save_4/restore_shardNoOp^save_4/Assign^save_4/Assign_1^save_4/Assign_10^save_4/Assign_100^save_4/Assign_101^save_4/Assign_102^save_4/Assign_103^save_4/Assign_104^save_4/Assign_105^save_4/Assign_106^save_4/Assign_107^save_4/Assign_108^save_4/Assign_109^save_4/Assign_11^save_4/Assign_110^save_4/Assign_111^save_4/Assign_112^save_4/Assign_12^save_4/Assign_13^save_4/Assign_14^save_4/Assign_15^save_4/Assign_16^save_4/Assign_17^save_4/Assign_18^save_4/Assign_19^save_4/Assign_2^save_4/Assign_20^save_4/Assign_21^save_4/Assign_22^save_4/Assign_23^save_4/Assign_24^save_4/Assign_25^save_4/Assign_26^save_4/Assign_27^save_4/Assign_28^save_4/Assign_29^save_4/Assign_3^save_4/Assign_30^save_4/Assign_31^save_4/Assign_32^save_4/Assign_33^save_4/Assign_34^save_4/Assign_35^save_4/Assign_36^save_4/Assign_37^save_4/Assign_38^save_4/Assign_39^save_4/Assign_4^save_4/Assign_40^save_4/Assign_41^save_4/Assign_42^save_4/Assign_43^save_4/Assign_44^save_4/Assign_45^save_4/Assign_46^save_4/Assign_47^save_4/Assign_48^save_4/Assign_49^save_4/Assign_5^save_4/Assign_50^save_4/Assign_51^save_4/Assign_52^save_4/Assign_53^save_4/Assign_54^save_4/Assign_55^save_4/Assign_56^save_4/Assign_57^save_4/Assign_58^save_4/Assign_59^save_4/Assign_6^save_4/Assign_60^save_4/Assign_61^save_4/Assign_62^save_4/Assign_63^save_4/Assign_64^save_4/Assign_65^save_4/Assign_66^save_4/Assign_67^save_4/Assign_68^save_4/Assign_69^save_4/Assign_7^save_4/Assign_70^save_4/Assign_71^save_4/Assign_72^save_4/Assign_73^save_4/Assign_74^save_4/Assign_75^save_4/Assign_76^save_4/Assign_77^save_4/Assign_78^save_4/Assign_79^save_4/Assign_8^save_4/Assign_80^save_4/Assign_81^save_4/Assign_82^save_4/Assign_83^save_4/Assign_84^save_4/Assign_85^save_4/Assign_86^save_4/Assign_87^save_4/Assign_88^save_4/Assign_89^save_4/Assign_9^save_4/Assign_90^save_4/Assign_91^save_4/Assign_92^save_4/Assign_93^save_4/Assign_94^save_4/Assign_95^save_4/Assign_96^save_4/Assign_97^save_4/Assign_98^save_4/Assign_99
1
save_4/restore_allNoOp^save_4/restore_shard "B
save_4/Const:0save_4/Identity:0save_4/restore_all (5 @F8"À{
	variables²{¯{
D

Variable:0Variable/AssignVariable/read:02truncated_normal:08
L
Variable_1:0Variable_1/AssignVariable_1/read:02truncated_normal_1:08
L
Variable_2:0Variable_2/AssignVariable_2/read:02truncated_normal_2:08
L
Variable_3:0Variable_3/AssignVariable_3/read:02truncated_normal_3:08
L
Variable_4:0Variable_4/AssignVariable_4/read:02truncated_normal_4:08

main/pi/dense/kernel:0main/pi/dense/kernel/Assignmain/pi/dense/kernel/read:021main/pi/dense/kernel/Initializer/random_uniform:08
v
main/pi/dense/bias:0main/pi/dense/bias/Assignmain/pi/dense/bias/read:02&main/pi/dense/bias/Initializer/zeros:08

main/pi/dense_1/kernel:0main/pi/dense_1/kernel/Assignmain/pi/dense_1/kernel/read:023main/pi/dense_1/kernel/Initializer/random_uniform:08
~
main/pi/dense_1/bias:0main/pi/dense_1/bias/Assignmain/pi/dense_1/bias/read:02(main/pi/dense_1/bias/Initializer/zeros:08

main/pi/dense_2/kernel:0main/pi/dense_2/kernel/Assignmain/pi/dense_2/kernel/read:023main/pi/dense_2/kernel/Initializer/random_uniform:08
~
main/pi/dense_2/bias:0main/pi/dense_2/bias/Assignmain/pi/dense_2/bias/read:02(main/pi/dense_2/bias/Initializer/zeros:08

main/pi/dense_3/kernel:0main/pi/dense_3/kernel/Assignmain/pi/dense_3/kernel/read:023main/pi/dense_3/kernel/Initializer/random_uniform:08
~
main/pi/dense_3/bias:0main/pi/dense_3/bias/Assignmain/pi/dense_3/bias/read:02(main/pi/dense_3/bias/Initializer/zeros:08

main/q1/dense/kernel:0main/q1/dense/kernel/Assignmain/q1/dense/kernel/read:021main/q1/dense/kernel/Initializer/random_uniform:08
v
main/q1/dense/bias:0main/q1/dense/bias/Assignmain/q1/dense/bias/read:02&main/q1/dense/bias/Initializer/zeros:08

main/q1/dense_1/kernel:0main/q1/dense_1/kernel/Assignmain/q1/dense_1/kernel/read:023main/q1/dense_1/kernel/Initializer/random_uniform:08
~
main/q1/dense_1/bias:0main/q1/dense_1/bias/Assignmain/q1/dense_1/bias/read:02(main/q1/dense_1/bias/Initializer/zeros:08

main/q1/dense_2/kernel:0main/q1/dense_2/kernel/Assignmain/q1/dense_2/kernel/read:023main/q1/dense_2/kernel/Initializer/random_uniform:08
~
main/q1/dense_2/bias:0main/q1/dense_2/bias/Assignmain/q1/dense_2/bias/read:02(main/q1/dense_2/bias/Initializer/zeros:08

main/q2/dense/kernel:0main/q2/dense/kernel/Assignmain/q2/dense/kernel/read:021main/q2/dense/kernel/Initializer/random_uniform:08
v
main/q2/dense/bias:0main/q2/dense/bias/Assignmain/q2/dense/bias/read:02&main/q2/dense/bias/Initializer/zeros:08

main/q2/dense_1/kernel:0main/q2/dense_1/kernel/Assignmain/q2/dense_1/kernel/read:023main/q2/dense_1/kernel/Initializer/random_uniform:08
~
main/q2/dense_1/bias:0main/q2/dense_1/bias/Assignmain/q2/dense_1/bias/read:02(main/q2/dense_1/bias/Initializer/zeros:08

main/q2/dense_2/kernel:0main/q2/dense_2/kernel/Assignmain/q2/dense_2/kernel/read:023main/q2/dense_2/kernel/Initializer/random_uniform:08
~
main/q2/dense_2/bias:0main/q2/dense_2/bias/Assignmain/q2/dense_2/bias/read:02(main/q2/dense_2/bias/Initializer/zeros:08

main/v/dense/kernel:0main/v/dense/kernel/Assignmain/v/dense/kernel/read:020main/v/dense/kernel/Initializer/random_uniform:08
r
main/v/dense/bias:0main/v/dense/bias/Assignmain/v/dense/bias/read:02%main/v/dense/bias/Initializer/zeros:08

main/v/dense_1/kernel:0main/v/dense_1/kernel/Assignmain/v/dense_1/kernel/read:022main/v/dense_1/kernel/Initializer/random_uniform:08
z
main/v/dense_1/bias:0main/v/dense_1/bias/Assignmain/v/dense_1/bias/read:02'main/v/dense_1/bias/Initializer/zeros:08

main/v/dense_2/kernel:0main/v/dense_2/kernel/Assignmain/v/dense_2/kernel/read:022main/v/dense_2/kernel/Initializer/random_uniform:08
z
main/v/dense_2/bias:0main/v/dense_2/bias/Assignmain/v/dense_2/bias/read:02'main/v/dense_2/bias/Initializer/zeros:08

target/pi/dense/kernel:0target/pi/dense/kernel/Assigntarget/pi/dense/kernel/read:023target/pi/dense/kernel/Initializer/random_uniform:08
~
target/pi/dense/bias:0target/pi/dense/bias/Assigntarget/pi/dense/bias/read:02(target/pi/dense/bias/Initializer/zeros:08

target/pi/dense_1/kernel:0target/pi/dense_1/kernel/Assigntarget/pi/dense_1/kernel/read:025target/pi/dense_1/kernel/Initializer/random_uniform:08

target/pi/dense_1/bias:0target/pi/dense_1/bias/Assigntarget/pi/dense_1/bias/read:02*target/pi/dense_1/bias/Initializer/zeros:08

target/pi/dense_2/kernel:0target/pi/dense_2/kernel/Assigntarget/pi/dense_2/kernel/read:025target/pi/dense_2/kernel/Initializer/random_uniform:08

target/pi/dense_2/bias:0target/pi/dense_2/bias/Assigntarget/pi/dense_2/bias/read:02*target/pi/dense_2/bias/Initializer/zeros:08

target/pi/dense_3/kernel:0target/pi/dense_3/kernel/Assigntarget/pi/dense_3/kernel/read:025target/pi/dense_3/kernel/Initializer/random_uniform:08

target/pi/dense_3/bias:0target/pi/dense_3/bias/Assigntarget/pi/dense_3/bias/read:02*target/pi/dense_3/bias/Initializer/zeros:08

target/q1/dense/kernel:0target/q1/dense/kernel/Assigntarget/q1/dense/kernel/read:023target/q1/dense/kernel/Initializer/random_uniform:08
~
target/q1/dense/bias:0target/q1/dense/bias/Assigntarget/q1/dense/bias/read:02(target/q1/dense/bias/Initializer/zeros:08

target/q1/dense_1/kernel:0target/q1/dense_1/kernel/Assigntarget/q1/dense_1/kernel/read:025target/q1/dense_1/kernel/Initializer/random_uniform:08

target/q1/dense_1/bias:0target/q1/dense_1/bias/Assigntarget/q1/dense_1/bias/read:02*target/q1/dense_1/bias/Initializer/zeros:08

target/q1/dense_2/kernel:0target/q1/dense_2/kernel/Assigntarget/q1/dense_2/kernel/read:025target/q1/dense_2/kernel/Initializer/random_uniform:08

target/q1/dense_2/bias:0target/q1/dense_2/bias/Assigntarget/q1/dense_2/bias/read:02*target/q1/dense_2/bias/Initializer/zeros:08

target/q2/dense/kernel:0target/q2/dense/kernel/Assigntarget/q2/dense/kernel/read:023target/q2/dense/kernel/Initializer/random_uniform:08
~
target/q2/dense/bias:0target/q2/dense/bias/Assigntarget/q2/dense/bias/read:02(target/q2/dense/bias/Initializer/zeros:08

target/q2/dense_1/kernel:0target/q2/dense_1/kernel/Assigntarget/q2/dense_1/kernel/read:025target/q2/dense_1/kernel/Initializer/random_uniform:08

target/q2/dense_1/bias:0target/q2/dense_1/bias/Assigntarget/q2/dense_1/bias/read:02*target/q2/dense_1/bias/Initializer/zeros:08

target/q2/dense_2/kernel:0target/q2/dense_2/kernel/Assigntarget/q2/dense_2/kernel/read:025target/q2/dense_2/kernel/Initializer/random_uniform:08

target/q2/dense_2/bias:0target/q2/dense_2/bias/Assigntarget/q2/dense_2/bias/read:02*target/q2/dense_2/bias/Initializer/zeros:08

target/v/dense/kernel:0target/v/dense/kernel/Assigntarget/v/dense/kernel/read:022target/v/dense/kernel/Initializer/random_uniform:08
z
target/v/dense/bias:0target/v/dense/bias/Assigntarget/v/dense/bias/read:02'target/v/dense/bias/Initializer/zeros:08

target/v/dense_1/kernel:0target/v/dense_1/kernel/Assigntarget/v/dense_1/kernel/read:024target/v/dense_1/kernel/Initializer/random_uniform:08

target/v/dense_1/bias:0target/v/dense_1/bias/Assigntarget/v/dense_1/bias/read:02)target/v/dense_1/bias/Initializer/zeros:08

target/v/dense_2/kernel:0target/v/dense_2/kernel/Assigntarget/v/dense_2/kernel/read:024target/v/dense_2/kernel/Initializer/random_uniform:08

target/v/dense_2/bias:0target/v/dense_2/bias/Assigntarget/v/dense_2/bias/read:02)target/v/dense_2/bias/Initializer/zeros:08
T
beta1_power:0beta1_power/Assignbeta1_power/read:02beta1_power/initial_value:0
T
beta2_power:0beta2_power/Assignbeta2_power/read:02beta2_power/initial_value:0

main/pi/dense/kernel/Adam:0 main/pi/dense/kernel/Adam/Assign main/pi/dense/kernel/Adam/read:02-main/pi/dense/kernel/Adam/Initializer/zeros:0

main/pi/dense/kernel/Adam_1:0"main/pi/dense/kernel/Adam_1/Assign"main/pi/dense/kernel/Adam_1/read:02/main/pi/dense/kernel/Adam_1/Initializer/zeros:0

main/pi/dense/bias/Adam:0main/pi/dense/bias/Adam/Assignmain/pi/dense/bias/Adam/read:02+main/pi/dense/bias/Adam/Initializer/zeros:0

main/pi/dense/bias/Adam_1:0 main/pi/dense/bias/Adam_1/Assign main/pi/dense/bias/Adam_1/read:02-main/pi/dense/bias/Adam_1/Initializer/zeros:0

main/pi/dense_1/kernel/Adam:0"main/pi/dense_1/kernel/Adam/Assign"main/pi/dense_1/kernel/Adam/read:02/main/pi/dense_1/kernel/Adam/Initializer/zeros:0
 
main/pi/dense_1/kernel/Adam_1:0$main/pi/dense_1/kernel/Adam_1/Assign$main/pi/dense_1/kernel/Adam_1/read:021main/pi/dense_1/kernel/Adam_1/Initializer/zeros:0

main/pi/dense_1/bias/Adam:0 main/pi/dense_1/bias/Adam/Assign main/pi/dense_1/bias/Adam/read:02-main/pi/dense_1/bias/Adam/Initializer/zeros:0

main/pi/dense_1/bias/Adam_1:0"main/pi/dense_1/bias/Adam_1/Assign"main/pi/dense_1/bias/Adam_1/read:02/main/pi/dense_1/bias/Adam_1/Initializer/zeros:0

main/pi/dense_2/kernel/Adam:0"main/pi/dense_2/kernel/Adam/Assign"main/pi/dense_2/kernel/Adam/read:02/main/pi/dense_2/kernel/Adam/Initializer/zeros:0
 
main/pi/dense_2/kernel/Adam_1:0$main/pi/dense_2/kernel/Adam_1/Assign$main/pi/dense_2/kernel/Adam_1/read:021main/pi/dense_2/kernel/Adam_1/Initializer/zeros:0

main/pi/dense_2/bias/Adam:0 main/pi/dense_2/bias/Adam/Assign main/pi/dense_2/bias/Adam/read:02-main/pi/dense_2/bias/Adam/Initializer/zeros:0

main/pi/dense_2/bias/Adam_1:0"main/pi/dense_2/bias/Adam_1/Assign"main/pi/dense_2/bias/Adam_1/read:02/main/pi/dense_2/bias/Adam_1/Initializer/zeros:0

main/pi/dense_3/kernel/Adam:0"main/pi/dense_3/kernel/Adam/Assign"main/pi/dense_3/kernel/Adam/read:02/main/pi/dense_3/kernel/Adam/Initializer/zeros:0
 
main/pi/dense_3/kernel/Adam_1:0$main/pi/dense_3/kernel/Adam_1/Assign$main/pi/dense_3/kernel/Adam_1/read:021main/pi/dense_3/kernel/Adam_1/Initializer/zeros:0

main/pi/dense_3/bias/Adam:0 main/pi/dense_3/bias/Adam/Assign main/pi/dense_3/bias/Adam/read:02-main/pi/dense_3/bias/Adam/Initializer/zeros:0

main/pi/dense_3/bias/Adam_1:0"main/pi/dense_3/bias/Adam_1/Assign"main/pi/dense_3/bias/Adam_1/read:02/main/pi/dense_3/bias/Adam_1/Initializer/zeros:0
\
beta1_power_1:0beta1_power_1/Assignbeta1_power_1/read:02beta1_power_1/initial_value:0
\
beta2_power_1:0beta2_power_1/Assignbeta2_power_1/read:02beta2_power_1/initial_value:0

main/q1/dense/kernel/Adam:0 main/q1/dense/kernel/Adam/Assign main/q1/dense/kernel/Adam/read:02-main/q1/dense/kernel/Adam/Initializer/zeros:0

main/q1/dense/kernel/Adam_1:0"main/q1/dense/kernel/Adam_1/Assign"main/q1/dense/kernel/Adam_1/read:02/main/q1/dense/kernel/Adam_1/Initializer/zeros:0

main/q1/dense/bias/Adam:0main/q1/dense/bias/Adam/Assignmain/q1/dense/bias/Adam/read:02+main/q1/dense/bias/Adam/Initializer/zeros:0

main/q1/dense/bias/Adam_1:0 main/q1/dense/bias/Adam_1/Assign main/q1/dense/bias/Adam_1/read:02-main/q1/dense/bias/Adam_1/Initializer/zeros:0

main/q1/dense_1/kernel/Adam:0"main/q1/dense_1/kernel/Adam/Assign"main/q1/dense_1/kernel/Adam/read:02/main/q1/dense_1/kernel/Adam/Initializer/zeros:0
 
main/q1/dense_1/kernel/Adam_1:0$main/q1/dense_1/kernel/Adam_1/Assign$main/q1/dense_1/kernel/Adam_1/read:021main/q1/dense_1/kernel/Adam_1/Initializer/zeros:0

main/q1/dense_1/bias/Adam:0 main/q1/dense_1/bias/Adam/Assign main/q1/dense_1/bias/Adam/read:02-main/q1/dense_1/bias/Adam/Initializer/zeros:0

main/q1/dense_1/bias/Adam_1:0"main/q1/dense_1/bias/Adam_1/Assign"main/q1/dense_1/bias/Adam_1/read:02/main/q1/dense_1/bias/Adam_1/Initializer/zeros:0

main/q1/dense_2/kernel/Adam:0"main/q1/dense_2/kernel/Adam/Assign"main/q1/dense_2/kernel/Adam/read:02/main/q1/dense_2/kernel/Adam/Initializer/zeros:0
 
main/q1/dense_2/kernel/Adam_1:0$main/q1/dense_2/kernel/Adam_1/Assign$main/q1/dense_2/kernel/Adam_1/read:021main/q1/dense_2/kernel/Adam_1/Initializer/zeros:0

main/q1/dense_2/bias/Adam:0 main/q1/dense_2/bias/Adam/Assign main/q1/dense_2/bias/Adam/read:02-main/q1/dense_2/bias/Adam/Initializer/zeros:0

main/q1/dense_2/bias/Adam_1:0"main/q1/dense_2/bias/Adam_1/Assign"main/q1/dense_2/bias/Adam_1/read:02/main/q1/dense_2/bias/Adam_1/Initializer/zeros:0

main/q2/dense/kernel/Adam:0 main/q2/dense/kernel/Adam/Assign main/q2/dense/kernel/Adam/read:02-main/q2/dense/kernel/Adam/Initializer/zeros:0

main/q2/dense/kernel/Adam_1:0"main/q2/dense/kernel/Adam_1/Assign"main/q2/dense/kernel/Adam_1/read:02/main/q2/dense/kernel/Adam_1/Initializer/zeros:0

main/q2/dense/bias/Adam:0main/q2/dense/bias/Adam/Assignmain/q2/dense/bias/Adam/read:02+main/q2/dense/bias/Adam/Initializer/zeros:0

main/q2/dense/bias/Adam_1:0 main/q2/dense/bias/Adam_1/Assign main/q2/dense/bias/Adam_1/read:02-main/q2/dense/bias/Adam_1/Initializer/zeros:0

main/q2/dense_1/kernel/Adam:0"main/q2/dense_1/kernel/Adam/Assign"main/q2/dense_1/kernel/Adam/read:02/main/q2/dense_1/kernel/Adam/Initializer/zeros:0
 
main/q2/dense_1/kernel/Adam_1:0$main/q2/dense_1/kernel/Adam_1/Assign$main/q2/dense_1/kernel/Adam_1/read:021main/q2/dense_1/kernel/Adam_1/Initializer/zeros:0

main/q2/dense_1/bias/Adam:0 main/q2/dense_1/bias/Adam/Assign main/q2/dense_1/bias/Adam/read:02-main/q2/dense_1/bias/Adam/Initializer/zeros:0

main/q2/dense_1/bias/Adam_1:0"main/q2/dense_1/bias/Adam_1/Assign"main/q2/dense_1/bias/Adam_1/read:02/main/q2/dense_1/bias/Adam_1/Initializer/zeros:0

main/q2/dense_2/kernel/Adam:0"main/q2/dense_2/kernel/Adam/Assign"main/q2/dense_2/kernel/Adam/read:02/main/q2/dense_2/kernel/Adam/Initializer/zeros:0
 
main/q2/dense_2/kernel/Adam_1:0$main/q2/dense_2/kernel/Adam_1/Assign$main/q2/dense_2/kernel/Adam_1/read:021main/q2/dense_2/kernel/Adam_1/Initializer/zeros:0

main/q2/dense_2/bias/Adam:0 main/q2/dense_2/bias/Adam/Assign main/q2/dense_2/bias/Adam/read:02-main/q2/dense_2/bias/Adam/Initializer/zeros:0

main/q2/dense_2/bias/Adam_1:0"main/q2/dense_2/bias/Adam_1/Assign"main/q2/dense_2/bias/Adam_1/read:02/main/q2/dense_2/bias/Adam_1/Initializer/zeros:0

main/v/dense/kernel/Adam:0main/v/dense/kernel/Adam/Assignmain/v/dense/kernel/Adam/read:02,main/v/dense/kernel/Adam/Initializer/zeros:0

main/v/dense/kernel/Adam_1:0!main/v/dense/kernel/Adam_1/Assign!main/v/dense/kernel/Adam_1/read:02.main/v/dense/kernel/Adam_1/Initializer/zeros:0

main/v/dense/bias/Adam:0main/v/dense/bias/Adam/Assignmain/v/dense/bias/Adam/read:02*main/v/dense/bias/Adam/Initializer/zeros:0

main/v/dense/bias/Adam_1:0main/v/dense/bias/Adam_1/Assignmain/v/dense/bias/Adam_1/read:02,main/v/dense/bias/Adam_1/Initializer/zeros:0

main/v/dense_1/kernel/Adam:0!main/v/dense_1/kernel/Adam/Assign!main/v/dense_1/kernel/Adam/read:02.main/v/dense_1/kernel/Adam/Initializer/zeros:0

main/v/dense_1/kernel/Adam_1:0#main/v/dense_1/kernel/Adam_1/Assign#main/v/dense_1/kernel/Adam_1/read:020main/v/dense_1/kernel/Adam_1/Initializer/zeros:0

main/v/dense_1/bias/Adam:0main/v/dense_1/bias/Adam/Assignmain/v/dense_1/bias/Adam/read:02,main/v/dense_1/bias/Adam/Initializer/zeros:0

main/v/dense_1/bias/Adam_1:0!main/v/dense_1/bias/Adam_1/Assign!main/v/dense_1/bias/Adam_1/read:02.main/v/dense_1/bias/Adam_1/Initializer/zeros:0

main/v/dense_2/kernel/Adam:0!main/v/dense_2/kernel/Adam/Assign!main/v/dense_2/kernel/Adam/read:02.main/v/dense_2/kernel/Adam/Initializer/zeros:0

main/v/dense_2/kernel/Adam_1:0#main/v/dense_2/kernel/Adam_1/Assign#main/v/dense_2/kernel/Adam_1/read:020main/v/dense_2/kernel/Adam_1/Initializer/zeros:0

main/v/dense_2/bias/Adam:0main/v/dense_2/bias/Adam/Assignmain/v/dense_2/bias/Adam/read:02,main/v/dense_2/bias/Adam/Initializer/zeros:0

main/v/dense_2/bias/Adam_1:0!main/v/dense_2/bias/Adam_1/Assign!main/v/dense_2/bias/Adam_1/read:02.main/v/dense_2/bias/Adam_1/Initializer/zeros:0"
train_op

Adam
Adam_1";
trainable_variablesş:û:
D

Variable:0Variable/AssignVariable/read:02truncated_normal:08
L
Variable_1:0Variable_1/AssignVariable_1/read:02truncated_normal_1:08
L
Variable_2:0Variable_2/AssignVariable_2/read:02truncated_normal_2:08
L
Variable_3:0Variable_3/AssignVariable_3/read:02truncated_normal_3:08
L
Variable_4:0Variable_4/AssignVariable_4/read:02truncated_normal_4:08

main/pi/dense/kernel:0main/pi/dense/kernel/Assignmain/pi/dense/kernel/read:021main/pi/dense/kernel/Initializer/random_uniform:08
v
main/pi/dense/bias:0main/pi/dense/bias/Assignmain/pi/dense/bias/read:02&main/pi/dense/bias/Initializer/zeros:08

main/pi/dense_1/kernel:0main/pi/dense_1/kernel/Assignmain/pi/dense_1/kernel/read:023main/pi/dense_1/kernel/Initializer/random_uniform:08
~
main/pi/dense_1/bias:0main/pi/dense_1/bias/Assignmain/pi/dense_1/bias/read:02(main/pi/dense_1/bias/Initializer/zeros:08

main/pi/dense_2/kernel:0main/pi/dense_2/kernel/Assignmain/pi/dense_2/kernel/read:023main/pi/dense_2/kernel/Initializer/random_uniform:08
~
main/pi/dense_2/bias:0main/pi/dense_2/bias/Assignmain/pi/dense_2/bias/read:02(main/pi/dense_2/bias/Initializer/zeros:08

main/pi/dense_3/kernel:0main/pi/dense_3/kernel/Assignmain/pi/dense_3/kernel/read:023main/pi/dense_3/kernel/Initializer/random_uniform:08
~
main/pi/dense_3/bias:0main/pi/dense_3/bias/Assignmain/pi/dense_3/bias/read:02(main/pi/dense_3/bias/Initializer/zeros:08

main/q1/dense/kernel:0main/q1/dense/kernel/Assignmain/q1/dense/kernel/read:021main/q1/dense/kernel/Initializer/random_uniform:08
v
main/q1/dense/bias:0main/q1/dense/bias/Assignmain/q1/dense/bias/read:02&main/q1/dense/bias/Initializer/zeros:08

main/q1/dense_1/kernel:0main/q1/dense_1/kernel/Assignmain/q1/dense_1/kernel/read:023main/q1/dense_1/kernel/Initializer/random_uniform:08
~
main/q1/dense_1/bias:0main/q1/dense_1/bias/Assignmain/q1/dense_1/bias/read:02(main/q1/dense_1/bias/Initializer/zeros:08

main/q1/dense_2/kernel:0main/q1/dense_2/kernel/Assignmain/q1/dense_2/kernel/read:023main/q1/dense_2/kernel/Initializer/random_uniform:08
~
main/q1/dense_2/bias:0main/q1/dense_2/bias/Assignmain/q1/dense_2/bias/read:02(main/q1/dense_2/bias/Initializer/zeros:08

main/q2/dense/kernel:0main/q2/dense/kernel/Assignmain/q2/dense/kernel/read:021main/q2/dense/kernel/Initializer/random_uniform:08
v
main/q2/dense/bias:0main/q2/dense/bias/Assignmain/q2/dense/bias/read:02&main/q2/dense/bias/Initializer/zeros:08

main/q2/dense_1/kernel:0main/q2/dense_1/kernel/Assignmain/q2/dense_1/kernel/read:023main/q2/dense_1/kernel/Initializer/random_uniform:08
~
main/q2/dense_1/bias:0main/q2/dense_1/bias/Assignmain/q2/dense_1/bias/read:02(main/q2/dense_1/bias/Initializer/zeros:08

main/q2/dense_2/kernel:0main/q2/dense_2/kernel/Assignmain/q2/dense_2/kernel/read:023main/q2/dense_2/kernel/Initializer/random_uniform:08
~
main/q2/dense_2/bias:0main/q2/dense_2/bias/Assignmain/q2/dense_2/bias/read:02(main/q2/dense_2/bias/Initializer/zeros:08

main/v/dense/kernel:0main/v/dense/kernel/Assignmain/v/dense/kernel/read:020main/v/dense/kernel/Initializer/random_uniform:08
r
main/v/dense/bias:0main/v/dense/bias/Assignmain/v/dense/bias/read:02%main/v/dense/bias/Initializer/zeros:08

main/v/dense_1/kernel:0main/v/dense_1/kernel/Assignmain/v/dense_1/kernel/read:022main/v/dense_1/kernel/Initializer/random_uniform:08
z
main/v/dense_1/bias:0main/v/dense_1/bias/Assignmain/v/dense_1/bias/read:02'main/v/dense_1/bias/Initializer/zeros:08

main/v/dense_2/kernel:0main/v/dense_2/kernel/Assignmain/v/dense_2/kernel/read:022main/v/dense_2/kernel/Initializer/random_uniform:08
z
main/v/dense_2/bias:0main/v/dense_2/bias/Assignmain/v/dense_2/bias/read:02'main/v/dense_2/bias/Initializer/zeros:08

target/pi/dense/kernel:0target/pi/dense/kernel/Assigntarget/pi/dense/kernel/read:023target/pi/dense/kernel/Initializer/random_uniform:08
~
target/pi/dense/bias:0target/pi/dense/bias/Assigntarget/pi/dense/bias/read:02(target/pi/dense/bias/Initializer/zeros:08

target/pi/dense_1/kernel:0target/pi/dense_1/kernel/Assigntarget/pi/dense_1/kernel/read:025target/pi/dense_1/kernel/Initializer/random_uniform:08

target/pi/dense_1/bias:0target/pi/dense_1/bias/Assigntarget/pi/dense_1/bias/read:02*target/pi/dense_1/bias/Initializer/zeros:08

target/pi/dense_2/kernel:0target/pi/dense_2/kernel/Assigntarget/pi/dense_2/kernel/read:025target/pi/dense_2/kernel/Initializer/random_uniform:08

target/pi/dense_2/bias:0target/pi/dense_2/bias/Assigntarget/pi/dense_2/bias/read:02*target/pi/dense_2/bias/Initializer/zeros:08

target/pi/dense_3/kernel:0target/pi/dense_3/kernel/Assigntarget/pi/dense_3/kernel/read:025target/pi/dense_3/kernel/Initializer/random_uniform:08

target/pi/dense_3/bias:0target/pi/dense_3/bias/Assigntarget/pi/dense_3/bias/read:02*target/pi/dense_3/bias/Initializer/zeros:08

target/q1/dense/kernel:0target/q1/dense/kernel/Assigntarget/q1/dense/kernel/read:023target/q1/dense/kernel/Initializer/random_uniform:08
~
target/q1/dense/bias:0target/q1/dense/bias/Assigntarget/q1/dense/bias/read:02(target/q1/dense/bias/Initializer/zeros:08

target/q1/dense_1/kernel:0target/q1/dense_1/kernel/Assigntarget/q1/dense_1/kernel/read:025target/q1/dense_1/kernel/Initializer/random_uniform:08

target/q1/dense_1/bias:0target/q1/dense_1/bias/Assigntarget/q1/dense_1/bias/read:02*target/q1/dense_1/bias/Initializer/zeros:08

target/q1/dense_2/kernel:0target/q1/dense_2/kernel/Assigntarget/q1/dense_2/kernel/read:025target/q1/dense_2/kernel/Initializer/random_uniform:08

target/q1/dense_2/bias:0target/q1/dense_2/bias/Assigntarget/q1/dense_2/bias/read:02*target/q1/dense_2/bias/Initializer/zeros:08

target/q2/dense/kernel:0target/q2/dense/kernel/Assigntarget/q2/dense/kernel/read:023target/q2/dense/kernel/Initializer/random_uniform:08
~
target/q2/dense/bias:0target/q2/dense/bias/Assigntarget/q2/dense/bias/read:02(target/q2/dense/bias/Initializer/zeros:08

target/q2/dense_1/kernel:0target/q2/dense_1/kernel/Assigntarget/q2/dense_1/kernel/read:025target/q2/dense_1/kernel/Initializer/random_uniform:08

target/q2/dense_1/bias:0target/q2/dense_1/bias/Assigntarget/q2/dense_1/bias/read:02*target/q2/dense_1/bias/Initializer/zeros:08

target/q2/dense_2/kernel:0target/q2/dense_2/kernel/Assigntarget/q2/dense_2/kernel/read:025target/q2/dense_2/kernel/Initializer/random_uniform:08

target/q2/dense_2/bias:0target/q2/dense_2/bias/Assigntarget/q2/dense_2/bias/read:02*target/q2/dense_2/bias/Initializer/zeros:08

target/v/dense/kernel:0target/v/dense/kernel/Assigntarget/v/dense/kernel/read:022target/v/dense/kernel/Initializer/random_uniform:08
z
target/v/dense/bias:0target/v/dense/bias/Assigntarget/v/dense/bias/read:02'target/v/dense/bias/Initializer/zeros:08

target/v/dense_1/kernel:0target/v/dense_1/kernel/Assigntarget/v/dense_1/kernel/read:024target/v/dense_1/kernel/Initializer/random_uniform:08

target/v/dense_1/bias:0target/v/dense_1/bias/Assigntarget/v/dense_1/bias/read:02)target/v/dense_1/bias/Initializer/zeros:08

target/v/dense_2/kernel:0target/v/dense_2/kernel/Assigntarget/v/dense_2/kernel/read:024target/v/dense_2/kernel/Initializer/random_uniform:08

target/v/dense_2/bias:0target/v/dense_2/bias/Assigntarget/v/dense_2/bias/read:02)target/v/dense_2/bias/Initializer/zeros:08*à
serving_defaultÌ
+
x&
Placeholder_1:0ÿÿÿÿÿÿÿÿÿ6
+
a&
Placeholder_2:0ÿÿÿÿÿÿÿÿÿ'
mu!

main/mul:0ÿÿÿÿÿÿÿÿÿ(
v#
main/v/Squeeze:0ÿÿÿÿÿÿÿÿÿ*
q1$
main/q1/Squeeze:0ÿÿÿÿÿÿÿÿÿ)
pi#
main/mul_1:0ÿÿÿÿÿÿÿÿÿ*
q2$
main/q2/Squeeze:0ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict
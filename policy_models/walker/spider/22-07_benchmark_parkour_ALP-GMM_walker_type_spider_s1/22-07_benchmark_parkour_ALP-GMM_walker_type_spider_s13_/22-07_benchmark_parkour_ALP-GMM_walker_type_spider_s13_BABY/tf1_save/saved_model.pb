άΚ
υ(Ξ(
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
ξ
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
Ttype"serve*1.15.52v1.15.4-39-g3db52beΏη
^
PlaceholderPlaceholder*
dtype0*
shape:	Θ*
_output_shapes
:	Θ
g
truncated_normal/shapeConst*
valueB"   @   *
_output_shapes
:*
dtype0
Z
truncated_normal/meanConst*
valueB
 *    *
_output_shapes
: *
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
seed2 *
T0*
_output_shapes

:@*

seed *
dtype0
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
shared_name *
dtype0*
shape
:@*
	container 
€
Variable/AssignAssignVariabletruncated_normal*
T0*
validate_shape(*
_class
loc:@Variable*
_output_shapes

:@*
use_locking(
i
Variable/readIdentityVariable*
T0*
_output_shapes

:@*
_class
loc:@Variable
|
MatMulMatMulPlaceholderVariable/read*
T0*
_output_shapes
:	Θ@*
transpose_a( *
transpose_b( 
>
TanhTanhMatMul*
T0*
_output_shapes
:	Θ@
i
truncated_normal_1/shapeConst*
valueB"@   @   *
_output_shapes
:*
dtype0
\
truncated_normal_1/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_1/stddevConst*
_output_shapes
: *
valueB
 *   @*
dtype0

"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
seed2 *
_output_shapes

:@@*
dtype0*

seed *
T0

truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
T0*
_output_shapes

:@@
s
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*
_output_shapes

:@@
~

Variable_1
VariableV2*
shape
:@@*
dtype0*
shared_name *
_output_shapes

:@@*
	container 
¬
Variable_1/AssignAssign
Variable_1truncated_normal_1*
use_locking(*
T0*
_class
loc:@Variable_1*
_output_shapes

:@@*
validate_shape(
o
Variable_1/readIdentity
Variable_1*
_output_shapes

:@@*
T0*
_class
loc:@Variable_1
y
MatMul_1MatMulTanhVariable_1/read*
transpose_a( *
transpose_b( *
_output_shapes
:	Θ@*
T0
H
SoftplusSoftplusMatMul_1*
T0*
_output_shapes
:	Θ@
i
truncated_normal_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"@   @   
\
truncated_normal_2/meanConst*
_output_shapes
: *
dtype0*
valueB
 *    
^
truncated_normal_2/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *   @

"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*
_output_shapes

:@@*
T0*
dtype0*

seed *
seed2 

truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
_output_shapes

:@@*
T0
s
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
T0*
_output_shapes

:@@
~

Variable_2
VariableV2*
	container *
dtype0*
_output_shapes

:@@*
shared_name *
shape
:@@
¬
Variable_2/AssignAssign
Variable_2truncated_normal_2*
validate_shape(*
use_locking(*
_class
loc:@Variable_2*
_output_shapes

:@@*
T0
o
Variable_2/readIdentity
Variable_2*
_class
loc:@Variable_2*
T0*
_output_shapes

:@@
}
MatMul_2MatMulSoftplusVariable_2/read*
transpose_a( *
T0*
_output_shapes
:	Θ@*
transpose_b( 
B
Tanh_1TanhMatMul_2*
_output_shapes
:	Θ@*
T0
i
truncated_normal_3/shapeConst*
valueB"@   @   *
dtype0*
_output_shapes
:
\
truncated_normal_3/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_3/stddevConst*
dtype0*
valueB
 *   @*
_output_shapes
: 

"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*
seed2 *
dtype0*

seed *
T0*
_output_shapes

:@@

truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
_output_shapes

:@@*
T0
s
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
T0*
_output_shapes

:@@
~

Variable_3
VariableV2*
shared_name *
	container *
_output_shapes

:@@*
dtype0*
shape
:@@
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
_class
loc:@Variable_3*
_output_shapes

:@@
{
MatMul_3MatMulTanh_1Variable_3/read*
_output_shapes
:	Θ@*
transpose_b( *
transpose_a( *
T0
J

Softplus_1SoftplusMatMul_3*
T0*
_output_shapes
:	Θ@
i
truncated_normal_4/shapeConst*
valueB"@      *
_output_shapes
:*
dtype0
\
truncated_normal_4/meanConst*
_output_shapes
: *
valueB
 *    *
dtype0
^
truncated_normal_4/stddevConst*
_output_shapes
: *
valueB
 *   @*
dtype0

"truncated_normal_4/TruncatedNormalTruncatedNormaltruncated_normal_4/shape*
T0*
dtype0*

seed *
_output_shapes

:@*
seed2 

truncated_normal_4/mulMul"truncated_normal_4/TruncatedNormaltruncated_normal_4/stddev*
_output_shapes

:@*
T0
s
truncated_normal_4Addtruncated_normal_4/multruncated_normal_4/mean*
_output_shapes

:@*
T0
~

Variable_4
VariableV2*
shape
:@*
shared_name *
_output_shapes

:@*
dtype0*
	container 
¬
Variable_4/AssignAssign
Variable_4truncated_normal_4*
validate_shape(*
_class
loc:@Variable_4*
_output_shapes

:@*
use_locking(*
T0
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
Softplus_1Variable_4/read*
_output_shapes
:	Θ*
T0*
transpose_a( *
transpose_b( 
^
Reshape/shapeConst*
dtype0*
valueB"Θ      *
_output_shapes
:
c
ReshapeReshapeMatMul_4Reshape/shape*
_output_shapes
:	Θ*
T0*
Tshape0
n
initNoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0*
_output_shapes
: 

save/SaveV2/tensor_namesConst*M
valueDBBBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4*
_output_shapes
:*
dtype0
m
save/SaveV2/shape_and_slicesConst*
valueBB B B B B *
dtype0*
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
save/Const^save/SaveV2*
T0*
_output_shapes
: *
_class
loc:@save/Const
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
save/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*
valueBB B B B B 
€
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes	
2*(
_output_shapes
:::::

save/AssignAssignVariablesave/RestoreV2*
validate_shape(*
T0*
_output_shapes

:@*
_class
loc:@Variable*
use_locking(
¦
save/Assign_1Assign
Variable_1save/RestoreV2:1*
_output_shapes

:@@*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(
¦
save/Assign_2Assign
Variable_2save/RestoreV2:2*
_class
loc:@Variable_2*
T0*
_output_shapes

:@@*
use_locking(*
validate_shape(
¦
save/Assign_3Assign
Variable_3save/RestoreV2:3*
T0*
validate_shape(*
_class
loc:@Variable_3*
_output_shapes

:@@*
use_locking(
¦
save/Assign_4Assign
Variable_4save/RestoreV2:4*
_output_shapes

:@*
validate_shape(*
use_locking(*
T0*
_class
loc:@Variable_4
f
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4
p
Placeholder_1Placeholder*
dtype0*
shape:?????????6*'
_output_shapes
:?????????6
p
Placeholder_2Placeholder*
shape:?????????*
dtype0*'
_output_shapes
:?????????
p
Placeholder_3Placeholder*
dtype0*'
_output_shapes
:?????????6*
shape:?????????6
h
Placeholder_4Placeholder*
shape:?????????*#
_output_shapes
:?????????*
dtype0
h
Placeholder_5Placeholder*
dtype0*
shape:?????????*#
_output_shapes
:?????????
―
5main/pi/dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*'
_class
loc:@main/pi/dense/kernel*
dtype0*
valueB"6     
‘
3main/pi/dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *'
_class
loc:@main/pi/dense/kernel*
valueB
 *Hpλ½*
dtype0
‘
3main/pi/dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
dtype0*'
_class
loc:@main/pi/dense/kernel*
valueB
 *Hpλ=
ώ
=main/pi/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform5main/pi/dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 *'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*

seed 
ξ
3main/pi/dense/kernel/Initializer/random_uniform/subSub3main/pi/dense/kernel/Initializer/random_uniform/max3main/pi/dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *'
_class
loc:@main/pi/dense/kernel*
T0

3main/pi/dense/kernel/Initializer/random_uniform/mulMul=main/pi/dense/kernel/Initializer/random_uniform/RandomUniform3main/pi/dense/kernel/Initializer/random_uniform/sub*
_output_shapes
:	6*
T0*'
_class
loc:@main/pi/dense/kernel
σ
/main/pi/dense/kernel/Initializer/random_uniformAdd3main/pi/dense/kernel/Initializer/random_uniform/mul3main/pi/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel
³
main/pi/dense/kernel
VariableV2*
dtype0*
shape:	6*
_output_shapes
:	6*
	container *'
_class
loc:@main/pi/dense/kernel*
shared_name 
θ
main/pi/dense/kernel/AssignAssignmain/pi/dense/kernel/main/pi/dense/kernel/Initializer/random_uniform*
_output_shapes
:	6*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/pi/dense/kernel

main/pi/dense/kernel/readIdentitymain/pi/dense/kernel*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel

$main/pi/dense/bias/Initializer/zerosConst*
dtype0*
valueB*    *
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias
§
main/pi/dense/bias
VariableV2*
	container *
shared_name *
shape:*%
_class
loc:@main/pi/dense/bias*
dtype0*
_output_shapes	
:
Σ
main/pi/dense/bias/AssignAssignmain/pi/dense/bias$main/pi/dense/bias/Initializer/zeros*
_output_shapes	
:*
T0*
validate_shape(*
use_locking(*%
_class
loc:@main/pi/dense/bias

main/pi/dense/bias/readIdentitymain/pi/dense/bias*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes	
:
‘
main/pi/dense/MatMulMatMulPlaceholder_1main/pi/dense/kernel/read*(
_output_shapes
:?????????*
transpose_b( *
T0*
transpose_a( 

main/pi/dense/BiasAddBiasAddmain/pi/dense/MatMulmain/pi/dense/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:?????????
d
main/pi/dense/ReluRelumain/pi/dense/BiasAdd*(
_output_shapes
:?????????*
T0
³
7main/pi/dense_1/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@main/pi/dense_1/kernel*
valueB"  ,  *
dtype0*
_output_shapes
:
₯
5main/pi/dense_1/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
valueB
 *£½½*)
_class
loc:@main/pi/dense_1/kernel*
dtype0
₯
5main/pi/dense_1/kernel/Initializer/random_uniform/maxConst*
dtype0*)
_class
loc:@main/pi/dense_1/kernel*
valueB
 *£½=*
_output_shapes
: 

?main/pi/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/pi/dense_1/kernel/Initializer/random_uniform/shape*)
_class
loc:@main/pi/dense_1/kernel*
dtype0*
T0*
seed2 * 
_output_shapes
:
¬*

seed 
φ
5main/pi/dense_1/kernel/Initializer/random_uniform/subSub5main/pi/dense_1/kernel/Initializer/random_uniform/max5main/pi/dense_1/kernel/Initializer/random_uniform/min*)
_class
loc:@main/pi/dense_1/kernel*
_output_shapes
: *
T0

5main/pi/dense_1/kernel/Initializer/random_uniform/mulMul?main/pi/dense_1/kernel/Initializer/random_uniform/RandomUniform5main/pi/dense_1/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/pi/dense_1/kernel*
T0* 
_output_shapes
:
¬
ό
1main/pi/dense_1/kernel/Initializer/random_uniformAdd5main/pi/dense_1/kernel/Initializer/random_uniform/mul5main/pi/dense_1/kernel/Initializer/random_uniform/min*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel
Ή
main/pi/dense_1/kernel
VariableV2*)
_class
loc:@main/pi/dense_1/kernel*
	container * 
_output_shapes
:
¬*
dtype0*
shared_name *
shape:
¬
ρ
main/pi/dense_1/kernel/AssignAssignmain/pi/dense_1/kernel1main/pi/dense_1/kernel/Initializer/random_uniform*)
_class
loc:@main/pi/dense_1/kernel*
T0* 
_output_shapes
:
¬*
use_locking(*
validate_shape(

main/pi/dense_1/kernel/readIdentitymain/pi/dense_1/kernel*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel

&main/pi/dense_1/bias/Initializer/zerosConst*
valueB¬*    *'
_class
loc:@main/pi/dense_1/bias*
dtype0*
_output_shapes	
:¬
«
main/pi/dense_1/bias
VariableV2*
shape:¬*
dtype0*
	container *'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
shared_name 
Ϋ
main/pi/dense_1/bias/AssignAssignmain/pi/dense_1/bias&main/pi/dense_1/bias/Initializer/zeros*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias*
use_locking(*
T0*
validate_shape(

main/pi/dense_1/bias/readIdentitymain/pi/dense_1/bias*
T0*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias
ͺ
main/pi/dense_1/MatMulMatMulmain/pi/dense/Relumain/pi/dense_1/kernel/read*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:?????????¬

main/pi/dense_1/BiasAddBiasAddmain/pi/dense_1/MatMulmain/pi/dense_1/bias/read*(
_output_shapes
:?????????¬*
T0*
data_formatNHWC
h
main/pi/dense_1/ReluRelumain/pi/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????¬
³
7main/pi/dense_2/kernel/Initializer/random_uniform/shapeConst*
dtype0*
valueB",     *
_output_shapes
:*)
_class
loc:@main/pi/dense_2/kernel
₯
5main/pi/dense_2/kernel/Initializer/random_uniform/minConst*
valueB
 *Υ Ύ*
_output_shapes
: *
dtype0*)
_class
loc:@main/pi/dense_2/kernel
₯
5main/pi/dense_2/kernel/Initializer/random_uniform/maxConst*)
_class
loc:@main/pi/dense_2/kernel*
dtype0*
_output_shapes
: *
valueB
 *Υ >

?main/pi/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/pi/dense_2/kernel/Initializer/random_uniform/shape*
dtype0*

seed *)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
seed2 *
T0
φ
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
ϋ
1main/pi/dense_2/kernel/Initializer/random_uniformAdd5main/pi/dense_2/kernel/Initializer/random_uniform/mul5main/pi/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel
·
main/pi/dense_2/kernel
VariableV2*
shape:	¬*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
shared_name *
	container *
dtype0
π
main/pi/dense_2/kernel/AssignAssignmain/pi/dense_2/kernel1main/pi/dense_2/kernel/Initializer/random_uniform*
_output_shapes
:	¬*
use_locking(*
T0*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(

main/pi/dense_2/kernel/readIdentitymain/pi/dense_2/kernel*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel*
T0

&main/pi/dense_2/bias/Initializer/zerosConst*
valueB*    *
_output_shapes
:*
dtype0*'
_class
loc:@main/pi/dense_2/bias
©
main/pi/dense_2/bias
VariableV2*
shape:*
	container *
shared_name *
_output_shapes
:*
dtype0*'
_class
loc:@main/pi/dense_2/bias
Ϊ
main/pi/dense_2/bias/AssignAssignmain/pi/dense_2/bias&main/pi/dense_2/bias/Initializer/zeros*
_output_shapes
:*
T0*
use_locking(*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias

main/pi/dense_2/bias/readIdentitymain/pi/dense_2/bias*'
_class
loc:@main/pi/dense_2/bias*
T0*
_output_shapes
:
«
main/pi/dense_2/MatMulMatMulmain/pi/dense_1/Relumain/pi/dense_2/kernel/read*'
_output_shapes
:?????????*
transpose_b( *
T0*
transpose_a( 

main/pi/dense_2/BiasAddBiasAddmain/pi/dense_2/MatMulmain/pi/dense_2/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:?????????
³
7main/pi/dense_3/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*)
_class
loc:@main/pi/dense_3/kernel*
dtype0*
valueB",     
₯
5main/pi/dense_3/kernel/Initializer/random_uniform/minConst*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
: *
valueB
 *Υ Ύ*
dtype0
₯
5main/pi/dense_3/kernel/Initializer/random_uniform/maxConst*
dtype0*
valueB
 *Υ >*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
: 

?main/pi/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/pi/dense_3/kernel/Initializer/random_uniform/shape*
dtype0*

seed *
T0*)
_class
loc:@main/pi/dense_3/kernel*
seed2 *
_output_shapes
:	¬
φ
5main/pi/dense_3/kernel/Initializer/random_uniform/subSub5main/pi/dense_3/kernel/Initializer/random_uniform/max5main/pi/dense_3/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@main/pi/dense_3/kernel

5main/pi/dense_3/kernel/Initializer/random_uniform/mulMul?main/pi/dense_3/kernel/Initializer/random_uniform/RandomUniform5main/pi/dense_3/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
T0
ϋ
1main/pi/dense_3/kernel/Initializer/random_uniformAdd5main/pi/dense_3/kernel/Initializer/random_uniform/mul5main/pi/dense_3/kernel/Initializer/random_uniform/min*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_3/kernel
·
main/pi/dense_3/kernel
VariableV2*
_output_shapes
:	¬*
dtype0*
shape:	¬*)
_class
loc:@main/pi/dense_3/kernel*
shared_name *
	container 
π
main/pi/dense_3/kernel/AssignAssignmain/pi/dense_3/kernel1main/pi/dense_3/kernel/Initializer/random_uniform*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
T0*
validate_shape(*
use_locking(

main/pi/dense_3/kernel/readIdentitymain/pi/dense_3/kernel*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel

&main/pi/dense_3/bias/Initializer/zerosConst*'
_class
loc:@main/pi/dense_3/bias*
dtype0*
_output_shapes
:*
valueB*    
©
main/pi/dense_3/bias
VariableV2*
dtype0*
shape:*
_output_shapes
:*
shared_name *'
_class
loc:@main/pi/dense_3/bias*
	container 
Ϊ
main/pi/dense_3/bias/AssignAssignmain/pi/dense_3/bias&main/pi/dense_3/bias/Initializer/zeros*
_output_shapes
:*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/pi/dense_3/bias

main/pi/dense_3/bias/readIdentitymain/pi/dense_3/bias*'
_class
loc:@main/pi/dense_3/bias*
T0*
_output_shapes
:
«
main/pi/dense_3/MatMulMatMulmain/pi/dense_1/Relumain/pi/dense_3/kernel/read*
T0*
transpose_b( *'
_output_shapes
:?????????*
transpose_a( 

main/pi/dense_3/BiasAddBiasAddmain/pi/dense_3/MatMulmain/pi/dense_3/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:?????????
g
main/pi/dense_3/TanhTanhmain/pi/dense_3/BiasAdd*
T0*'
_output_shapes
:?????????
R
main/pi/add/yConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
k
main/pi/addAddV2main/pi/dense_3/Tanhmain/pi/add/y*'
_output_shapes
:?????????*
T0
R
main/pi/mul/xConst*
valueB
 *  0A*
_output_shapes
: *
dtype0
`
main/pi/mulMulmain/pi/mul/xmain/pi/add*'
_output_shapes
:?????????*
T0
T
main/pi/add_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   Α
f
main/pi/add_1AddV2main/pi/add_1/xmain/pi/mul*
T0*'
_output_shapes
:?????????
S
main/pi/ExpExpmain/pi/add_1*'
_output_shapes
:?????????*
T0
d
main/pi/ShapeShapemain/pi/dense_2/BiasAdd*
_output_shapes
:*
T0*
out_type0
_
main/pi/random_normal/meanConst*
dtype0*
_output_shapes
: *
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
*main/pi/random_normal/RandomStandardNormalRandomStandardNormalmain/pi/Shape*
T0*

seed *'
_output_shapes
:?????????*
seed2 *
dtype0

main/pi/random_normal/mulMul*main/pi/random_normal/RandomStandardNormalmain/pi/random_normal/stddev*'
_output_shapes
:?????????*
T0

main/pi/random_normalAddmain/pi/random_normal/mulmain/pi/random_normal/mean*
T0*'
_output_shapes
:?????????
j
main/pi/mul_1Mulmain/pi/random_normalmain/pi/Exp*
T0*'
_output_shapes
:?????????
p
main/pi/add_2AddV2main/pi/dense_2/BiasAddmain/pi/mul_1*
T0*'
_output_shapes
:?????????
l
main/pi/subSubmain/pi/add_2main/pi/dense_2/BiasAdd*'
_output_shapes
:?????????*
T0
U
main/pi/Exp_1Expmain/pi/add_1*'
_output_shapes
:?????????*
T0
T
main/pi/add_3/yConst*
dtype0*
_output_shapes
: *
valueB
 *wΜ+2
h
main/pi/add_3AddV2main/pi/Exp_1main/pi/add_3/y*
T0*'
_output_shapes
:?????????
h
main/pi/truedivRealDivmain/pi/submain/pi/add_3*'
_output_shapes
:?????????*
T0
R
main/pi/pow/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
d
main/pi/powPowmain/pi/truedivmain/pi/pow/y*'
_output_shapes
:?????????*
T0
T
main/pi/mul_2/xConst*
_output_shapes
: *
valueB
 *   @*
dtype0
f
main/pi/mul_2Mulmain/pi/mul_2/xmain/pi/add_1*
T0*'
_output_shapes
:?????????
d
main/pi/add_4AddV2main/pi/powmain/pi/mul_2*'
_output_shapes
:?????????*
T0
T
main/pi/add_5/yConst*
_output_shapes
: *
valueB
 *?λ?*
dtype0
h
main/pi/add_5AddV2main/pi/add_4main/pi/add_5/y*'
_output_shapes
:?????????*
T0
T
main/pi/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   Ώ
f
main/pi/mul_3Mulmain/pi/mul_3/xmain/pi/add_5*
T0*'
_output_shapes
:?????????
_
main/pi/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :

main/pi/SumSummain/pi/mul_3main/pi/Sum/reduction_indices*
T0*

Tidx0*#
_output_shapes
:?????????*
	keep_dims( 
_
main/pi/TanhTanhmain/pi/dense_2/BiasAdd*'
_output_shapes
:?????????*
T0
W
main/pi/Tanh_1Tanhmain/pi/add_2*'
_output_shapes
:?????????*
T0
T
main/pi/pow_1/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
g
main/pi/pow_1Powmain/pi/Tanh_1main/pi/pow_1/y*'
_output_shapes
:?????????*
T0
T
main/pi/sub_1/xConst*
valueB
 *  ?*
_output_shapes
: *
dtype0
f
main/pi/sub_1Submain/pi/sub_1/xmain/pi/pow_1*'
_output_shapes
:?????????*
T0
V
main/pi/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
n
main/pi/GreaterGreatermain/pi/sub_1main/pi/Greater/y*'
_output_shapes
:?????????*
T0
v
main/pi/CastCastmain/pi/Greater*

SrcT0
*'
_output_shapes
:?????????*
Truncate( *

DstT0
S
main/pi/Less/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
e
main/pi/LessLessmain/pi/sub_1main/pi/Less/y*'
_output_shapes
:?????????*
T0
u
main/pi/Cast_1Castmain/pi/Less*
Truncate( *

DstT0*

SrcT0
*'
_output_shapes
:?????????
T
main/pi/sub_2/xConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
f
main/pi/sub_2Submain/pi/sub_2/xmain/pi/sub_1*
T0*'
_output_shapes
:?????????
c
main/pi/mul_4Mulmain/pi/sub_2main/pi/Cast*'
_output_shapes
:?????????*
T0
T
main/pi/sub_3/xConst*
dtype0*
valueB
 *    *
_output_shapes
: 
f
main/pi/sub_3Submain/pi/sub_3/xmain/pi/sub_1*
T0*'
_output_shapes
:?????????
e
main/pi/mul_5Mulmain/pi/sub_3main/pi/Cast_1*'
_output_shapes
:?????????*
T0
f
main/pi/add_6AddV2main/pi/mul_4main/pi/mul_5*'
_output_shapes
:?????????*
T0
e
main/pi/StopGradientStopGradientmain/pi/add_6*
T0*'
_output_shapes
:?????????
m
main/pi/add_7AddV2main/pi/sub_1main/pi/StopGradient*
T0*'
_output_shapes
:?????????
T
main/pi/add_8/yConst*
valueB
 *½75*
dtype0*
_output_shapes
: 
h
main/pi/add_8AddV2main/pi/add_7main/pi/add_8/y*'
_output_shapes
:?????????*
T0
S
main/pi/LogLogmain/pi/add_8*
T0*'
_output_shapes
:?????????
a
main/pi/Sum_1/reduction_indicesConst*
value	B :*
_output_shapes
: *
dtype0

main/pi/Sum_1Summain/pi/Logmain/pi/Sum_1/reduction_indices*
T0*#
_output_shapes
:?????????*
	keep_dims( *

Tidx0
^
main/pi/sub_4Submain/pi/Summain/pi/Sum_1*#
_output_shapes
:?????????*
T0
O

main/mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
[
main/mulMulmain/pi/Tanh
main/mul/y*'
_output_shapes
:?????????*
T0
Q
main/mul_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
a

main/mul_1Mulmain/pi/Tanh_1main/mul_1/y*
T0*'
_output_shapes
:?????????
^
main/q1/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
?????????

main/q1/concatConcatV2Placeholder_1Placeholder_2main/q1/concat/axis*
T0*

Tidx0*'
_output_shapes
:?????????B*
N
―
5main/q1/dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*'
_class
loc:@main/q1/dense/kernel*
dtype0*
valueB"B     
‘
3main/q1/dense/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 *.cθ½*
_output_shapes
: *'
_class
loc:@main/q1/dense/kernel
‘
3main/q1/dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *'
_class
loc:@main/q1/dense/kernel*
dtype0*
valueB
 *.cθ=
ώ
=main/q1/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform5main/q1/dense/kernel/Initializer/random_uniform/shape*

seed *'
_class
loc:@main/q1/dense/kernel*
dtype0*
_output_shapes
:	B*
seed2 *
T0
ξ
3main/q1/dense/kernel/Initializer/random_uniform/subSub3main/q1/dense/kernel/Initializer/random_uniform/max3main/q1/dense/kernel/Initializer/random_uniform/min*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
: 

3main/q1/dense/kernel/Initializer/random_uniform/mulMul=main/q1/dense/kernel/Initializer/random_uniform/RandomUniform3main/q1/dense/kernel/Initializer/random_uniform/sub*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
:	B
σ
/main/q1/dense/kernel/Initializer/random_uniformAdd3main/q1/dense/kernel/Initializer/random_uniform/mul3main/q1/dense/kernel/Initializer/random_uniform/min*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
:	B
³
main/q1/dense/kernel
VariableV2*
shared_name *'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
dtype0*
	container *
shape:	B
θ
main/q1/dense/kernel/AssignAssignmain/q1/dense/kernel/main/q1/dense/kernel/Initializer/random_uniform*
_output_shapes
:	B*
use_locking(*
validate_shape(*'
_class
loc:@main/q1/dense/kernel*
T0

main/q1/dense/kernel/readIdentitymain/q1/dense/kernel*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*
T0

$main/q1/dense/bias/Initializer/zerosConst*
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias*
dtype0*
valueB*    
§
main/q1/dense/bias
VariableV2*
shared_name *
_output_shapes	
:*
	container *%
_class
loc:@main/q1/dense/bias*
shape:*
dtype0
Σ
main/q1/dense/bias/AssignAssignmain/q1/dense/bias$main/q1/dense/bias/Initializer/zeros*%
_class
loc:@main/q1/dense/bias*
use_locking(*
T0*
_output_shapes	
:*
validate_shape(

main/q1/dense/bias/readIdentitymain/q1/dense/bias*
_output_shapes	
:*
T0*%
_class
loc:@main/q1/dense/bias
’
main/q1/dense/MatMulMatMulmain/q1/concatmain/q1/dense/kernel/read*
transpose_b( *(
_output_shapes
:?????????*
transpose_a( *
T0

main/q1/dense/BiasAddBiasAddmain/q1/dense/MatMulmain/q1/dense/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:?????????
d
main/q1/dense/ReluRelumain/q1/dense/BiasAdd*
T0*(
_output_shapes
:?????????
³
7main/q1/dense_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
valueB"  ,  *)
_class
loc:@main/q1/dense_1/kernel*
_output_shapes
:
₯
5main/q1/dense_1/kernel/Initializer/random_uniform/minConst*)
_class
loc:@main/q1/dense_1/kernel*
valueB
 *£½½*
dtype0*
_output_shapes
: 
₯
5main/q1/dense_1/kernel/Initializer/random_uniform/maxConst*)
_class
loc:@main/q1/dense_1/kernel*
dtype0*
valueB
 *£½=*
_output_shapes
: 

?main/q1/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q1/dense_1/kernel/Initializer/random_uniform/shape*)
_class
loc:@main/q1/dense_1/kernel*
dtype0*
seed2 *
T0*

seed * 
_output_shapes
:
¬
φ
5main/q1/dense_1/kernel/Initializer/random_uniform/subSub5main/q1/dense_1/kernel/Initializer/random_uniform/max5main/q1/dense_1/kernel/Initializer/random_uniform/min*)
_class
loc:@main/q1/dense_1/kernel*
_output_shapes
: *
T0

5main/q1/dense_1/kernel/Initializer/random_uniform/mulMul?main/q1/dense_1/kernel/Initializer/random_uniform/RandomUniform5main/q1/dense_1/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
¬*
T0*)
_class
loc:@main/q1/dense_1/kernel
ό
1main/q1/dense_1/kernel/Initializer/random_uniformAdd5main/q1/dense_1/kernel/Initializer/random_uniform/mul5main/q1/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel*
T0
Ή
main/q1/dense_1/kernel
VariableV2*
dtype0* 
_output_shapes
:
¬*
	container *
shared_name *)
_class
loc:@main/q1/dense_1/kernel*
shape:
¬
ρ
main/q1/dense_1/kernel/AssignAssignmain/q1/dense_1/kernel1main/q1/dense_1/kernel/Initializer/random_uniform* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel*
use_locking(*
T0

main/q1/dense_1/kernel/readIdentitymain/q1/dense_1/kernel*)
_class
loc:@main/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬

&main/q1/dense_1/bias/Initializer/zerosConst*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
dtype0*
valueB¬*    
«
main/q1/dense_1/bias
VariableV2*'
_class
loc:@main/q1/dense_1/bias*
shape:¬*
shared_name *
dtype0*
	container *
_output_shapes	
:¬
Ϋ
main/q1/dense_1/bias/AssignAssignmain/q1/dense_1/bias&main/q1/dense_1/bias/Initializer/zeros*
use_locking(*'
_class
loc:@main/q1/dense_1/bias*
validate_shape(*
_output_shapes	
:¬*
T0

main/q1/dense_1/bias/readIdentitymain/q1/dense_1/bias*
T0*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias
ͺ
main/q1/dense_1/MatMulMatMulmain/q1/dense/Relumain/q1/dense_1/kernel/read*
transpose_a( *
transpose_b( *(
_output_shapes
:?????????¬*
T0

main/q1/dense_1/BiasAddBiasAddmain/q1/dense_1/MatMulmain/q1/dense_1/bias/read*
data_formatNHWC*(
_output_shapes
:?????????¬*
T0
h
main/q1/dense_1/ReluRelumain/q1/dense_1/BiasAdd*(
_output_shapes
:?????????¬*
T0
³
7main/q1/dense_2/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:*
valueB",     *
dtype0
₯
5main/q1/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 * Ύ*
_output_shapes
: *)
_class
loc:@main/q1/dense_2/kernel
₯
5main/q1/dense_2/kernel/Initializer/random_uniform/maxConst*
valueB
 * >*
dtype0*
_output_shapes
: *)
_class
loc:@main/q1/dense_2/kernel

?main/q1/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q1/dense_2/kernel/Initializer/random_uniform/shape*
dtype0*
T0*
seed2 *
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel*

seed 
φ
5main/q1/dense_2/kernel/Initializer/random_uniform/subSub5main/q1/dense_2/kernel/Initializer/random_uniform/max5main/q1/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@main/q1/dense_2/kernel

5main/q1/dense_2/kernel/Initializer/random_uniform/mulMul?main/q1/dense_2/kernel/Initializer/random_uniform/RandomUniform5main/q1/dense_2/kernel/Initializer/random_uniform/sub*
_output_shapes
:	¬*
T0*)
_class
loc:@main/q1/dense_2/kernel
ϋ
1main/q1/dense_2/kernel/Initializer/random_uniformAdd5main/q1/dense_2/kernel/Initializer/random_uniform/mul5main/q1/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel*
T0
·
main/q1/dense_2/kernel
VariableV2*
shared_name *
shape:	¬*
_output_shapes
:	¬*
	container *)
_class
loc:@main/q1/dense_2/kernel*
dtype0
π
main/q1/dense_2/kernel/AssignAssignmain/q1/dense_2/kernel1main/q1/dense_2/kernel/Initializer/random_uniform*
T0*
validate_shape(*
use_locking(*
_output_shapes
:	¬*)
_class
loc:@main/q1/dense_2/kernel

main/q1/dense_2/kernel/readIdentitymain/q1/dense_2/kernel*)
_class
loc:@main/q1/dense_2/kernel*
T0*
_output_shapes
:	¬

&main/q1/dense_2/bias/Initializer/zerosConst*'
_class
loc:@main/q1/dense_2/bias*
valueB*    *
_output_shapes
:*
dtype0
©
main/q1/dense_2/bias
VariableV2*
dtype0*
shape:*
	container *
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
shared_name 
Ϊ
main/q1/dense_2/bias/AssignAssignmain/q1/dense_2/bias&main/q1/dense_2/bias/Initializer/zeros*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
use_locking(*
validate_shape(*
T0

main/q1/dense_2/bias/readIdentitymain/q1/dense_2/bias*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
T0
«
main/q1/dense_2/MatMulMatMulmain/q1/dense_1/Relumain/q1/dense_2/kernel/read*
transpose_b( *
T0*'
_output_shapes
:?????????*
transpose_a( 

main/q1/dense_2/BiasAddBiasAddmain/q1/dense_2/MatMulmain/q1/dense_2/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:?????????
x
main/q1/SqueezeSqueezemain/q1/dense_2/BiasAdd*
squeeze_dims
*
T0*#
_output_shapes
:?????????
`
main/q1_1/concat/axisConst*
valueB :
?????????*
_output_shapes
: *
dtype0

main/q1_1/concatConcatV2Placeholder_1
main/mul_1main/q1_1/concat/axis*'
_output_shapes
:?????????B*
T0*
N*

Tidx0
¦
main/q1_1/dense/MatMulMatMulmain/q1_1/concatmain/q1/dense/kernel/read*(
_output_shapes
:?????????*
T0*
transpose_b( *
transpose_a( 

main/q1_1/dense/BiasAddBiasAddmain/q1_1/dense/MatMulmain/q1/dense/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:?????????
h
main/q1_1/dense/ReluRelumain/q1_1/dense/BiasAdd*(
_output_shapes
:?????????*
T0
?
main/q1_1/dense_1/MatMulMatMulmain/q1_1/dense/Relumain/q1/dense_1/kernel/read*
T0*
transpose_b( *
transpose_a( *(
_output_shapes
:?????????¬
£
main/q1_1/dense_1/BiasAddBiasAddmain/q1_1/dense_1/MatMulmain/q1/dense_1/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:?????????¬
l
main/q1_1/dense_1/ReluRelumain/q1_1/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????¬
―
main/q1_1/dense_2/MatMulMatMulmain/q1_1/dense_1/Relumain/q1/dense_2/kernel/read*
transpose_a( *
T0*'
_output_shapes
:?????????*
transpose_b( 
’
main/q1_1/dense_2/BiasAddBiasAddmain/q1_1/dense_2/MatMulmain/q1/dense_2/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:?????????
|
main/q1_1/SqueezeSqueezemain/q1_1/dense_2/BiasAdd*#
_output_shapes
:?????????*
T0*
squeeze_dims

^
main/q2/concat/axisConst*
dtype0*
valueB :
?????????*
_output_shapes
: 

main/q2/concatConcatV2Placeholder_1Placeholder_2main/q2/concat/axis*'
_output_shapes
:?????????B*
N*
T0*

Tidx0
―
5main/q2/dense/kernel/Initializer/random_uniform/shapeConst*
valueB"B     *'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:*
dtype0
‘
3main/q2/dense/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 *.cθ½*
_output_shapes
: *'
_class
loc:@main/q2/dense/kernel
‘
3main/q2/dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
valueB
 *.cθ=*
dtype0*'
_class
loc:@main/q2/dense/kernel
ώ
=main/q2/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform5main/q2/dense/kernel/Initializer/random_uniform/shape*
T0*'
_class
loc:@main/q2/dense/kernel*
dtype0*
seed2 *
_output_shapes
:	B*

seed 
ξ
3main/q2/dense/kernel/Initializer/random_uniform/subSub3main/q2/dense/kernel/Initializer/random_uniform/max3main/q2/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *'
_class
loc:@main/q2/dense/kernel

3main/q2/dense/kernel/Initializer/random_uniform/mulMul=main/q2/dense/kernel/Initializer/random_uniform/RandomUniform3main/q2/dense/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel
σ
/main/q2/dense/kernel/Initializer/random_uniformAdd3main/q2/dense/kernel/Initializer/random_uniform/mul3main/q2/dense/kernel/Initializer/random_uniform/min*
T0*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B
³
main/q2/dense/kernel
VariableV2*
	container *
shared_name *
_output_shapes
:	B*
dtype0*
shape:	B*'
_class
loc:@main/q2/dense/kernel
θ
main/q2/dense/kernel/AssignAssignmain/q2/dense/kernel/main/q2/dense/kernel/Initializer/random_uniform*
validate_shape(*'
_class
loc:@main/q2/dense/kernel*
T0*
use_locking(*
_output_shapes
:	B

main/q2/dense/kernel/readIdentitymain/q2/dense/kernel*
T0*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel

$main/q2/dense/bias/Initializer/zerosConst*
valueB*    *
_output_shapes	
:*
dtype0*%
_class
loc:@main/q2/dense/bias
§
main/q2/dense/bias
VariableV2*
shared_name *
shape:*
dtype0*
_output_shapes	
:*
	container *%
_class
loc:@main/q2/dense/bias
Σ
main/q2/dense/bias/AssignAssignmain/q2/dense/bias$main/q2/dense/bias/Initializer/zeros*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(*%
_class
loc:@main/q2/dense/bias

main/q2/dense/bias/readIdentitymain/q2/dense/bias*
T0*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:
’
main/q2/dense/MatMulMatMulmain/q2/concatmain/q2/dense/kernel/read*
T0*(
_output_shapes
:?????????*
transpose_b( *
transpose_a( 

main/q2/dense/BiasAddBiasAddmain/q2/dense/MatMulmain/q2/dense/bias/read*(
_output_shapes
:?????????*
data_formatNHWC*
T0
d
main/q2/dense/ReluRelumain/q2/dense/BiasAdd*(
_output_shapes
:?????????*
T0
³
7main/q2/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"  ,  *
dtype0*)
_class
loc:@main/q2/dense_1/kernel*
_output_shapes
:
₯
5main/q2/dense_1/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *)
_class
loc:@main/q2/dense_1/kernel*
dtype0*
valueB
 *£½½
₯
5main/q2/dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *£½=*
dtype0*)
_class
loc:@main/q2/dense_1/kernel*
_output_shapes
: 

?main/q2/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q2/dense_1/kernel/Initializer/random_uniform/shape* 
_output_shapes
:
¬*

seed *
T0*)
_class
loc:@main/q2/dense_1/kernel*
seed2 *
dtype0
φ
5main/q2/dense_1/kernel/Initializer/random_uniform/subSub5main/q2/dense_1/kernel/Initializer/random_uniform/max5main/q2/dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@main/q2/dense_1/kernel

5main/q2/dense_1/kernel/Initializer/random_uniform/mulMul?main/q2/dense_1/kernel/Initializer/random_uniform/RandomUniform5main/q2/dense_1/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬
ό
1main/q2/dense_1/kernel/Initializer/random_uniformAdd5main/q2/dense_1/kernel/Initializer/random_uniform/mul5main/q2/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬*
T0*)
_class
loc:@main/q2/dense_1/kernel
Ή
main/q2/dense_1/kernel
VariableV2*
	container * 
_output_shapes
:
¬*
shared_name *)
_class
loc:@main/q2/dense_1/kernel*
shape:
¬*
dtype0
ρ
main/q2/dense_1/kernel/AssignAssignmain/q2/dense_1/kernel1main/q2/dense_1/kernel/Initializer/random_uniform*
validate_shape(*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬*
T0*
use_locking(

main/q2/dense_1/kernel/readIdentitymain/q2/dense_1/kernel*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬*
T0

&main/q2/dense_1/bias/Initializer/zerosConst*
dtype0*
valueB¬*    *
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias
«
main/q2/dense_1/bias
VariableV2*
shared_name *
shape:¬*'
_class
loc:@main/q2/dense_1/bias*
dtype0*
	container *
_output_shapes	
:¬
Ϋ
main/q2/dense_1/bias/AssignAssignmain/q2/dense_1/bias&main/q2/dense_1/bias/Initializer/zeros*'
_class
loc:@main/q2/dense_1/bias*
validate_shape(*
T0*
use_locking(*
_output_shapes	
:¬

main/q2/dense_1/bias/readIdentitymain/q2/dense_1/bias*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
T0
ͺ
main/q2/dense_1/MatMulMatMulmain/q2/dense/Relumain/q2/dense_1/kernel/read*(
_output_shapes
:?????????¬*
T0*
transpose_b( *
transpose_a( 

main/q2/dense_1/BiasAddBiasAddmain/q2/dense_1/MatMulmain/q2/dense_1/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:?????????¬
h
main/q2/dense_1/ReluRelumain/q2/dense_1/BiasAdd*(
_output_shapes
:?????????¬*
T0
³
7main/q2/dense_2/kernel/Initializer/random_uniform/shapeConst*
valueB",     *)
_class
loc:@main/q2/dense_2/kernel*
dtype0*
_output_shapes
:
₯
5main/q2/dense_2/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
valueB
 * Ύ*
dtype0*)
_class
loc:@main/q2/dense_2/kernel
₯
5main/q2/dense_2/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
valueB
 * >*)
_class
loc:@main/q2/dense_2/kernel*
dtype0

?main/q2/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform7main/q2/dense_2/kernel/Initializer/random_uniform/shape*)
_class
loc:@main/q2/dense_2/kernel*
seed2 *
dtype0*
T0*

seed *
_output_shapes
:	¬
φ
5main/q2/dense_2/kernel/Initializer/random_uniform/subSub5main/q2/dense_2/kernel/Initializer/random_uniform/max5main/q2/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
: *)
_class
loc:@main/q2/dense_2/kernel*
T0

5main/q2/dense_2/kernel/Initializer/random_uniform/mulMul?main/q2/dense_2/kernel/Initializer/random_uniform/RandomUniform5main/q2/dense_2/kernel/Initializer/random_uniform/sub*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
T0
ϋ
1main/q2/dense_2/kernel/Initializer/random_uniformAdd5main/q2/dense_2/kernel/Initializer/random_uniform/mul5main/q2/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel
·
main/q2/dense_2/kernel
VariableV2*
shape:	¬*
dtype0*
shared_name *
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
	container 
π
main/q2/dense_2/kernel/AssignAssignmain/q2/dense_2/kernel1main/q2/dense_2/kernel/Initializer/random_uniform*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
use_locking(*
T0

main/q2/dense_2/kernel/readIdentitymain/q2/dense_2/kernel*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel

&main/q2/dense_2/bias/Initializer/zerosConst*
valueB*    *
dtype0*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:
©
main/q2/dense_2/bias
VariableV2*'
_class
loc:@main/q2/dense_2/bias*
shared_name *
shape:*
_output_shapes
:*
dtype0*
	container 
Ϊ
main/q2/dense_2/bias/AssignAssignmain/q2/dense_2/bias&main/q2/dense_2/bias/Initializer/zeros*'
_class
loc:@main/q2/dense_2/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes
:

main/q2/dense_2/bias/readIdentitymain/q2/dense_2/bias*
T0*
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias
«
main/q2/dense_2/MatMulMatMulmain/q2/dense_1/Relumain/q2/dense_2/kernel/read*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:?????????

main/q2/dense_2/BiasAddBiasAddmain/q2/dense_2/MatMulmain/q2/dense_2/bias/read*
data_formatNHWC*'
_output_shapes
:?????????*
T0
x
main/q2/SqueezeSqueezemain/q2/dense_2/BiasAdd*#
_output_shapes
:?????????*
squeeze_dims
*
T0
`
main/q2_1/concat/axisConst*
dtype0*
valueB :
?????????*
_output_shapes
: 

main/q2_1/concatConcatV2Placeholder_1
main/mul_1main/q2_1/concat/axis*

Tidx0*
N*
T0*'
_output_shapes
:?????????B
¦
main/q2_1/dense/MatMulMatMulmain/q2_1/concatmain/q2/dense/kernel/read*
T0*
transpose_a( *(
_output_shapes
:?????????*
transpose_b( 

main/q2_1/dense/BiasAddBiasAddmain/q2_1/dense/MatMulmain/q2/dense/bias/read*(
_output_shapes
:?????????*
T0*
data_formatNHWC
h
main/q2_1/dense/ReluRelumain/q2_1/dense/BiasAdd*(
_output_shapes
:?????????*
T0
?
main/q2_1/dense_1/MatMulMatMulmain/q2_1/dense/Relumain/q2/dense_1/kernel/read*(
_output_shapes
:?????????¬*
T0*
transpose_b( *
transpose_a( 
£
main/q2_1/dense_1/BiasAddBiasAddmain/q2_1/dense_1/MatMulmain/q2/dense_1/bias/read*
data_formatNHWC*(
_output_shapes
:?????????¬*
T0
l
main/q2_1/dense_1/ReluRelumain/q2_1/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????¬
―
main/q2_1/dense_2/MatMulMatMulmain/q2_1/dense_1/Relumain/q2/dense_2/kernel/read*'
_output_shapes
:?????????*
T0*
transpose_b( *
transpose_a( 
’
main/q2_1/dense_2/BiasAddBiasAddmain/q2_1/dense_2/MatMulmain/q2/dense_2/bias/read*'
_output_shapes
:?????????*
T0*
data_formatNHWC
|
main/q2_1/SqueezeSqueezemain/q2_1/dense_2/BiasAdd*#
_output_shapes
:?????????*
squeeze_dims
*
T0
­
4main/v/dense/kernel/Initializer/random_uniform/shapeConst*
dtype0*&
_class
loc:@main/v/dense/kernel*
valueB"6     *
_output_shapes
:

2main/v/dense/kernel/Initializer/random_uniform/minConst*&
_class
loc:@main/v/dense/kernel*
dtype0*
valueB
 *Hpλ½*
_output_shapes
: 

2main/v/dense/kernel/Initializer/random_uniform/maxConst*
dtype0*&
_class
loc:@main/v/dense/kernel*
valueB
 *Hpλ=*
_output_shapes
: 
ϋ
<main/v/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4main/v/dense/kernel/Initializer/random_uniform/shape*
dtype0*
seed2 *

seed *
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
T0
κ
2main/v/dense/kernel/Initializer/random_uniform/subSub2main/v/dense/kernel/Initializer/random_uniform/max2main/v/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@main/v/dense/kernel*
_output_shapes
: 
ύ
2main/v/dense/kernel/Initializer/random_uniform/mulMul<main/v/dense/kernel/Initializer/random_uniform/RandomUniform2main/v/dense/kernel/Initializer/random_uniform/sub*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
T0
ο
.main/v/dense/kernel/Initializer/random_uniformAdd2main/v/dense/kernel/Initializer/random_uniform/mul2main/v/dense/kernel/Initializer/random_uniform/min*&
_class
loc:@main/v/dense/kernel*
T0*
_output_shapes
:	6
±
main/v/dense/kernel
VariableV2*
	container *
dtype0*
_output_shapes
:	6*
shared_name *
shape:	6*&
_class
loc:@main/v/dense/kernel
δ
main/v/dense/kernel/AssignAssignmain/v/dense/kernel.main/v/dense/kernel/Initializer/random_uniform*
validate_shape(*
use_locking(*
T0*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6

main/v/dense/kernel/readIdentitymain/v/dense/kernel*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6*
T0

#main/v/dense/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
valueB*    
₯
main/v/dense/bias
VariableV2*
dtype0*$
_class
loc:@main/v/dense/bias*
shared_name *
	container *
_output_shapes	
:*
shape:
Ο
main/v/dense/bias/AssignAssignmain/v/dense/bias#main/v/dense/bias/Initializer/zeros*
T0*
_output_shapes	
:*
use_locking(*$
_class
loc:@main/v/dense/bias*
validate_shape(

main/v/dense/bias/readIdentitymain/v/dense/bias*
T0*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias

main/v/dense/MatMulMatMulPlaceholder_1main/v/dense/kernel/read*
transpose_b( *
T0*
transpose_a( *(
_output_shapes
:?????????

main/v/dense/BiasAddBiasAddmain/v/dense/MatMulmain/v/dense/bias/read*
data_formatNHWC*(
_output_shapes
:?????????*
T0
b
main/v/dense/ReluRelumain/v/dense/BiasAdd*
T0*(
_output_shapes
:?????????
±
6main/v/dense_1/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@main/v/dense_1/kernel*
_output_shapes
:*
valueB"  ,  *
dtype0
£
4main/v/dense_1/kernel/Initializer/random_uniform/minConst*
valueB
 *£½½*
_output_shapes
: *
dtype0*(
_class
loc:@main/v/dense_1/kernel
£
4main/v/dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *£½=*
dtype0*(
_class
loc:@main/v/dense_1/kernel*
_output_shapes
: 

>main/v/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6main/v/dense_1/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
seed2 *
T0*

seed 
ς
4main/v/dense_1/kernel/Initializer/random_uniform/subSub4main/v/dense_1/kernel/Initializer/random_uniform/max4main/v/dense_1/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *(
_class
loc:@main/v/dense_1/kernel

4main/v/dense_1/kernel/Initializer/random_uniform/mulMul>main/v/dense_1/kernel/Initializer/random_uniform/RandomUniform4main/v/dense_1/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬
ψ
0main/v/dense_1/kernel/Initializer/random_uniformAdd4main/v/dense_1/kernel/Initializer/random_uniform/mul4main/v/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
T0
·
main/v/dense_1/kernel
VariableV2*
shared_name *(
_class
loc:@main/v/dense_1/kernel*
	container *
dtype0*
shape:
¬* 
_output_shapes
:
¬
ν
main/v/dense_1/kernel/AssignAssignmain/v/dense_1/kernel0main/v/dense_1/kernel/Initializer/random_uniform*
T0*
use_locking(*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬

main/v/dense_1/kernel/readIdentitymain/v/dense_1/kernel*
T0* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel

%main/v/dense_1/bias/Initializer/zerosConst*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias*
valueB¬*    *
dtype0
©
main/v/dense_1/bias
VariableV2*
	container *
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias*
shared_name *
dtype0*
shape:¬
Χ
main/v/dense_1/bias/AssignAssignmain/v/dense_1/bias%main/v/dense_1/bias/Initializer/zeros*
_output_shapes	
:¬*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
validate_shape(*
T0

main/v/dense_1/bias/readIdentitymain/v/dense_1/bias*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias*
T0
§
main/v/dense_1/MatMulMatMulmain/v/dense/Relumain/v/dense_1/kernel/read*
T0*
transpose_b( *(
_output_shapes
:?????????¬*
transpose_a( 

main/v/dense_1/BiasAddBiasAddmain/v/dense_1/MatMulmain/v/dense_1/bias/read*(
_output_shapes
:?????????¬*
T0*
data_formatNHWC
f
main/v/dense_1/ReluRelumain/v/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????¬
±
6main/v/dense_2/kernel/Initializer/random_uniform/shapeConst*
dtype0*(
_class
loc:@main/v/dense_2/kernel*
valueB",     *
_output_shapes
:
£
4main/v/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 * Ύ*(
_class
loc:@main/v/dense_2/kernel
£
4main/v/dense_2/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
valueB
 * >*
dtype0*(
_class
loc:@main/v/dense_2/kernel

>main/v/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6main/v/dense_2/kernel/Initializer/random_uniform/shape*
T0*

seed *
seed2 *
dtype0*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel
ς
4main/v/dense_2/kernel/Initializer/random_uniform/subSub4main/v/dense_2/kernel/Initializer/random_uniform/max4main/v/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
: 

4main/v/dense_2/kernel/Initializer/random_uniform/mulMul>main/v/dense_2/kernel/Initializer/random_uniform/RandomUniform4main/v/dense_2/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬
χ
0main/v/dense_2/kernel/Initializer/random_uniformAdd4main/v/dense_2/kernel/Initializer/random_uniform/mul4main/v/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel
΅
main/v/dense_2/kernel
VariableV2*
	container *(
_class
loc:@main/v/dense_2/kernel*
shape:	¬*
_output_shapes
:	¬*
shared_name *
dtype0
μ
main/v/dense_2/kernel/AssignAssignmain/v/dense_2/kernel0main/v/dense_2/kernel/Initializer/random_uniform*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
T0

main/v/dense_2/kernel/readIdentitymain/v/dense_2/kernel*
_output_shapes
:	¬*
T0*(
_class
loc:@main/v/dense_2/kernel

%main/v/dense_2/bias/Initializer/zerosConst*
_output_shapes
:*
valueB*    *&
_class
loc:@main/v/dense_2/bias*
dtype0
§
main/v/dense_2/bias
VariableV2*&
_class
loc:@main/v/dense_2/bias*
	container *
_output_shapes
:*
dtype0*
shared_name *
shape:
Φ
main/v/dense_2/bias/AssignAssignmain/v/dense_2/bias%main/v/dense_2/bias/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*&
_class
loc:@main/v/dense_2/bias

main/v/dense_2/bias/readIdentitymain/v/dense_2/bias*
_output_shapes
:*
T0*&
_class
loc:@main/v/dense_2/bias
¨
main/v/dense_2/MatMulMatMulmain/v/dense_1/Relumain/v/dense_2/kernel/read*'
_output_shapes
:?????????*
T0*
transpose_a( *
transpose_b( 

main/v/dense_2/BiasAddBiasAddmain/v/dense_2/MatMulmain/v/dense_2/bias/read*
data_formatNHWC*'
_output_shapes
:?????????*
T0
v
main/v/SqueezeSqueezemain/v/dense_2/BiasAdd*#
_output_shapes
:?????????*
T0*
squeeze_dims

³
7target/pi/dense/kernel/Initializer/random_uniform/shapeConst*
dtype0*)
_class
loc:@target/pi/dense/kernel*
valueB"6     *
_output_shapes
:
₯
5target/pi/dense/kernel/Initializer/random_uniform/minConst*
dtype0*)
_class
loc:@target/pi/dense/kernel*
valueB
 *Hpλ½*
_output_shapes
: 
₯
5target/pi/dense/kernel/Initializer/random_uniform/maxConst*
valueB
 *Hpλ=*
dtype0*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
: 

?target/pi/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform7target/pi/dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
_output_shapes
:	6*

seed *)
_class
loc:@target/pi/dense/kernel*
seed2 
φ
5target/pi/dense/kernel/Initializer/random_uniform/subSub5target/pi/dense/kernel/Initializer/random_uniform/max5target/pi/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *)
_class
loc:@target/pi/dense/kernel

5target/pi/dense/kernel/Initializer/random_uniform/mulMul?target/pi/dense/kernel/Initializer/random_uniform/RandomUniform5target/pi/dense/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:	6
ϋ
1target/pi/dense/kernel/Initializer/random_uniformAdd5target/pi/dense/kernel/Initializer/random_uniform/mul5target/pi/dense/kernel/Initializer/random_uniform/min*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:	6*
T0
·
target/pi/dense/kernel
VariableV2*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:	6*
shared_name *
dtype0*
shape:	6*
	container 
π
target/pi/dense/kernel/AssignAssigntarget/pi/dense/kernel1target/pi/dense/kernel/Initializer/random_uniform*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	6*)
_class
loc:@target/pi/dense/kernel

target/pi/dense/kernel/readIdentitytarget/pi/dense/kernel*
_output_shapes
:	6*)
_class
loc:@target/pi/dense/kernel*
T0

&target/pi/dense/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:*
valueB*    *'
_class
loc:@target/pi/dense/bias
«
target/pi/dense/bias
VariableV2*'
_class
loc:@target/pi/dense/bias*
_output_shapes	
:*
shape:*
dtype0*
shared_name *
	container 
Ϋ
target/pi/dense/bias/AssignAssigntarget/pi/dense/bias&target/pi/dense/bias/Initializer/zeros*
T0*
_output_shapes	
:*
validate_shape(*
use_locking(*'
_class
loc:@target/pi/dense/bias

target/pi/dense/bias/readIdentitytarget/pi/dense/bias*
_output_shapes	
:*'
_class
loc:@target/pi/dense/bias*
T0
₯
target/pi/dense/MatMulMatMulPlaceholder_3target/pi/dense/kernel/read*
transpose_b( *(
_output_shapes
:?????????*
T0*
transpose_a( 

target/pi/dense/BiasAddBiasAddtarget/pi/dense/MatMultarget/pi/dense/bias/read*
data_formatNHWC*(
_output_shapes
:?????????*
T0
h
target/pi/dense/ReluRelutarget/pi/dense/BiasAdd*(
_output_shapes
:?????????*
T0
·
9target/pi/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"  ,  *
dtype0*
_output_shapes
:*+
_class!
loc:@target/pi/dense_1/kernel
©
7target/pi/dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 *£½½*+
_class!
loc:@target/pi/dense_1/kernel*
_output_shapes
: 
©
7target/pi/dense_1/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
valueB
 *£½=*+
_class!
loc:@target/pi/dense_1/kernel*
dtype0

Atarget/pi/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/pi/dense_1/kernel/Initializer/random_uniform/shape*
seed2 *
T0*+
_class!
loc:@target/pi/dense_1/kernel* 
_output_shapes
:
¬*
dtype0*

seed 
ώ
7target/pi/dense_1/kernel/Initializer/random_uniform/subSub7target/pi/dense_1/kernel/Initializer/random_uniform/max7target/pi/dense_1/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *+
_class!
loc:@target/pi/dense_1/kernel

7target/pi/dense_1/kernel/Initializer/random_uniform/mulMulAtarget/pi/dense_1/kernel/Initializer/random_uniform/RandomUniform7target/pi/dense_1/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/pi/dense_1/kernel

3target/pi/dense_1/kernel/Initializer/random_uniformAdd7target/pi/dense_1/kernel/Initializer/random_uniform/mul7target/pi/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/pi/dense_1/kernel
½
target/pi/dense_1/kernel
VariableV2*+
_class!
loc:@target/pi/dense_1/kernel*
shape:
¬*
dtype0* 
_output_shapes
:
¬*
shared_name *
	container 
ω
target/pi/dense_1/kernel/AssignAssigntarget/pi/dense_1/kernel3target/pi/dense_1/kernel/Initializer/random_uniform*
validate_shape(*
T0* 
_output_shapes
:
¬*
use_locking(*+
_class!
loc:@target/pi/dense_1/kernel

target/pi/dense_1/kernel/readIdentitytarget/pi/dense_1/kernel* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/pi/dense_1/kernel
’
(target/pi/dense_1/bias/Initializer/zerosConst*
dtype0*)
_class
loc:@target/pi/dense_1/bias*
valueB¬*    *
_output_shapes	
:¬
―
target/pi/dense_1/bias
VariableV2*
dtype0*
shape:¬*
shared_name *
	container *
_output_shapes	
:¬*)
_class
loc:@target/pi/dense_1/bias
γ
target/pi/dense_1/bias/AssignAssigntarget/pi/dense_1/bias(target/pi/dense_1/bias/Initializer/zeros*)
_class
loc:@target/pi/dense_1/bias*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:¬

target/pi/dense_1/bias/readIdentitytarget/pi/dense_1/bias*
T0*)
_class
loc:@target/pi/dense_1/bias*
_output_shapes	
:¬
°
target/pi/dense_1/MatMulMatMultarget/pi/dense/Relutarget/pi/dense_1/kernel/read*(
_output_shapes
:?????????¬*
T0*
transpose_b( *
transpose_a( 
₯
target/pi/dense_1/BiasAddBiasAddtarget/pi/dense_1/MatMultarget/pi/dense_1/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:?????????¬
l
target/pi/dense_1/ReluRelutarget/pi/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????¬
·
9target/pi/dense_2/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
dtype0*+
_class!
loc:@target/pi/dense_2/kernel*
valueB",     
©
7target/pi/dense_2/kernel/Initializer/random_uniform/minConst*
valueB
 *Υ Ύ*
_output_shapes
: *+
_class!
loc:@target/pi/dense_2/kernel*
dtype0
©
7target/pi/dense_2/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *Υ >*+
_class!
loc:@target/pi/dense_2/kernel

Atarget/pi/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/pi/dense_2/kernel/Initializer/random_uniform/shape*
dtype0*
seed2 *
_output_shapes
:	¬*
T0*+
_class!
loc:@target/pi/dense_2/kernel*

seed 
ώ
7target/pi/dense_2/kernel/Initializer/random_uniform/subSub7target/pi/dense_2/kernel/Initializer/random_uniform/max7target/pi/dense_2/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/pi/dense_2/kernel*
T0*
_output_shapes
: 

7target/pi/dense_2/kernel/Initializer/random_uniform/mulMulAtarget/pi/dense_2/kernel/Initializer/random_uniform/RandomUniform7target/pi/dense_2/kernel/Initializer/random_uniform/sub*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/pi/dense_2/kernel

3target/pi/dense_2/kernel/Initializer/random_uniformAdd7target/pi/dense_2/kernel/Initializer/random_uniform/mul7target/pi/dense_2/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/pi/dense_2/kernel*
_output_shapes
:	¬
»
target/pi/dense_2/kernel
VariableV2*
	container *
_output_shapes
:	¬*
shared_name *
dtype0*
shape:	¬*+
_class!
loc:@target/pi/dense_2/kernel
ψ
target/pi/dense_2/kernel/AssignAssigntarget/pi/dense_2/kernel3target/pi/dense_2/kernel/Initializer/random_uniform*
_output_shapes
:	¬*
validate_shape(*
T0*
use_locking(*+
_class!
loc:@target/pi/dense_2/kernel

target/pi/dense_2/kernel/readIdentitytarget/pi/dense_2/kernel*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel*
T0
 
(target/pi/dense_2/bias/Initializer/zerosConst*)
_class
loc:@target/pi/dense_2/bias*
_output_shapes
:*
dtype0*
valueB*    
­
target/pi/dense_2/bias
VariableV2*)
_class
loc:@target/pi/dense_2/bias*
shared_name *
_output_shapes
:*
shape:*
dtype0*
	container 
β
target/pi/dense_2/bias/AssignAssigntarget/pi/dense_2/bias(target/pi/dense_2/bias/Initializer/zeros*
validate_shape(*
T0*)
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
transpose_b( *'
_output_shapes
:?????????*
transpose_a( *
T0
€
target/pi/dense_2/BiasAddBiasAddtarget/pi/dense_2/MatMultarget/pi/dense_2/bias/read*'
_output_shapes
:?????????*
T0*
data_formatNHWC
·
9target/pi/dense_3/kernel/Initializer/random_uniform/shapeConst*
valueB",     *
dtype0*+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
:
©
7target/pi/dense_3/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *Υ Ύ
©
7target/pi/dense_3/kernel/Initializer/random_uniform/maxConst*
dtype0*
valueB
 *Υ >*
_output_shapes
: *+
_class!
loc:@target/pi/dense_3/kernel

Atarget/pi/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/pi/dense_3/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*
_output_shapes
:	¬*

seed *
T0*+
_class!
loc:@target/pi/dense_3/kernel
ώ
7target/pi/dense_3/kernel/Initializer/random_uniform/subSub7target/pi/dense_3/kernel/Initializer/random_uniform/max7target/pi/dense_3/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
: 

7target/pi/dense_3/kernel/Initializer/random_uniform/mulMulAtarget/pi/dense_3/kernel/Initializer/random_uniform/RandomUniform7target/pi/dense_3/kernel/Initializer/random_uniform/sub*+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
:	¬*
T0
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
loc:@target/pi/dense_3/kernel*
shared_name *
	container *
_output_shapes
:	¬*
shape:	¬*
dtype0
ψ
target/pi/dense_3/kernel/AssignAssigntarget/pi/dense_3/kernel3target/pi/dense_3/kernel/Initializer/random_uniform*
_output_shapes
:	¬*
T0*
validate_shape(*
use_locking(*+
_class!
loc:@target/pi/dense_3/kernel

target/pi/dense_3/kernel/readIdentitytarget/pi/dense_3/kernel*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_3/kernel
 
(target/pi/dense_3/bias/Initializer/zerosConst*)
_class
loc:@target/pi/dense_3/bias*
dtype0*
_output_shapes
:*
valueB*    
­
target/pi/dense_3/bias
VariableV2*
dtype0*)
_class
loc:@target/pi/dense_3/bias*
_output_shapes
:*
	container *
shared_name *
shape:
β
target/pi/dense_3/bias/AssignAssigntarget/pi/dense_3/bias(target/pi/dense_3/bias/Initializer/zeros*
_output_shapes
:*
T0*
use_locking(*)
_class
loc:@target/pi/dense_3/bias*
validate_shape(

target/pi/dense_3/bias/readIdentitytarget/pi/dense_3/bias*
T0*
_output_shapes
:*)
_class
loc:@target/pi/dense_3/bias
±
target/pi/dense_3/MatMulMatMultarget/pi/dense_1/Relutarget/pi/dense_3/kernel/read*'
_output_shapes
:?????????*
transpose_b( *
T0*
transpose_a( 
€
target/pi/dense_3/BiasAddBiasAddtarget/pi/dense_3/MatMultarget/pi/dense_3/bias/read*
data_formatNHWC*'
_output_shapes
:?????????*
T0
k
target/pi/dense_3/TanhTanhtarget/pi/dense_3/BiasAdd*
T0*'
_output_shapes
:?????????
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
:?????????*
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
:?????????*
T0
V
target/pi/add_1/xConst*
dtype0*
valueB
 *   Α*
_output_shapes
: 
l
target/pi/add_1AddV2target/pi/add_1/xtarget/pi/mul*
T0*'
_output_shapes
:?????????
W
target/pi/ExpExptarget/pi/add_1*'
_output_shapes
:?????????*
T0
h
target/pi/ShapeShapetarget/pi/dense_2/BiasAdd*
out_type0*
T0*
_output_shapes
:
a
target/pi/random_normal/meanConst*
_output_shapes
: *
valueB
 *    *
dtype0
c
target/pi/random_normal/stddevConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
­
,target/pi/random_normal/RandomStandardNormalRandomStandardNormaltarget/pi/Shape*'
_output_shapes
:?????????*
seed2 *
T0*

seed *
dtype0
’
target/pi/random_normal/mulMul,target/pi/random_normal/RandomStandardNormaltarget/pi/random_normal/stddev*
T0*'
_output_shapes
:?????????

target/pi/random_normalAddtarget/pi/random_normal/multarget/pi/random_normal/mean*'
_output_shapes
:?????????*
T0
p
target/pi/mul_1Multarget/pi/random_normaltarget/pi/Exp*
T0*'
_output_shapes
:?????????
v
target/pi/add_2AddV2target/pi/dense_2/BiasAddtarget/pi/mul_1*
T0*'
_output_shapes
:?????????
r
target/pi/subSubtarget/pi/add_2target/pi/dense_2/BiasAdd*'
_output_shapes
:?????????*
T0
Y
target/pi/Exp_1Exptarget/pi/add_1*
T0*'
_output_shapes
:?????????
V
target/pi/add_3/yConst*
_output_shapes
: *
valueB
 *wΜ+2*
dtype0
n
target/pi/add_3AddV2target/pi/Exp_1target/pi/add_3/y*'
_output_shapes
:?????????*
T0
n
target/pi/truedivRealDivtarget/pi/subtarget/pi/add_3*
T0*'
_output_shapes
:?????????
T
target/pi/pow/yConst*
valueB
 *   @*
_output_shapes
: *
dtype0
j
target/pi/powPowtarget/pi/truedivtarget/pi/pow/y*'
_output_shapes
:?????????*
T0
V
target/pi/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @
l
target/pi/mul_2Multarget/pi/mul_2/xtarget/pi/add_1*
T0*'
_output_shapes
:?????????
j
target/pi/add_4AddV2target/pi/powtarget/pi/mul_2*
T0*'
_output_shapes
:?????????
V
target/pi/add_5/yConst*
dtype0*
valueB
 *?λ?*
_output_shapes
: 
n
target/pi/add_5AddV2target/pi/add_4target/pi/add_5/y*
T0*'
_output_shapes
:?????????
V
target/pi/mul_3/xConst*
valueB
 *   Ώ*
_output_shapes
: *
dtype0
l
target/pi/mul_3Multarget/pi/mul_3/xtarget/pi/add_5*
T0*'
_output_shapes
:?????????
a
target/pi/Sum/reduction_indicesConst*
dtype0*
value	B :*
_output_shapes
: 

target/pi/SumSumtarget/pi/mul_3target/pi/Sum/reduction_indices*
T0*#
_output_shapes
:?????????*

Tidx0*
	keep_dims( 
c
target/pi/TanhTanhtarget/pi/dense_2/BiasAdd*
T0*'
_output_shapes
:?????????
[
target/pi/Tanh_1Tanhtarget/pi/add_2*'
_output_shapes
:?????????*
T0
V
target/pi/pow_1/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
m
target/pi/pow_1Powtarget/pi/Tanh_1target/pi/pow_1/y*'
_output_shapes
:?????????*
T0
V
target/pi/sub_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
l
target/pi/sub_1Subtarget/pi/sub_1/xtarget/pi/pow_1*'
_output_shapes
:?????????*
T0
X
target/pi/Greater/yConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
t
target/pi/GreaterGreatertarget/pi/sub_1target/pi/Greater/y*'
_output_shapes
:?????????*
T0
z
target/pi/CastCasttarget/pi/Greater*'
_output_shapes
:?????????*

DstT0*

SrcT0
*
Truncate( 
U
target/pi/Less/yConst*
_output_shapes
: *
valueB
 *    *
dtype0
k
target/pi/LessLesstarget/pi/sub_1target/pi/Less/y*
T0*'
_output_shapes
:?????????
y
target/pi/Cast_1Casttarget/pi/Less*

DstT0*
Truncate( *'
_output_shapes
:?????????*

SrcT0

V
target/pi/sub_2/xConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
l
target/pi/sub_2Subtarget/pi/sub_2/xtarget/pi/sub_1*'
_output_shapes
:?????????*
T0
i
target/pi/mul_4Multarget/pi/sub_2target/pi/Cast*'
_output_shapes
:?????????*
T0
V
target/pi/sub_3/xConst*
valueB
 *    *
dtype0*
_output_shapes
: 
l
target/pi/sub_3Subtarget/pi/sub_3/xtarget/pi/sub_1*'
_output_shapes
:?????????*
T0
k
target/pi/mul_5Multarget/pi/sub_3target/pi/Cast_1*
T0*'
_output_shapes
:?????????
l
target/pi/add_6AddV2target/pi/mul_4target/pi/mul_5*
T0*'
_output_shapes
:?????????
i
target/pi/StopGradientStopGradienttarget/pi/add_6*'
_output_shapes
:?????????*
T0
s
target/pi/add_7AddV2target/pi/sub_1target/pi/StopGradient*'
_output_shapes
:?????????*
T0
V
target/pi/add_8/yConst*
dtype0*
valueB
 *½75*
_output_shapes
: 
n
target/pi/add_8AddV2target/pi/add_7target/pi/add_8/y*
T0*'
_output_shapes
:?????????
W
target/pi/LogLogtarget/pi/add_8*'
_output_shapes
:?????????*
T0
c
!target/pi/Sum_1/reduction_indicesConst*
_output_shapes
: *
value	B :*
dtype0

target/pi/Sum_1Sumtarget/pi/Log!target/pi/Sum_1/reduction_indices*#
_output_shapes
:?????????*

Tidx0*
T0*
	keep_dims( 
d
target/pi/sub_4Subtarget/pi/Sumtarget/pi/Sum_1*#
_output_shapes
:?????????*
T0
Q
target/mul/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
a

target/mulMultarget/pi/Tanhtarget/mul/y*
T0*'
_output_shapes
:?????????
S
target/mul_1/yConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
g
target/mul_1Multarget/pi/Tanh_1target/mul_1/y*'
_output_shapes
:?????????*
T0
`
target/q1/concat/axisConst*
valueB :
?????????*
_output_shapes
: *
dtype0

target/q1/concatConcatV2Placeholder_3Placeholder_2target/q1/concat/axis*
N*
T0*'
_output_shapes
:?????????B*

Tidx0
³
7target/q1/dense/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:*
valueB"B     *
dtype0
₯
5target/q1/dense/kernel/Initializer/random_uniform/minConst*)
_class
loc:@target/q1/dense/kernel*
valueB
 *.cθ½*
_output_shapes
: *
dtype0
₯
5target/q1/dense/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *.cθ=*)
_class
loc:@target/q1/dense/kernel

?target/q1/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform7target/q1/dense/kernel/Initializer/random_uniform/shape*
T0*
seed2 *)
_class
loc:@target/q1/dense/kernel*
dtype0*

seed *
_output_shapes
:	B
φ
5target/q1/dense/kernel/Initializer/random_uniform/subSub5target/q1/dense/kernel/Initializer/random_uniform/max5target/q1/dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@target/q1/dense/kernel

5target/q1/dense/kernel/Initializer/random_uniform/mulMul?target/q1/dense/kernel/Initializer/random_uniform/RandomUniform5target/q1/dense/kernel/Initializer/random_uniform/sub*)
_class
loc:@target/q1/dense/kernel*
T0*
_output_shapes
:	B
ϋ
1target/q1/dense/kernel/Initializer/random_uniformAdd5target/q1/dense/kernel/Initializer/random_uniform/mul5target/q1/dense/kernel/Initializer/random_uniform/min*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:	B*
T0
·
target/q1/dense/kernel
VariableV2*
shared_name *
shape:	B*)
_class
loc:@target/q1/dense/kernel*
	container *
dtype0*
_output_shapes
:	B
π
target/q1/dense/kernel/AssignAssigntarget/q1/dense/kernel1target/q1/dense/kernel/Initializer/random_uniform*)
_class
loc:@target/q1/dense/kernel*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	B

target/q1/dense/kernel/readIdentitytarget/q1/dense/kernel*)
_class
loc:@target/q1/dense/kernel*
_output_shapes
:	B*
T0

&target/q1/dense/bias/Initializer/zerosConst*'
_class
loc:@target/q1/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
«
target/q1/dense/bias
VariableV2*
_output_shapes	
:*
	container *
shared_name *
dtype0*'
_class
loc:@target/q1/dense/bias*
shape:
Ϋ
target/q1/dense/bias/AssignAssigntarget/q1/dense/bias&target/q1/dense/bias/Initializer/zeros*
_output_shapes	
:*
T0*
use_locking(*'
_class
loc:@target/q1/dense/bias*
validate_shape(

target/q1/dense/bias/readIdentitytarget/q1/dense/bias*
_output_shapes	
:*'
_class
loc:@target/q1/dense/bias*
T0
¨
target/q1/dense/MatMulMatMultarget/q1/concattarget/q1/dense/kernel/read*
transpose_a( *
transpose_b( *(
_output_shapes
:?????????*
T0

target/q1/dense/BiasAddBiasAddtarget/q1/dense/MatMultarget/q1/dense/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:?????????
h
target/q1/dense/ReluRelutarget/q1/dense/BiasAdd*
T0*(
_output_shapes
:?????????
·
9target/q1/dense_1/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*+
_class!
loc:@target/q1/dense_1/kernel*
dtype0*
valueB"  ,  
©
7target/q1/dense_1/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@target/q1/dense_1/kernel*
valueB
 *£½½*
dtype0*
_output_shapes
: 
©
7target/q1/dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *£½=*+
_class!
loc:@target/q1/dense_1/kernel*
dtype0*
_output_shapes
: 

Atarget/q1/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q1/dense_1/kernel/Initializer/random_uniform/shape*

seed * 
_output_shapes
:
¬*
seed2 *
dtype0*
T0*+
_class!
loc:@target/q1/dense_1/kernel
ώ
7target/q1/dense_1/kernel/Initializer/random_uniform/subSub7target/q1/dense_1/kernel/Initializer/random_uniform/max7target/q1/dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *+
_class!
loc:@target/q1/dense_1/kernel*
T0

7target/q1/dense_1/kernel/Initializer/random_uniform/mulMulAtarget/q1/dense_1/kernel/Initializer/random_uniform/RandomUniform7target/q1/dense_1/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬

3target/q1/dense_1/kernel/Initializer/random_uniformAdd7target/q1/dense_1/kernel/Initializer/random_uniform/mul7target/q1/dense_1/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬
½
target/q1/dense_1/kernel
VariableV2*+
_class!
loc:@target/q1/dense_1/kernel*
dtype0* 
_output_shapes
:
¬*
	container *
shared_name *
shape:
¬
ω
target/q1/dense_1/kernel/AssignAssigntarget/q1/dense_1/kernel3target/q1/dense_1/kernel/Initializer/random_uniform*+
_class!
loc:@target/q1/dense_1/kernel*
T0* 
_output_shapes
:
¬*
use_locking(*
validate_shape(

target/q1/dense_1/kernel/readIdentitytarget/q1/dense_1/kernel*
T0*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬
’
(target/q1/dense_1/bias/Initializer/zerosConst*
dtype0*)
_class
loc:@target/q1/dense_1/bias*
valueB¬*    *
_output_shapes	
:¬
―
target/q1/dense_1/bias
VariableV2*
shared_name *
shape:¬*
	container *
_output_shapes	
:¬*)
_class
loc:@target/q1/dense_1/bias*
dtype0
γ
target/q1/dense_1/bias/AssignAssigntarget/q1/dense_1/bias(target/q1/dense_1/bias/Initializer/zeros*
T0*
use_locking(*)
_class
loc:@target/q1/dense_1/bias*
validate_shape(*
_output_shapes	
:¬

target/q1/dense_1/bias/readIdentitytarget/q1/dense_1/bias*)
_class
loc:@target/q1/dense_1/bias*
T0*
_output_shapes	
:¬
°
target/q1/dense_1/MatMulMatMultarget/q1/dense/Relutarget/q1/dense_1/kernel/read*
T0*
transpose_b( *(
_output_shapes
:?????????¬*
transpose_a( 
₯
target/q1/dense_1/BiasAddBiasAddtarget/q1/dense_1/MatMultarget/q1/dense_1/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:?????????¬
l
target/q1/dense_1/ReluRelutarget/q1/dense_1/BiasAdd*(
_output_shapes
:?????????¬*
T0
·
9target/q1/dense_2/kernel/Initializer/random_uniform/shapeConst*
dtype0*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
:*
valueB",     
©
7target/q1/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 * Ύ*+
_class!
loc:@target/q1/dense_2/kernel
©
7target/q1/dense_2/kernel/Initializer/random_uniform/maxConst*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 * >

Atarget/q1/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q1/dense_2/kernel/Initializer/random_uniform/shape*

seed *
T0*
_output_shapes
:	¬*
seed2 *
dtype0*+
_class!
loc:@target/q1/dense_2/kernel
ώ
7target/q1/dense_2/kernel/Initializer/random_uniform/subSub7target/q1/dense_2/kernel/Initializer/random_uniform/max7target/q1/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *+
_class!
loc:@target/q1/dense_2/kernel

7target/q1/dense_2/kernel/Initializer/random_uniform/mulMulAtarget/q1/dense_2/kernel/Initializer/random_uniform/RandomUniform7target/q1/dense_2/kernel/Initializer/random_uniform/sub*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/q1/dense_2/kernel

3target/q1/dense_2/kernel/Initializer/random_uniformAdd7target/q1/dense_2/kernel/Initializer/random_uniform/mul7target/q1/dense_2/kernel/Initializer/random_uniform/min*+
_class!
loc:@target/q1/dense_2/kernel*
T0*
_output_shapes
:	¬
»
target/q1/dense_2/kernel
VariableV2*
	container *+
_class!
loc:@target/q1/dense_2/kernel*
dtype0*
shape:	¬*
shared_name *
_output_shapes
:	¬
ψ
target/q1/dense_2/kernel/AssignAssigntarget/q1/dense_2/kernel3target/q1/dense_2/kernel/Initializer/random_uniform*
validate_shape(*
use_locking(*+
_class!
loc:@target/q1/dense_2/kernel*
T0*
_output_shapes
:	¬

target/q1/dense_2/kernel/readIdentitytarget/q1/dense_2/kernel*
T0*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
:	¬
 
(target/q1/dense_2/bias/Initializer/zerosConst*)
_class
loc:@target/q1/dense_2/bias*
_output_shapes
:*
dtype0*
valueB*    
­
target/q1/dense_2/bias
VariableV2*
	container *
_output_shapes
:*
dtype0*
shared_name *
shape:*)
_class
loc:@target/q1/dense_2/bias
β
target/q1/dense_2/bias/AssignAssigntarget/q1/dense_2/bias(target/q1/dense_2/bias/Initializer/zeros*
validate_shape(*
_output_shapes
:*
use_locking(*)
_class
loc:@target/q1/dense_2/bias*
T0

target/q1/dense_2/bias/readIdentitytarget/q1/dense_2/bias*
_output_shapes
:*)
_class
loc:@target/q1/dense_2/bias*
T0
±
target/q1/dense_2/MatMulMatMultarget/q1/dense_1/Relutarget/q1/dense_2/kernel/read*
transpose_b( *'
_output_shapes
:?????????*
T0*
transpose_a( 
€
target/q1/dense_2/BiasAddBiasAddtarget/q1/dense_2/MatMultarget/q1/dense_2/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:?????????
|
target/q1/SqueezeSqueezetarget/q1/dense_2/BiasAdd*
T0*
squeeze_dims
*#
_output_shapes
:?????????
b
target/q1_1/concat/axisConst*
dtype0*
_output_shapes
: *
valueB :
?????????

target/q1_1/concatConcatV2Placeholder_3target/mul_1target/q1_1/concat/axis*
N*

Tidx0*
T0*'
_output_shapes
:?????????B
¬
target/q1_1/dense/MatMulMatMultarget/q1_1/concattarget/q1/dense/kernel/read*(
_output_shapes
:?????????*
transpose_a( *
transpose_b( *
T0
£
target/q1_1/dense/BiasAddBiasAddtarget/q1_1/dense/MatMultarget/q1/dense/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:?????????
l
target/q1_1/dense/ReluRelutarget/q1_1/dense/BiasAdd*(
_output_shapes
:?????????*
T0
΄
target/q1_1/dense_1/MatMulMatMultarget/q1_1/dense/Relutarget/q1/dense_1/kernel/read*(
_output_shapes
:?????????¬*
T0*
transpose_b( *
transpose_a( 
©
target/q1_1/dense_1/BiasAddBiasAddtarget/q1_1/dense_1/MatMultarget/q1/dense_1/bias/read*(
_output_shapes
:?????????¬*
T0*
data_formatNHWC
p
target/q1_1/dense_1/ReluRelutarget/q1_1/dense_1/BiasAdd*(
_output_shapes
:?????????¬*
T0
΅
target/q1_1/dense_2/MatMulMatMultarget/q1_1/dense_1/Relutarget/q1/dense_2/kernel/read*
T0*
transpose_a( *
transpose_b( *'
_output_shapes
:?????????
¨
target/q1_1/dense_2/BiasAddBiasAddtarget/q1_1/dense_2/MatMultarget/q1/dense_2/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:?????????

target/q1_1/SqueezeSqueezetarget/q1_1/dense_2/BiasAdd*#
_output_shapes
:?????????*
T0*
squeeze_dims

`
target/q2/concat/axisConst*
valueB :
?????????*
dtype0*
_output_shapes
: 

target/q2/concatConcatV2Placeholder_3Placeholder_2target/q2/concat/axis*

Tidx0*
N*
T0*'
_output_shapes
:?????????B
³
7target/q2/dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
dtype0*)
_class
loc:@target/q2/dense/kernel*
valueB"B     
₯
5target/q2/dense/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *.cθ½*)
_class
loc:@target/q2/dense/kernel
₯
5target/q2/dense/kernel/Initializer/random_uniform/maxConst*
valueB
 *.cθ=*)
_class
loc:@target/q2/dense/kernel*
dtype0*
_output_shapes
: 

?target/q2/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform7target/q2/dense/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*
T0*

seed *
_output_shapes
:	B*)
_class
loc:@target/q2/dense/kernel
φ
5target/q2/dense/kernel/Initializer/random_uniform/subSub5target/q2/dense/kernel/Initializer/random_uniform/max5target/q2/dense/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
: 

5target/q2/dense/kernel/Initializer/random_uniform/mulMul?target/q2/dense/kernel/Initializer/random_uniform/RandomUniform5target/q2/dense/kernel/Initializer/random_uniform/sub*
_output_shapes
:	B*
T0*)
_class
loc:@target/q2/dense/kernel
ϋ
1target/q2/dense/kernel/Initializer/random_uniformAdd5target/q2/dense/kernel/Initializer/random_uniform/mul5target/q2/dense/kernel/Initializer/random_uniform/min*
_output_shapes
:	B*)
_class
loc:@target/q2/dense/kernel*
T0
·
target/q2/dense/kernel
VariableV2*
	container *
_output_shapes
:	B*)
_class
loc:@target/q2/dense/kernel*
shared_name *
shape:	B*
dtype0
π
target/q2/dense/kernel/AssignAssigntarget/q2/dense/kernel1target/q2/dense/kernel/Initializer/random_uniform*
validate_shape(*
_output_shapes
:	B*
T0*
use_locking(*)
_class
loc:@target/q2/dense/kernel

target/q2/dense/kernel/readIdentitytarget/q2/dense/kernel*
T0*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
:	B

&target/q2/dense/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:*'
_class
loc:@target/q2/dense/bias*
valueB*    
«
target/q2/dense/bias
VariableV2*
dtype0*
shared_name *
shape:*
_output_shapes	
:*'
_class
loc:@target/q2/dense/bias*
	container 
Ϋ
target/q2/dense/bias/AssignAssigntarget/q2/dense/bias&target/q2/dense/bias/Initializer/zeros*
T0*
validate_shape(*
_output_shapes	
:*
use_locking(*'
_class
loc:@target/q2/dense/bias

target/q2/dense/bias/readIdentitytarget/q2/dense/bias*'
_class
loc:@target/q2/dense/bias*
_output_shapes	
:*
T0
¨
target/q2/dense/MatMulMatMultarget/q2/concattarget/q2/dense/kernel/read*
transpose_a( *(
_output_shapes
:?????????*
transpose_b( *
T0

target/q2/dense/BiasAddBiasAddtarget/q2/dense/MatMultarget/q2/dense/bias/read*
T0*(
_output_shapes
:?????????*
data_formatNHWC
h
target/q2/dense/ReluRelutarget/q2/dense/BiasAdd*
T0*(
_output_shapes
:?????????
·
9target/q2/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"  ,  *
dtype0*+
_class!
loc:@target/q2/dense_1/kernel*
_output_shapes
:
©
7target/q2/dense_1/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@target/q2/dense_1/kernel*
valueB
 *£½½*
_output_shapes
: *
dtype0
©
7target/q2/dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *£½=*+
_class!
loc:@target/q2/dense_1/kernel*
dtype0*
_output_shapes
: 

Atarget/q2/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q2/dense_1/kernel/Initializer/random_uniform/shape* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/q2/dense_1/kernel*
seed2 *

seed *
dtype0
ώ
7target/q2/dense_1/kernel/Initializer/random_uniform/subSub7target/q2/dense_1/kernel/Initializer/random_uniform/max7target/q2/dense_1/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/q2/dense_1/kernel*
_output_shapes
: 

7target/q2/dense_1/kernel/Initializer/random_uniform/mulMulAtarget/q2/dense_1/kernel/Initializer/random_uniform/RandomUniform7target/q2/dense_1/kernel/Initializer/random_uniform/sub*+
_class!
loc:@target/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬

3target/q2/dense_1/kernel/Initializer/random_uniformAdd7target/q2/dense_1/kernel/Initializer/random_uniform/mul7target/q2/dense_1/kernel/Initializer/random_uniform/min*
T0* 
_output_shapes
:
¬*+
_class!
loc:@target/q2/dense_1/kernel
½
target/q2/dense_1/kernel
VariableV2*
	container *+
_class!
loc:@target/q2/dense_1/kernel*
shape:
¬* 
_output_shapes
:
¬*
dtype0*
shared_name 
ω
target/q2/dense_1/kernel/AssignAssigntarget/q2/dense_1/kernel3target/q2/dense_1/kernel/Initializer/random_uniform*
T0*
use_locking(*
validate_shape(*+
_class!
loc:@target/q2/dense_1/kernel* 
_output_shapes
:
¬

target/q2/dense_1/kernel/readIdentitytarget/q2/dense_1/kernel* 
_output_shapes
:
¬*
T0*+
_class!
loc:@target/q2/dense_1/kernel
’
(target/q2/dense_1/bias/Initializer/zerosConst*
_output_shapes	
:¬*
valueB¬*    *)
_class
loc:@target/q2/dense_1/bias*
dtype0
―
target/q2/dense_1/bias
VariableV2*
	container *
shared_name *
_output_shapes	
:¬*)
_class
loc:@target/q2/dense_1/bias*
shape:¬*
dtype0
γ
target/q2/dense_1/bias/AssignAssigntarget/q2/dense_1/bias(target/q2/dense_1/bias/Initializer/zeros*
_output_shapes	
:¬*
validate_shape(*)
_class
loc:@target/q2/dense_1/bias*
T0*
use_locking(

target/q2/dense_1/bias/readIdentitytarget/q2/dense_1/bias*)
_class
loc:@target/q2/dense_1/bias*
T0*
_output_shapes	
:¬
°
target/q2/dense_1/MatMulMatMultarget/q2/dense/Relutarget/q2/dense_1/kernel/read*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:?????????¬
₯
target/q2/dense_1/BiasAddBiasAddtarget/q2/dense_1/MatMultarget/q2/dense_1/bias/read*(
_output_shapes
:?????????¬*
data_formatNHWC*
T0
l
target/q2/dense_1/ReluRelutarget/q2/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????¬
·
9target/q2/dense_2/kernel/Initializer/random_uniform/shapeConst*
valueB",     *+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:*
dtype0
©
7target/q2/dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
valueB
 * Ύ*
_output_shapes
: *+
_class!
loc:@target/q2/dense_2/kernel
©
7target/q2/dense_2/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *+
_class!
loc:@target/q2/dense_2/kernel*
valueB
 * >*
dtype0

Atarget/q2/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9target/q2/dense_2/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*
T0*
_output_shapes
:	¬*

seed *+
_class!
loc:@target/q2/dense_2/kernel
ώ
7target/q2/dense_2/kernel/Initializer/random_uniform/subSub7target/q2/dense_2/kernel/Initializer/random_uniform/max7target/q2/dense_2/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*+
_class!
loc:@target/q2/dense_2/kernel

7target/q2/dense_2/kernel/Initializer/random_uniform/mulMulAtarget/q2/dense_2/kernel/Initializer/random_uniform/RandomUniform7target/q2/dense_2/kernel/Initializer/random_uniform/sub*
T0*
_output_shapes
:	¬*+
_class!
loc:@target/q2/dense_2/kernel

3target/q2/dense_2/kernel/Initializer/random_uniformAdd7target/q2/dense_2/kernel/Initializer/random_uniform/mul7target/q2/dense_2/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬
»
target/q2/dense_2/kernel
VariableV2*
_output_shapes
:	¬*
shared_name *
	container *+
_class!
loc:@target/q2/dense_2/kernel*
shape:	¬*
dtype0
ψ
target/q2/dense_2/kernel/AssignAssigntarget/q2/dense_2/kernel3target/q2/dense_2/kernel/Initializer/random_uniform*
T0*
use_locking(*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(

target/q2/dense_2/kernel/readIdentitytarget/q2/dense_2/kernel*
_output_shapes
:	¬*+
_class!
loc:@target/q2/dense_2/kernel*
T0
 
(target/q2/dense_2/bias/Initializer/zerosConst*
dtype0*
valueB*    *)
_class
loc:@target/q2/dense_2/bias*
_output_shapes
:
­
target/q2/dense_2/bias
VariableV2*)
_class
loc:@target/q2/dense_2/bias*
shared_name *
_output_shapes
:*
dtype0*
	container *
shape:
β
target/q2/dense_2/bias/AssignAssigntarget/q2/dense_2/bias(target/q2/dense_2/bias/Initializer/zeros*
validate_shape(*
T0*
use_locking(*)
_class
loc:@target/q2/dense_2/bias*
_output_shapes
:

target/q2/dense_2/bias/readIdentitytarget/q2/dense_2/bias*
T0*
_output_shapes
:*)
_class
loc:@target/q2/dense_2/bias
±
target/q2/dense_2/MatMulMatMultarget/q2/dense_1/Relutarget/q2/dense_2/kernel/read*'
_output_shapes
:?????????*
transpose_a( *
T0*
transpose_b( 
€
target/q2/dense_2/BiasAddBiasAddtarget/q2/dense_2/MatMultarget/q2/dense_2/bias/read*'
_output_shapes
:?????????*
data_formatNHWC*
T0
|
target/q2/SqueezeSqueezetarget/q2/dense_2/BiasAdd*#
_output_shapes
:?????????*
squeeze_dims
*
T0
b
target/q2_1/concat/axisConst*
dtype0*
valueB :
?????????*
_output_shapes
: 

target/q2_1/concatConcatV2Placeholder_3target/mul_1target/q2_1/concat/axis*
T0*
N*'
_output_shapes
:?????????B*

Tidx0
¬
target/q2_1/dense/MatMulMatMultarget/q2_1/concattarget/q2/dense/kernel/read*(
_output_shapes
:?????????*
transpose_a( *
transpose_b( *
T0
£
target/q2_1/dense/BiasAddBiasAddtarget/q2_1/dense/MatMultarget/q2/dense/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:?????????
l
target/q2_1/dense/ReluRelutarget/q2_1/dense/BiasAdd*
T0*(
_output_shapes
:?????????
΄
target/q2_1/dense_1/MatMulMatMultarget/q2_1/dense/Relutarget/q2/dense_1/kernel/read*
transpose_b( *
T0*(
_output_shapes
:?????????¬*
transpose_a( 
©
target/q2_1/dense_1/BiasAddBiasAddtarget/q2_1/dense_1/MatMultarget/q2/dense_1/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:?????????¬
p
target/q2_1/dense_1/ReluRelutarget/q2_1/dense_1/BiasAdd*(
_output_shapes
:?????????¬*
T0
΅
target/q2_1/dense_2/MatMulMatMultarget/q2_1/dense_1/Relutarget/q2/dense_2/kernel/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:?????????
¨
target/q2_1/dense_2/BiasAddBiasAddtarget/q2_1/dense_2/MatMultarget/q2/dense_2/bias/read*
data_formatNHWC*
T0*'
_output_shapes
:?????????

target/q2_1/SqueezeSqueezetarget/q2_1/dense_2/BiasAdd*
squeeze_dims
*#
_output_shapes
:?????????*
T0
±
6target/v/dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
valueB"6     *(
_class
loc:@target/v/dense/kernel*
dtype0
£
4target/v/dense/kernel/Initializer/random_uniform/minConst*(
_class
loc:@target/v/dense/kernel*
dtype0*
valueB
 *Hpλ½*
_output_shapes
: 
£
4target/v/dense/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@target/v/dense/kernel*
_output_shapes
: *
valueB
 *Hpλ=*
dtype0

>target/v/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform6target/v/dense/kernel/Initializer/random_uniform/shape*(
_class
loc:@target/v/dense/kernel*

seed *
T0*
dtype0*
seed2 *
_output_shapes
:	6
ς
4target/v/dense/kernel/Initializer/random_uniform/subSub4target/v/dense/kernel/Initializer/random_uniform/max4target/v/dense/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
: *(
_class
loc:@target/v/dense/kernel

4target/v/dense/kernel/Initializer/random_uniform/mulMul>target/v/dense/kernel/Initializer/random_uniform/RandomUniform4target/v/dense/kernel/Initializer/random_uniform/sub*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
T0
χ
0target/v/dense/kernel/Initializer/random_uniformAdd4target/v/dense/kernel/Initializer/random_uniform/mul4target/v/dense/kernel/Initializer/random_uniform/min*(
_class
loc:@target/v/dense/kernel*
T0*
_output_shapes
:	6
΅
target/v/dense/kernel
VariableV2*
shared_name *(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
shape:	6*
	container *
dtype0
μ
target/v/dense/kernel/AssignAssigntarget/v/dense/kernel0target/v/dense/kernel/Initializer/random_uniform*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
validate_shape(*
T0*
use_locking(

target/v/dense/kernel/readIdentitytarget/v/dense/kernel*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
T0
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
	container *
shape:*&
_class
loc:@target/v/dense/bias*
shared_name *
_output_shapes	
:*
dtype0
Χ
target/v/dense/bias/AssignAssigntarget/v/dense/bias%target/v/dense/bias/Initializer/zeros*&
_class
loc:@target/v/dense/bias*
validate_shape(*
T0*
use_locking(*
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
target/v/dense/MatMulMatMulPlaceholder_3target/v/dense/kernel/read*(
_output_shapes
:?????????*
T0*
transpose_a( *
transpose_b( 

target/v/dense/BiasAddBiasAddtarget/v/dense/MatMultarget/v/dense/bias/read*
T0*(
_output_shapes
:?????????*
data_formatNHWC
f
target/v/dense/ReluRelutarget/v/dense/BiasAdd*(
_output_shapes
:?????????*
T0
΅
8target/v/dense_1/kernel/Initializer/random_uniform/shapeConst**
_class 
loc:@target/v/dense_1/kernel*
dtype0*
_output_shapes
:*
valueB"  ,  
§
6target/v/dense_1/kernel/Initializer/random_uniform/minConst*
_output_shapes
: **
_class 
loc:@target/v/dense_1/kernel*
valueB
 *£½½*
dtype0
§
6target/v/dense_1/kernel/Initializer/random_uniform/maxConst**
_class 
loc:@target/v/dense_1/kernel*
dtype0*
valueB
 *£½=*
_output_shapes
: 

@target/v/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform8target/v/dense_1/kernel/Initializer/random_uniform/shape* 
_output_shapes
:
¬*
seed2 *

seed *
dtype0**
_class 
loc:@target/v/dense_1/kernel*
T0
ϊ
6target/v/dense_1/kernel/Initializer/random_uniform/subSub6target/v/dense_1/kernel/Initializer/random_uniform/max6target/v/dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
: **
_class 
loc:@target/v/dense_1/kernel*
T0

6target/v/dense_1/kernel/Initializer/random_uniform/mulMul@target/v/dense_1/kernel/Initializer/random_uniform/RandomUniform6target/v/dense_1/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@target/v/dense_1/kernel* 
_output_shapes
:
¬

2target/v/dense_1/kernel/Initializer/random_uniformAdd6target/v/dense_1/kernel/Initializer/random_uniform/mul6target/v/dense_1/kernel/Initializer/random_uniform/min* 
_output_shapes
:
¬**
_class 
loc:@target/v/dense_1/kernel*
T0
»
target/v/dense_1/kernel
VariableV2*
shared_name *
dtype0*
shape:
¬* 
_output_shapes
:
¬*
	container **
_class 
loc:@target/v/dense_1/kernel
υ
target/v/dense_1/kernel/AssignAssigntarget/v/dense_1/kernel2target/v/dense_1/kernel/Initializer/random_uniform* 
_output_shapes
:
¬**
_class 
loc:@target/v/dense_1/kernel*
T0*
validate_shape(*
use_locking(

target/v/dense_1/kernel/readIdentitytarget/v/dense_1/kernel**
_class 
loc:@target/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
 
'target/v/dense_1/bias/Initializer/zerosConst*
valueB¬*    *
_output_shapes	
:¬*
dtype0*(
_class
loc:@target/v/dense_1/bias
­
target/v/dense_1/bias
VariableV2*
dtype0*
shape:¬*
	container *
shared_name *(
_class
loc:@target/v/dense_1/bias*
_output_shapes	
:¬
ί
target/v/dense_1/bias/AssignAssigntarget/v/dense_1/bias'target/v/dense_1/bias/Initializer/zeros*
T0*
use_locking(*
_output_shapes	
:¬*(
_class
loc:@target/v/dense_1/bias*
validate_shape(

target/v/dense_1/bias/readIdentitytarget/v/dense_1/bias*(
_class
loc:@target/v/dense_1/bias*
_output_shapes	
:¬*
T0
­
target/v/dense_1/MatMulMatMultarget/v/dense/Relutarget/v/dense_1/kernel/read*
T0*
transpose_b( *
transpose_a( *(
_output_shapes
:?????????¬
’
target/v/dense_1/BiasAddBiasAddtarget/v/dense_1/MatMultarget/v/dense_1/bias/read*
data_formatNHWC*
T0*(
_output_shapes
:?????????¬
j
target/v/dense_1/ReluRelutarget/v/dense_1/BiasAdd*(
_output_shapes
:?????????¬*
T0
΅
8target/v/dense_2/kernel/Initializer/random_uniform/shapeConst*
dtype0**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:*
valueB",     
§
6target/v/dense_2/kernel/Initializer/random_uniform/minConst*
valueB
 * Ύ*
dtype0**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
: 
§
6target/v/dense_2/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: **
_class 
loc:@target/v/dense_2/kernel*
valueB
 * >

@target/v/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform8target/v/dense_2/kernel/Initializer/random_uniform/shape**
_class 
loc:@target/v/dense_2/kernel*

seed *
T0*
seed2 *
dtype0*
_output_shapes
:	¬
ϊ
6target/v/dense_2/kernel/Initializer/random_uniform/subSub6target/v/dense_2/kernel/Initializer/random_uniform/max6target/v/dense_2/kernel/Initializer/random_uniform/min**
_class 
loc:@target/v/dense_2/kernel*
T0*
_output_shapes
: 

6target/v/dense_2/kernel/Initializer/random_uniform/mulMul@target/v/dense_2/kernel/Initializer/random_uniform/RandomUniform6target/v/dense_2/kernel/Initializer/random_uniform/sub**
_class 
loc:@target/v/dense_2/kernel*
T0*
_output_shapes
:	¬
?
2target/v/dense_2/kernel/Initializer/random_uniformAdd6target/v/dense_2/kernel/Initializer/random_uniform/mul6target/v/dense_2/kernel/Initializer/random_uniform/min*
T0*
_output_shapes
:	¬**
_class 
loc:@target/v/dense_2/kernel
Ή
target/v/dense_2/kernel
VariableV2**
_class 
loc:@target/v/dense_2/kernel*
dtype0*
shared_name *
shape:	¬*
	container *
_output_shapes
:	¬
τ
target/v/dense_2/kernel/AssignAssigntarget/v/dense_2/kernel2target/v/dense_2/kernel/Initializer/random_uniform*
_output_shapes
:	¬*
T0*
validate_shape(**
_class 
loc:@target/v/dense_2/kernel*
use_locking(

target/v/dense_2/kernel/readIdentitytarget/v/dense_2/kernel*
T0**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬

'target/v/dense_2/bias/Initializer/zerosConst*
valueB*    *
_output_shapes
:*(
_class
loc:@target/v/dense_2/bias*
dtype0
«
target/v/dense_2/bias
VariableV2*
dtype0*
_output_shapes
:*(
_class
loc:@target/v/dense_2/bias*
	container *
shared_name *
shape:
ή
target/v/dense_2/bias/AssignAssigntarget/v/dense_2/bias'target/v/dense_2/bias/Initializer/zeros*
validate_shape(*(
_class
loc:@target/v/dense_2/bias*
T0*
use_locking(*
_output_shapes
:

target/v/dense_2/bias/readIdentitytarget/v/dense_2/bias*
_output_shapes
:*
T0*(
_class
loc:@target/v/dense_2/bias
?
target/v/dense_2/MatMulMatMultarget/v/dense_1/Relutarget/v/dense_2/kernel/read*
transpose_a( *
transpose_b( *
T0*'
_output_shapes
:?????????
‘
target/v/dense_2/BiasAddBiasAddtarget/v/dense_2/MatMultarget/v/dense_2/bias/read*
T0*'
_output_shapes
:?????????*
data_formatNHWC
z
target/v/SqueezeSqueezetarget/v/dense_2/BiasAdd*
squeeze_dims
*#
_output_shapes
:?????????*
T0
f
MinimumMinimummain/q1_1/Squeezemain/q2_1/Squeeze*#
_output_shapes
:?????????*
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
:?????????*
T0
J
mul/xConst*
dtype0*
valueB
 *€p}?*
_output_shapes
: 
D
mulMulmul/xsub*#
_output_shapes
:?????????*
T0
Q
mul_1Mulmultarget/v/Squeeze*
T0*#
_output_shapes
:?????????
P
addAddV2Placeholder_4mul_1*#
_output_shapes
:?????????*
T0
O
StopGradientStopGradientadd*
T0*#
_output_shapes
:?????????
L
mul_2/xConst*
valueB
 *
Χ£;*
_output_shapes
: *
dtype0
R
mul_2Mulmul_2/xmain/pi/sub_4*#
_output_shapes
:?????????*
T0
J
sub_1SubMinimummul_2*
T0*#
_output_shapes
:?????????
S
StopGradient_1StopGradientsub_1*#
_output_shapes
:?????????*
T0
L
mul_3/xConst*
dtype0*
_output_shapes
: *
valueB
 *
Χ£;
R
mul_3Mulmul_3/xmain/pi/sub_4*
T0*#
_output_shapes
:?????????
T
sub_2Submul_3main/q1_1/Squeeze*#
_output_shapes
:?????????*
T0
O
ConstConst*
valueB: *
_output_shapes
:*
dtype0
X
MeanMeansub_2Const*

Tidx0*
_output_shapes
: *
	keep_dims( *
T0
Y
sub_3SubStopGradientmain/q1/Squeeze*
T0*#
_output_shapes
:?????????
J
pow/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
F
powPowsub_3pow/y*
T0*#
_output_shapes
:?????????
Q
Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
Z
Mean_1MeanpowConst_1*
T0*
	keep_dims( *
_output_shapes
: *

Tidx0
L
mul_4/xConst*
valueB
 *   ?*
_output_shapes
: *
dtype0
>
mul_4Mulmul_4/xMean_1*
T0*
_output_shapes
: 
Y
sub_4SubStopGradientmain/q2/Squeeze*#
_output_shapes
:?????????*
T0
L
pow_1/yConst*
valueB
 *   @*
_output_shapes
: *
dtype0
J
pow_1Powsub_4pow_1/y*#
_output_shapes
:?????????*
T0
Q
Const_2Const*
_output_shapes
:*
dtype0*
valueB: 
\
Mean_2Meanpow_1Const_2*
	keep_dims( *

Tidx0*
_output_shapes
: *
T0
L
mul_5/xConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
>
mul_5Mulmul_5/xMean_2*
_output_shapes
: *
T0
Z
sub_5SubStopGradient_1main/v/Squeeze*#
_output_shapes
:?????????*
T0
L
pow_2/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
J
pow_2Powsub_5pow_2/y*#
_output_shapes
:?????????*
T0
Q
Const_3Const*
_output_shapes
:*
dtype0*
valueB: 
\
Mean_3Meanpow_2Const_3*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
L
mul_6/xConst*
_output_shapes
: *
valueB
 *   ?*
dtype0
>
mul_6Mulmul_6/xMean_3*
T0*
_output_shapes
: 
=
add_1AddV2mul_4mul_5*
T0*
_output_shapes
: 
=
add_2AddV2add_1mul_6*
T0*
_output_shapes
: 
R
gradients/ShapeConst*
valueB *
_output_shapes
: *
dtype0
X
gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*
_output_shapes
: *

index_type0
k
!gradients/Mean_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
^
gradients/Mean_grad/ShapeShapesub_2*
out_type0*
T0*
_output_shapes
:

gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:?????????
`
gradients/Mean_grad/Shape_1Shapesub_2*
out_type0*
T0*
_output_shapes
:
^
gradients/Mean_grad/Shape_2Const*
valueB *
_output_shapes
: *
dtype0
c
gradients/Mean_grad/ConstConst*
_output_shapes
:*
dtype0*
valueB: 

gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
e
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:

gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
_output_shapes
: *

Tidx0*
T0*
	keep_dims( 
_
gradients/Mean_grad/Maximum/yConst*
value	B :*
dtype0*
_output_shapes
: 
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
Truncate( *
_output_shapes
: *

SrcT0*

DstT0

gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*#
_output_shapes
:?????????*
T0
_
gradients/sub_2_grad/ShapeShapemul_3*
_output_shapes
:*
T0*
out_type0
m
gradients/sub_2_grad/Shape_1Shapemain/q1_1/Squeeze*
out_type0*
T0*
_output_shapes
:
Ί
*gradients/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_2_grad/Shapegradients/sub_2_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
¨
gradients/sub_2_grad/SumSumgradients/Mean_grad/truediv*gradients/sub_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
_output_shapes
:*
T0

gradients/sub_2_grad/ReshapeReshapegradients/sub_2_grad/Sumgradients/sub_2_grad/Shape*
Tshape0*#
_output_shapes
:?????????*
T0
j
gradients/sub_2_grad/NegNeggradients/Mean_grad/truediv*
T0*#
_output_shapes
:?????????
©
gradients/sub_2_grad/Sum_1Sumgradients/sub_2_grad/Neg,gradients/sub_2_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/sub_2_grad/Reshape_1Reshapegradients/sub_2_grad/Sum_1gradients/sub_2_grad/Shape_1*
Tshape0*
T0*#
_output_shapes
:?????????
m
%gradients/sub_2_grad/tuple/group_depsNoOp^gradients/sub_2_grad/Reshape^gradients/sub_2_grad/Reshape_1
ή
-gradients/sub_2_grad/tuple/control_dependencyIdentitygradients/sub_2_grad/Reshape&^gradients/sub_2_grad/tuple/group_deps*#
_output_shapes
:?????????*
T0*/
_class%
#!loc:@gradients/sub_2_grad/Reshape
δ
/gradients/sub_2_grad/tuple/control_dependency_1Identitygradients/sub_2_grad/Reshape_1&^gradients/sub_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/sub_2_grad/Reshape_1*#
_output_shapes
:?????????*
T0
_
gradients/mul_3_grad/ShapeShapemul_3/x*
_output_shapes
: *
out_type0*
T0
i
gradients/mul_3_grad/Shape_1Shapemain/pi/sub_4*
out_type0*
T0*
_output_shapes
:
Ί
*gradients/mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_3_grad/Shapegradients/mul_3_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0

gradients/mul_3_grad/MulMul-gradients/sub_2_grad/tuple/control_dependencymain/pi/sub_4*#
_output_shapes
:?????????*
T0
₯
gradients/mul_3_grad/SumSumgradients/mul_3_grad/Mul*gradients/mul_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:

gradients/mul_3_grad/ReshapeReshapegradients/mul_3_grad/Sumgradients/mul_3_grad/Shape*
_output_shapes
: *
Tshape0*
T0

gradients/mul_3_grad/Mul_1Mulmul_3/x-gradients/sub_2_grad/tuple/control_dependency*
T0*#
_output_shapes
:?????????
«
gradients/mul_3_grad/Sum_1Sumgradients/mul_3_grad/Mul_1,gradients/mul_3_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
T0*
	keep_dims( 

gradients/mul_3_grad/Reshape_1Reshapegradients/mul_3_grad/Sum_1gradients/mul_3_grad/Shape_1*#
_output_shapes
:?????????*
Tshape0*
T0
m
%gradients/mul_3_grad/tuple/group_depsNoOp^gradients/mul_3_grad/Reshape^gradients/mul_3_grad/Reshape_1
Ρ
-gradients/mul_3_grad/tuple/control_dependencyIdentitygradients/mul_3_grad/Reshape&^gradients/mul_3_grad/tuple/group_deps*
_output_shapes
: *
T0*/
_class%
#!loc:@gradients/mul_3_grad/Reshape
δ
/gradients/mul_3_grad/tuple/control_dependency_1Identitygradients/mul_3_grad/Reshape_1&^gradients/mul_3_grad/tuple/group_deps*1
_class'
%#loc:@gradients/mul_3_grad/Reshape_1*
T0*#
_output_shapes
:?????????

&gradients/main/q1_1/Squeeze_grad/ShapeShapemain/q1_1/dense_2/BiasAdd*
T0*
out_type0*
_output_shapes
:
Μ
(gradients/main/q1_1/Squeeze_grad/ReshapeReshape/gradients/sub_2_grad/tuple/control_dependency_1&gradients/main/q1_1/Squeeze_grad/Shape*'
_output_shapes
:?????????*
Tshape0*
T0
m
"gradients/main/pi/sub_4_grad/ShapeShapemain/pi/Sum*
T0*
out_type0*
_output_shapes
:
q
$gradients/main/pi/sub_4_grad/Shape_1Shapemain/pi/Sum_1*
_output_shapes
:*
T0*
out_type0
?
2gradients/main/pi/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/sub_4_grad/Shape$gradients/main/pi/sub_4_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
Μ
 gradients/main/pi/sub_4_grad/SumSum/gradients/mul_3_grad/tuple/control_dependency_12gradients/main/pi/sub_4_grad/BroadcastGradientArgs*
	keep_dims( *
_output_shapes
:*
T0*

Tidx0
±
$gradients/main/pi/sub_4_grad/ReshapeReshape gradients/main/pi/sub_4_grad/Sum"gradients/main/pi/sub_4_grad/Shape*
Tshape0*
T0*#
_output_shapes
:?????????

 gradients/main/pi/sub_4_grad/NegNeg/gradients/mul_3_grad/tuple/control_dependency_1*
T0*#
_output_shapes
:?????????
Α
"gradients/main/pi/sub_4_grad/Sum_1Sum gradients/main/pi/sub_4_grad/Neg4gradients/main/pi/sub_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
·
&gradients/main/pi/sub_4_grad/Reshape_1Reshape"gradients/main/pi/sub_4_grad/Sum_1$gradients/main/pi/sub_4_grad/Shape_1*#
_output_shapes
:?????????*
T0*
Tshape0

-gradients/main/pi/sub_4_grad/tuple/group_depsNoOp%^gradients/main/pi/sub_4_grad/Reshape'^gradients/main/pi/sub_4_grad/Reshape_1
ώ
5gradients/main/pi/sub_4_grad/tuple/control_dependencyIdentity$gradients/main/pi/sub_4_grad/Reshape.^gradients/main/pi/sub_4_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/sub_4_grad/Reshape*
T0*#
_output_shapes
:?????????

7gradients/main/pi/sub_4_grad/tuple/control_dependency_1Identity&gradients/main/pi/sub_4_grad/Reshape_1.^gradients/main/pi/sub_4_grad/tuple/group_deps*#
_output_shapes
:?????????*
T0*9
_class/
-+loc:@gradients/main/pi/sub_4_grad/Reshape_1
©
4gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad(gradients/main/q1_1/Squeeze_grad/Reshape*
data_formatNHWC*
_output_shapes
:*
T0
£
9gradients/main/q1_1/dense_2/BiasAdd_grad/tuple/group_depsNoOp)^gradients/main/q1_1/Squeeze_grad/Reshape5^gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGrad
’
Agradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity(gradients/main/q1_1/Squeeze_grad/Reshape:^gradients/main/q1_1/dense_2/BiasAdd_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????*;
_class1
/-loc:@gradients/main/q1_1/Squeeze_grad/Reshape
―
Cgradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity4gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGrad:^gradients/main/q1_1/dense_2/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main/q1_1/dense_2/BiasAdd_grad/BiasAddGrad*
_output_shapes
:
m
 gradients/main/pi/Sum_grad/ShapeShapemain/pi/mul_3*
_output_shapes
:*
T0*
out_type0

gradients/main/pi/Sum_grad/SizeConst*
value	B :*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
: *
dtype0
½
gradients/main/pi/Sum_grad/addAddV2main/pi/Sum/reduction_indicesgradients/main/pi/Sum_grad/Size*
_output_shapes
: *
T0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape
Α
gradients/main/pi/Sum_grad/modFloorModgradients/main/pi/Sum_grad/addgradients/main/pi/Sum_grad/Size*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
: *
T0

"gradients/main/pi/Sum_grad/Shape_1Const*
_output_shapes
: *3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
dtype0*
valueB 

&gradients/main/pi/Sum_grad/range/startConst*
value	B : *
_output_shapes
: *3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
dtype0

&gradients/main/pi/Sum_grad/range/deltaConst*
dtype0*
value	B :*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
: 
χ
 gradients/main/pi/Sum_grad/rangeRange&gradients/main/pi/Sum_grad/range/startgradients/main/pi/Sum_grad/Size&gradients/main/pi/Sum_grad/range/delta*
_output_shapes
:*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*

Tidx0

%gradients/main/pi/Sum_grad/Fill/valueConst*
value	B :*
_output_shapes
: *
dtype0*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape
Ϊ
gradients/main/pi/Sum_grad/FillFill"gradients/main/pi/Sum_grad/Shape_1%gradients/main/pi/Sum_grad/Fill/value*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
T0*
_output_shapes
: *

index_type0
‘
(gradients/main/pi/Sum_grad/DynamicStitchDynamicStitch gradients/main/pi/Sum_grad/rangegradients/main/pi/Sum_grad/mod gradients/main/pi/Sum_grad/Shapegradients/main/pi/Sum_grad/Fill*
T0*
_output_shapes
:*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
N

$gradients/main/pi/Sum_grad/Maximum/yConst*
_output_shapes
: *
dtype0*
value	B :*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape
Χ
"gradients/main/pi/Sum_grad/MaximumMaximum(gradients/main/pi/Sum_grad/DynamicStitch$gradients/main/pi/Sum_grad/Maximum/y*
T0*
_output_shapes
:*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape
Ο
#gradients/main/pi/Sum_grad/floordivFloorDiv gradients/main/pi/Sum_grad/Shape"gradients/main/pi/Sum_grad/Maximum*3
_class)
'%loc:@gradients/main/pi/Sum_grad/Shape*
_output_shapes
:*
T0
Χ
"gradients/main/pi/Sum_grad/ReshapeReshape5gradients/main/pi/sub_4_grad/tuple/control_dependency(gradients/main/pi/Sum_grad/DynamicStitch*
Tshape0*0
_output_shapes
:??????????????????*
T0
΄
gradients/main/pi/Sum_grad/TileTile"gradients/main/pi/Sum_grad/Reshape#gradients/main/pi/Sum_grad/floordiv*

Tmultiples0*
T0*'
_output_shapes
:?????????
m
"gradients/main/pi/Sum_1_grad/ShapeShapemain/pi/Log*
out_type0*
_output_shapes
:*
T0

!gradients/main/pi/Sum_1_grad/SizeConst*
dtype0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: *
value	B :
Ε
 gradients/main/pi/Sum_1_grad/addAddV2main/pi/Sum_1/reduction_indices!gradients/main/pi/Sum_1_grad/Size*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: *
T0
Ι
 gradients/main/pi/Sum_1_grad/modFloorMod gradients/main/pi/Sum_1_grad/add!gradients/main/pi/Sum_1_grad/Size*
_output_shapes
: *5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
T0

$gradients/main/pi/Sum_1_grad/Shape_1Const*
_output_shapes
: *5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
valueB *
dtype0
‘
(gradients/main/pi/Sum_1_grad/range/startConst*
value	B : *5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: *
dtype0
‘
(gradients/main/pi/Sum_1_grad/range/deltaConst*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: *
dtype0*
value	B :

"gradients/main/pi/Sum_1_grad/rangeRange(gradients/main/pi/Sum_1_grad/range/start!gradients/main/pi/Sum_1_grad/Size(gradients/main/pi/Sum_1_grad/range/delta*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*

Tidx0*
_output_shapes
:
 
'gradients/main/pi/Sum_1_grad/Fill/valueConst*
dtype0*
_output_shapes
: *5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
value	B :
β
!gradients/main/pi/Sum_1_grad/FillFill$gradients/main/pi/Sum_1_grad/Shape_1'gradients/main/pi/Sum_1_grad/Fill/value*
T0*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
: *

index_type0
­
*gradients/main/pi/Sum_1_grad/DynamicStitchDynamicStitch"gradients/main/pi/Sum_1_grad/range gradients/main/pi/Sum_1_grad/mod"gradients/main/pi/Sum_1_grad/Shape!gradients/main/pi/Sum_1_grad/Fill*
N*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
:*
T0

&gradients/main/pi/Sum_1_grad/Maximum/yConst*
_output_shapes
: *
value	B :*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
dtype0
ί
$gradients/main/pi/Sum_1_grad/MaximumMaximum*gradients/main/pi/Sum_1_grad/DynamicStitch&gradients/main/pi/Sum_1_grad/Maximum/y*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
T0*
_output_shapes
:
Χ
%gradients/main/pi/Sum_1_grad/floordivFloorDiv"gradients/main/pi/Sum_1_grad/Shape$gradients/main/pi/Sum_1_grad/Maximum*5
_class+
)'loc:@gradients/main/pi/Sum_1_grad/Shape*
_output_shapes
:*
T0
έ
$gradients/main/pi/Sum_1_grad/ReshapeReshape7gradients/main/pi/sub_4_grad/tuple/control_dependency_1*gradients/main/pi/Sum_1_grad/DynamicStitch*0
_output_shapes
:??????????????????*
Tshape0*
T0
Ί
!gradients/main/pi/Sum_1_grad/TileTile$gradients/main/pi/Sum_1_grad/Reshape%gradients/main/pi/Sum_1_grad/floordiv*
T0*

Tmultiples0*'
_output_shapes
:?????????
ρ
.gradients/main/q1_1/dense_2/MatMul_grad/MatMulMatMulAgradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependencymain/q1/dense_2/kernel/read*
T0*
transpose_b(*(
_output_shapes
:?????????¬*
transpose_a( 
ε
0gradients/main/q1_1/dense_2/MatMul_grad/MatMul_1MatMulmain/q1_1/dense_1/ReluAgradients/main/q1_1/dense_2/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes
:	¬*
transpose_a(*
transpose_b( 
€
8gradients/main/q1_1/dense_2/MatMul_grad/tuple/group_depsNoOp/^gradients/main/q1_1/dense_2/MatMul_grad/MatMul1^gradients/main/q1_1/dense_2/MatMul_grad/MatMul_1
­
@gradients/main/q1_1/dense_2/MatMul_grad/tuple/control_dependencyIdentity.gradients/main/q1_1/dense_2/MatMul_grad/MatMul9^gradients/main/q1_1/dense_2/MatMul_grad/tuple/group_deps*(
_output_shapes
:?????????¬*A
_class7
53loc:@gradients/main/q1_1/dense_2/MatMul_grad/MatMul*
T0
ͺ
Bgradients/main/q1_1/dense_2/MatMul_grad/tuple/control_dependency_1Identity0gradients/main/q1_1/dense_2/MatMul_grad/MatMul_19^gradients/main/q1_1/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*
T0*C
_class9
75loc:@gradients/main/q1_1/dense_2/MatMul_grad/MatMul_1
o
"gradients/main/pi/mul_3_grad/ShapeShapemain/pi/mul_3/x*
T0*
out_type0*
_output_shapes
: 
q
$gradients/main/pi/mul_3_grad/Shape_1Shapemain/pi/add_5*
out_type0*
T0*
_output_shapes
:
?
2gradients/main/pi/mul_3_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/mul_3_grad/Shape$gradients/main/pi/mul_3_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????

 gradients/main/pi/mul_3_grad/MulMulgradients/main/pi/Sum_grad/Tilemain/pi/add_5*
T0*'
_output_shapes
:?????????
½
 gradients/main/pi/mul_3_grad/SumSum gradients/main/pi/mul_3_grad/Mul2gradients/main/pi/mul_3_grad/BroadcastGradientArgs*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0
€
$gradients/main/pi/mul_3_grad/ReshapeReshape gradients/main/pi/mul_3_grad/Sum"gradients/main/pi/mul_3_grad/Shape*
T0*
Tshape0*
_output_shapes
: 

"gradients/main/pi/mul_3_grad/Mul_1Mulmain/pi/mul_3/xgradients/main/pi/Sum_grad/Tile*'
_output_shapes
:?????????*
T0
Γ
"gradients/main/pi/mul_3_grad/Sum_1Sum"gradients/main/pi/mul_3_grad/Mul_14gradients/main/pi/mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
»
&gradients/main/pi/mul_3_grad/Reshape_1Reshape"gradients/main/pi/mul_3_grad/Sum_1$gradients/main/pi/mul_3_grad/Shape_1*'
_output_shapes
:?????????*
Tshape0*
T0

-gradients/main/pi/mul_3_grad/tuple/group_depsNoOp%^gradients/main/pi/mul_3_grad/Reshape'^gradients/main/pi/mul_3_grad/Reshape_1
ρ
5gradients/main/pi/mul_3_grad/tuple/control_dependencyIdentity$gradients/main/pi/mul_3_grad/Reshape.^gradients/main/pi/mul_3_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/mul_3_grad/Reshape*
T0*
_output_shapes
: 

7gradients/main/pi/mul_3_grad/tuple/control_dependency_1Identity&gradients/main/pi/mul_3_grad/Reshape_1.^gradients/main/pi/mul_3_grad/tuple/group_deps*'
_output_shapes
:?????????*9
_class/
-+loc:@gradients/main/pi/mul_3_grad/Reshape_1*
T0

%gradients/main/pi/Log_grad/Reciprocal
Reciprocalmain/pi/add_8"^gradients/main/pi/Sum_1_grad/Tile*'
_output_shapes
:?????????*
T0
‘
gradients/main/pi/Log_grad/mulMul!gradients/main/pi/Sum_1_grad/Tile%gradients/main/pi/Log_grad/Reciprocal*
T0*'
_output_shapes
:?????????
Η
.gradients/main/q1_1/dense_1/Relu_grad/ReluGradReluGrad@gradients/main/q1_1/dense_2/MatMul_grad/tuple/control_dependencymain/q1_1/dense_1/Relu*
T0*(
_output_shapes
:?????????¬
o
"gradients/main/pi/add_5_grad/ShapeShapemain/pi/add_4*
_output_shapes
:*
out_type0*
T0
q
$gradients/main/pi/add_5_grad/Shape_1Shapemain/pi/add_5/y*
_output_shapes
: *
T0*
out_type0
?
2gradients/main/pi/add_5_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_5_grad/Shape$gradients/main/pi/add_5_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
Τ
 gradients/main/pi/add_5_grad/SumSum7gradients/main/pi/mul_3_grad/tuple/control_dependency_12gradients/main/pi/add_5_grad/BroadcastGradientArgs*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0
΅
$gradients/main/pi/add_5_grad/ReshapeReshape gradients/main/pi/add_5_grad/Sum"gradients/main/pi/add_5_grad/Shape*
T0*'
_output_shapes
:?????????*
Tshape0
Ψ
"gradients/main/pi/add_5_grad/Sum_1Sum7gradients/main/pi/mul_3_grad/tuple/control_dependency_14gradients/main/pi/add_5_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:
ͺ
&gradients/main/pi/add_5_grad/Reshape_1Reshape"gradients/main/pi/add_5_grad/Sum_1$gradients/main/pi/add_5_grad/Shape_1*
Tshape0*
T0*
_output_shapes
: 

-gradients/main/pi/add_5_grad/tuple/group_depsNoOp%^gradients/main/pi/add_5_grad/Reshape'^gradients/main/pi/add_5_grad/Reshape_1

5gradients/main/pi/add_5_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_5_grad/Reshape.^gradients/main/pi/add_5_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_5_grad/Reshape*
T0*'
_output_shapes
:?????????
χ
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
?
2gradients/main/pi/add_8_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_8_grad/Shape$gradients/main/pi/add_8_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
»
 gradients/main/pi/add_8_grad/SumSumgradients/main/pi/Log_grad/mul2gradients/main/pi/add_8_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
΅
$gradients/main/pi/add_8_grad/ReshapeReshape gradients/main/pi/add_8_grad/Sum"gradients/main/pi/add_8_grad/Shape*'
_output_shapes
:?????????*
T0*
Tshape0
Ώ
"gradients/main/pi/add_8_grad/Sum_1Sumgradients/main/pi/Log_grad/mul4gradients/main/pi/add_8_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:
ͺ
&gradients/main/pi/add_8_grad/Reshape_1Reshape"gradients/main/pi/add_8_grad/Sum_1$gradients/main/pi/add_8_grad/Shape_1*
Tshape0*
T0*
_output_shapes
: 

-gradients/main/pi/add_8_grad/tuple/group_depsNoOp%^gradients/main/pi/add_8_grad/Reshape'^gradients/main/pi/add_8_grad/Reshape_1

5gradients/main/pi/add_8_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_8_grad/Reshape.^gradients/main/pi/add_8_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_8_grad/Reshape*
T0*'
_output_shapes
:?????????
χ
7gradients/main/pi/add_8_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_8_grad/Reshape_1.^gradients/main/pi/add_8_grad/tuple/group_deps*
_output_shapes
: *
T0*9
_class/
-+loc:@gradients/main/pi/add_8_grad/Reshape_1
°
4gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad.gradients/main/q1_1/dense_1/Relu_grad/ReluGrad*
_output_shapes	
:¬*
data_formatNHWC*
T0
©
9gradients/main/q1_1/dense_1/BiasAdd_grad/tuple/group_depsNoOp5^gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGrad/^gradients/main/q1_1/dense_1/Relu_grad/ReluGrad
―
Agradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity.gradients/main/q1_1/dense_1/Relu_grad/ReluGrad:^gradients/main/q1_1/dense_1/BiasAdd_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/main/q1_1/dense_1/Relu_grad/ReluGrad*(
_output_shapes
:?????????¬
°
Cgradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity4gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGrad:^gradients/main/q1_1/dense_1/BiasAdd_grad/tuple/group_deps*G
_class=
;9loc:@gradients/main/q1_1/dense_1/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:¬*
T0
m
"gradients/main/pi/add_4_grad/ShapeShapemain/pi/pow*
T0*
out_type0*
_output_shapes
:
q
$gradients/main/pi/add_4_grad/Shape_1Shapemain/pi/mul_2*
_output_shapes
:*
T0*
out_type0
?
2gradients/main/pi/add_4_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_4_grad/Shape$gradients/main/pi/add_4_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
?
 gradients/main/pi/add_4_grad/SumSum5gradients/main/pi/add_5_grad/tuple/control_dependency2gradients/main/pi/add_4_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
΅
$gradients/main/pi/add_4_grad/ReshapeReshape gradients/main/pi/add_4_grad/Sum"gradients/main/pi/add_4_grad/Shape*'
_output_shapes
:?????????*
Tshape0*
T0
Φ
"gradients/main/pi/add_4_grad/Sum_1Sum5gradients/main/pi/add_5_grad/tuple/control_dependency4gradients/main/pi/add_4_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
_output_shapes
:*
T0
»
&gradients/main/pi/add_4_grad/Reshape_1Reshape"gradients/main/pi/add_4_grad/Sum_1$gradients/main/pi/add_4_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:?????????

-gradients/main/pi/add_4_grad/tuple/group_depsNoOp%^gradients/main/pi/add_4_grad/Reshape'^gradients/main/pi/add_4_grad/Reshape_1

5gradients/main/pi/add_4_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_4_grad/Reshape.^gradients/main/pi/add_4_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_4_grad/Reshape*
T0*'
_output_shapes
:?????????

7gradients/main/pi/add_4_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_4_grad/Reshape_1.^gradients/main/pi/add_4_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/main/pi/add_4_grad/Reshape_1*'
_output_shapes
:?????????
o
"gradients/main/pi/add_7_grad/ShapeShapemain/pi/sub_1*
T0*
_output_shapes
:*
out_type0
x
$gradients/main/pi/add_7_grad/Shape_1Shapemain/pi/StopGradient*
_output_shapes
:*
out_type0*
T0
?
2gradients/main/pi/add_7_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_7_grad/Shape$gradients/main/pi/add_7_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
?
 gradients/main/pi/add_7_grad/SumSum5gradients/main/pi/add_8_grad/tuple/control_dependency2gradients/main/pi/add_7_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
_output_shapes
:*
T0
΅
$gradients/main/pi/add_7_grad/ReshapeReshape gradients/main/pi/add_7_grad/Sum"gradients/main/pi/add_7_grad/Shape*
Tshape0*'
_output_shapes
:?????????*
T0
Φ
"gradients/main/pi/add_7_grad/Sum_1Sum5gradients/main/pi/add_8_grad/tuple/control_dependency4gradients/main/pi/add_7_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
»
&gradients/main/pi/add_7_grad/Reshape_1Reshape"gradients/main/pi/add_7_grad/Sum_1$gradients/main/pi/add_7_grad/Shape_1*
T0*'
_output_shapes
:?????????*
Tshape0

-gradients/main/pi/add_7_grad/tuple/group_depsNoOp%^gradients/main/pi/add_7_grad/Reshape'^gradients/main/pi/add_7_grad/Reshape_1

5gradients/main/pi/add_7_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_7_grad/Reshape.^gradients/main/pi/add_7_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????*7
_class-
+)loc:@gradients/main/pi/add_7_grad/Reshape

7gradients/main/pi/add_7_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_7_grad/Reshape_1.^gradients/main/pi/add_7_grad/tuple/group_deps*9
_class/
-+loc:@gradients/main/pi/add_7_grad/Reshape_1*
T0*'
_output_shapes
:?????????
ρ
.gradients/main/q1_1/dense_1/MatMul_grad/MatMulMatMulAgradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependencymain/q1/dense_1/kernel/read*(
_output_shapes
:?????????*
transpose_a( *
T0*
transpose_b(
δ
0gradients/main/q1_1/dense_1/MatMul_grad/MatMul_1MatMulmain/q1_1/dense/ReluAgradients/main/q1_1/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( * 
_output_shapes
:
¬*
transpose_a(*
T0
€
8gradients/main/q1_1/dense_1/MatMul_grad/tuple/group_depsNoOp/^gradients/main/q1_1/dense_1/MatMul_grad/MatMul1^gradients/main/q1_1/dense_1/MatMul_grad/MatMul_1
­
@gradients/main/q1_1/dense_1/MatMul_grad/tuple/control_dependencyIdentity.gradients/main/q1_1/dense_1/MatMul_grad/MatMul9^gradients/main/q1_1/dense_1/MatMul_grad/tuple/group_deps*(
_output_shapes
:?????????*A
_class7
53loc:@gradients/main/q1_1/dense_1/MatMul_grad/MatMul*
T0
«
Bgradients/main/q1_1/dense_1/MatMul_grad/tuple/control_dependency_1Identity0gradients/main/q1_1/dense_1/MatMul_grad/MatMul_19^gradients/main/q1_1/dense_1/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main/q1_1/dense_1/MatMul_grad/MatMul_1* 
_output_shapes
:
¬
o
 gradients/main/pi/pow_grad/ShapeShapemain/pi/truediv*
_output_shapes
:*
out_type0*
T0
m
"gradients/main/pi/pow_grad/Shape_1Shapemain/pi/pow/y*
_output_shapes
: *
out_type0*
T0
Μ
0gradients/main/pi/pow_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/pow_grad/Shape"gradients/main/pi/pow_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0

gradients/main/pi/pow_grad/mulMul5gradients/main/pi/add_4_grad/tuple/control_dependencymain/pi/pow/y*
T0*'
_output_shapes
:?????????
e
 gradients/main/pi/pow_grad/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
w
gradients/main/pi/pow_grad/subSubmain/pi/pow/y gradients/main/pi/pow_grad/sub/y*
T0*
_output_shapes
: 

gradients/main/pi/pow_grad/PowPowmain/pi/truedivgradients/main/pi/pow_grad/sub*
T0*'
_output_shapes
:?????????

 gradients/main/pi/pow_grad/mul_1Mulgradients/main/pi/pow_grad/mulgradients/main/pi/pow_grad/Pow*
T0*'
_output_shapes
:?????????
Ή
gradients/main/pi/pow_grad/SumSum gradients/main/pi/pow_grad/mul_10gradients/main/pi/pow_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*

Tidx0*
	keep_dims( 
―
"gradients/main/pi/pow_grad/ReshapeReshapegradients/main/pi/pow_grad/Sum gradients/main/pi/pow_grad/Shape*
T0*'
_output_shapes
:?????????*
Tshape0
i
$gradients/main/pi/pow_grad/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    

"gradients/main/pi/pow_grad/GreaterGreatermain/pi/truediv$gradients/main/pi/pow_grad/Greater/y*'
_output_shapes
:?????????*
T0
y
*gradients/main/pi/pow_grad/ones_like/ShapeShapemain/pi/truediv*
_output_shapes
:*
out_type0*
T0
o
*gradients/main/pi/pow_grad/ones_like/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Θ
$gradients/main/pi/pow_grad/ones_likeFill*gradients/main/pi/pow_grad/ones_like/Shape*gradients/main/pi/pow_grad/ones_like/Const*'
_output_shapes
:?????????*
T0*

index_type0
Έ
!gradients/main/pi/pow_grad/SelectSelect"gradients/main/pi/pow_grad/Greatermain/pi/truediv$gradients/main/pi/pow_grad/ones_like*
T0*'
_output_shapes
:?????????
z
gradients/main/pi/pow_grad/LogLog!gradients/main/pi/pow_grad/Select*'
_output_shapes
:?????????*
T0
u
%gradients/main/pi/pow_grad/zeros_like	ZerosLikemain/pi/truediv*'
_output_shapes
:?????????*
T0
Κ
#gradients/main/pi/pow_grad/Select_1Select"gradients/main/pi/pow_grad/Greatergradients/main/pi/pow_grad/Log%gradients/main/pi/pow_grad/zeros_like*'
_output_shapes
:?????????*
T0

 gradients/main/pi/pow_grad/mul_2Mul5gradients/main/pi/add_4_grad/tuple/control_dependencymain/pi/pow*
T0*'
_output_shapes
:?????????
 
 gradients/main/pi/pow_grad/mul_3Mul gradients/main/pi/pow_grad/mul_2#gradients/main/pi/pow_grad/Select_1*'
_output_shapes
:?????????*
T0
½
 gradients/main/pi/pow_grad/Sum_1Sum gradients/main/pi/pow_grad/mul_32gradients/main/pi/pow_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0
€
$gradients/main/pi/pow_grad/Reshape_1Reshape gradients/main/pi/pow_grad/Sum_1"gradients/main/pi/pow_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 

+gradients/main/pi/pow_grad/tuple/group_depsNoOp#^gradients/main/pi/pow_grad/Reshape%^gradients/main/pi/pow_grad/Reshape_1
ϊ
3gradients/main/pi/pow_grad/tuple/control_dependencyIdentity"gradients/main/pi/pow_grad/Reshape,^gradients/main/pi/pow_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/main/pi/pow_grad/Reshape*'
_output_shapes
:?????????
ο
5gradients/main/pi/pow_grad/tuple/control_dependency_1Identity$gradients/main/pi/pow_grad/Reshape_1,^gradients/main/pi/pow_grad/tuple/group_deps*
T0*
_output_shapes
: *7
_class-
+)loc:@gradients/main/pi/pow_grad/Reshape_1
o
"gradients/main/pi/mul_2_grad/ShapeShapemain/pi/mul_2/x*
_output_shapes
: *
out_type0*
T0
q
$gradients/main/pi/mul_2_grad/Shape_1Shapemain/pi/add_1*
_output_shapes
:*
out_type0*
T0
?
2gradients/main/pi/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/mul_2_grad/Shape$gradients/main/pi/mul_2_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
‘
 gradients/main/pi/mul_2_grad/MulMul7gradients/main/pi/add_4_grad/tuple/control_dependency_1main/pi/add_1*
T0*'
_output_shapes
:?????????
½
 gradients/main/pi/mul_2_grad/SumSum gradients/main/pi/mul_2_grad/Mul2gradients/main/pi/mul_2_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
€
$gradients/main/pi/mul_2_grad/ReshapeReshape gradients/main/pi/mul_2_grad/Sum"gradients/main/pi/mul_2_grad/Shape*
_output_shapes
: *
T0*
Tshape0
₯
"gradients/main/pi/mul_2_grad/Mul_1Mulmain/pi/mul_2/x7gradients/main/pi/add_4_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:?????????
Γ
"gradients/main/pi/mul_2_grad/Sum_1Sum"gradients/main/pi/mul_2_grad/Mul_14gradients/main/pi/mul_2_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
T0*
	keep_dims( 
»
&gradients/main/pi/mul_2_grad/Reshape_1Reshape"gradients/main/pi/mul_2_grad/Sum_1$gradients/main/pi/mul_2_grad/Shape_1*
Tshape0*'
_output_shapes
:?????????*
T0

-gradients/main/pi/mul_2_grad/tuple/group_depsNoOp%^gradients/main/pi/mul_2_grad/Reshape'^gradients/main/pi/mul_2_grad/Reshape_1
ρ
5gradients/main/pi/mul_2_grad/tuple/control_dependencyIdentity$gradients/main/pi/mul_2_grad/Reshape.^gradients/main/pi/mul_2_grad/tuple/group_deps*
_output_shapes
: *7
_class-
+)loc:@gradients/main/pi/mul_2_grad/Reshape*
T0

7gradients/main/pi/mul_2_grad/tuple/control_dependency_1Identity&gradients/main/pi/mul_2_grad/Reshape_1.^gradients/main/pi/mul_2_grad/tuple/group_deps*'
_output_shapes
:?????????*9
_class/
-+loc:@gradients/main/pi/mul_2_grad/Reshape_1*
T0
Γ
,gradients/main/q1_1/dense/Relu_grad/ReluGradReluGrad@gradients/main/q1_1/dense_1/MatMul_grad/tuple/control_dependencymain/q1_1/dense/Relu*(
_output_shapes
:?????????*
T0
o
$gradients/main/pi/truediv_grad/ShapeShapemain/pi/sub*
out_type0*
_output_shapes
:*
T0
s
&gradients/main/pi/truediv_grad/Shape_1Shapemain/pi/add_3*
_output_shapes
:*
T0*
out_type0
Ψ
4gradients/main/pi/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients/main/pi/truediv_grad/Shape&gradients/main/pi/truediv_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
§
&gradients/main/pi/truediv_grad/RealDivRealDiv3gradients/main/pi/pow_grad/tuple/control_dependencymain/pi/add_3*'
_output_shapes
:?????????*
T0
Η
"gradients/main/pi/truediv_grad/SumSum&gradients/main/pi/truediv_grad/RealDiv4gradients/main/pi/truediv_grad/BroadcastGradientArgs*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0
»
&gradients/main/pi/truediv_grad/ReshapeReshape"gradients/main/pi/truediv_grad/Sum$gradients/main/pi/truediv_grad/Shape*'
_output_shapes
:?????????*
T0*
Tshape0
h
"gradients/main/pi/truediv_grad/NegNegmain/pi/sub*'
_output_shapes
:?????????*
T0

(gradients/main/pi/truediv_grad/RealDiv_1RealDiv"gradients/main/pi/truediv_grad/Negmain/pi/add_3*
T0*'
_output_shapes
:?????????

(gradients/main/pi/truediv_grad/RealDiv_2RealDiv(gradients/main/pi/truediv_grad/RealDiv_1main/pi/add_3*'
_output_shapes
:?????????*
T0
Ί
"gradients/main/pi/truediv_grad/mulMul3gradients/main/pi/pow_grad/tuple/control_dependency(gradients/main/pi/truediv_grad/RealDiv_2*
T0*'
_output_shapes
:?????????
Η
$gradients/main/pi/truediv_grad/Sum_1Sum"gradients/main/pi/truediv_grad/mul6gradients/main/pi/truediv_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( *
_output_shapes
:
Α
(gradients/main/pi/truediv_grad/Reshape_1Reshape$gradients/main/pi/truediv_grad/Sum_1&gradients/main/pi/truediv_grad/Shape_1*'
_output_shapes
:?????????*
T0*
Tshape0

/gradients/main/pi/truediv_grad/tuple/group_depsNoOp'^gradients/main/pi/truediv_grad/Reshape)^gradients/main/pi/truediv_grad/Reshape_1

7gradients/main/pi/truediv_grad/tuple/control_dependencyIdentity&gradients/main/pi/truediv_grad/Reshape0^gradients/main/pi/truediv_grad/tuple/group_deps*'
_output_shapes
:?????????*
T0*9
_class/
-+loc:@gradients/main/pi/truediv_grad/Reshape

9gradients/main/pi/truediv_grad/tuple/control_dependency_1Identity(gradients/main/pi/truediv_grad/Reshape_10^gradients/main/pi/truediv_grad/tuple/group_deps*'
_output_shapes
:?????????*;
_class1
/-loc:@gradients/main/pi/truediv_grad/Reshape_1*
T0
¬
2gradients/main/q1_1/dense/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients/main/q1_1/dense/Relu_grad/ReluGrad*
_output_shapes	
:*
T0*
data_formatNHWC
£
7gradients/main/q1_1/dense/BiasAdd_grad/tuple/group_depsNoOp3^gradients/main/q1_1/dense/BiasAdd_grad/BiasAddGrad-^gradients/main/q1_1/dense/Relu_grad/ReluGrad
§
?gradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependencyIdentity,gradients/main/q1_1/dense/Relu_grad/ReluGrad8^gradients/main/q1_1/dense/BiasAdd_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/q1_1/dense/Relu_grad/ReluGrad*
T0*(
_output_shapes
:?????????
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
:*
T0*
out_type0
Μ
0gradients/main/pi/sub_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/sub_grad/Shape"gradients/main/pi/sub_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
Π
gradients/main/pi/sub_grad/SumSum7gradients/main/pi/truediv_grad/tuple/control_dependency0gradients/main/pi/sub_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
―
"gradients/main/pi/sub_grad/ReshapeReshapegradients/main/pi/sub_grad/Sum gradients/main/pi/sub_grad/Shape*'
_output_shapes
:?????????*
T0*
Tshape0

gradients/main/pi/sub_grad/NegNeg7gradients/main/pi/truediv_grad/tuple/control_dependency*
T0*'
_output_shapes
:?????????
»
 gradients/main/pi/sub_grad/Sum_1Sumgradients/main/pi/sub_grad/Neg2gradients/main/pi/sub_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
΅
$gradients/main/pi/sub_grad/Reshape_1Reshape gradients/main/pi/sub_grad/Sum_1"gradients/main/pi/sub_grad/Shape_1*
T0*'
_output_shapes
:?????????*
Tshape0

+gradients/main/pi/sub_grad/tuple/group_depsNoOp#^gradients/main/pi/sub_grad/Reshape%^gradients/main/pi/sub_grad/Reshape_1
ϊ
3gradients/main/pi/sub_grad/tuple/control_dependencyIdentity"gradients/main/pi/sub_grad/Reshape,^gradients/main/pi/sub_grad/tuple/group_deps*'
_output_shapes
:?????????*5
_class+
)'loc:@gradients/main/pi/sub_grad/Reshape*
T0

5gradients/main/pi/sub_grad/tuple/control_dependency_1Identity$gradients/main/pi/sub_grad/Reshape_1,^gradients/main/pi/sub_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/sub_grad/Reshape_1*'
_output_shapes
:?????????
o
"gradients/main/pi/add_3_grad/ShapeShapemain/pi/Exp_1*
_output_shapes
:*
T0*
out_type0
q
$gradients/main/pi/add_3_grad/Shape_1Shapemain/pi/add_3/y*
_output_shapes
: *
T0*
out_type0
?
2gradients/main/pi/add_3_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_3_grad/Shape$gradients/main/pi/add_3_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
Φ
 gradients/main/pi/add_3_grad/SumSum9gradients/main/pi/truediv_grad/tuple/control_dependency_12gradients/main/pi/add_3_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
΅
$gradients/main/pi/add_3_grad/ReshapeReshape gradients/main/pi/add_3_grad/Sum"gradients/main/pi/add_3_grad/Shape*'
_output_shapes
:?????????*
Tshape0*
T0
Ϊ
"gradients/main/pi/add_3_grad/Sum_1Sum9gradients/main/pi/truediv_grad/tuple/control_dependency_14gradients/main/pi/add_3_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
T0*
	keep_dims( 
ͺ
&gradients/main/pi/add_3_grad/Reshape_1Reshape"gradients/main/pi/add_3_grad/Sum_1$gradients/main/pi/add_3_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0

-gradients/main/pi/add_3_grad/tuple/group_depsNoOp%^gradients/main/pi/add_3_grad/Reshape'^gradients/main/pi/add_3_grad/Reshape_1

5gradients/main/pi/add_3_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_3_grad/Reshape.^gradients/main/pi/add_3_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/add_3_grad/Reshape*
T0*'
_output_shapes
:?????????
χ
7gradients/main/pi/add_3_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_3_grad/Reshape_1.^gradients/main/pi/add_3_grad/tuple/group_deps*
T0*
_output_shapes
: *9
_class/
-+loc:@gradients/main/pi/add_3_grad/Reshape_1
κ
,gradients/main/q1_1/dense/MatMul_grad/MatMulMatMul?gradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependencymain/q1/dense/kernel/read*
transpose_b(*'
_output_shapes
:?????????B*
T0*
transpose_a( 
Ϋ
.gradients/main/q1_1/dense/MatMul_grad/MatMul_1MatMulmain/q1_1/concat?gradients/main/q1_1/dense/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
_output_shapes
:	B*
T0

6gradients/main/q1_1/dense/MatMul_grad/tuple/group_depsNoOp-^gradients/main/q1_1/dense/MatMul_grad/MatMul/^gradients/main/q1_1/dense/MatMul_grad/MatMul_1
€
>gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/q1_1/dense/MatMul_grad/MatMul7^gradients/main/q1_1/dense/MatMul_grad/tuple/group_deps*'
_output_shapes
:?????????B*
T0*?
_class5
31loc:@gradients/main/q1_1/dense/MatMul_grad/MatMul
’
@gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/q1_1/dense/MatMul_grad/MatMul_17^gradients/main/q1_1/dense/MatMul_grad/tuple/group_deps*
T0*
_output_shapes
:	B*A
_class7
53loc:@gradients/main/q1_1/dense/MatMul_grad/MatMul_1

 gradients/main/pi/Exp_1_grad/mulMul5gradients/main/pi/add_3_grad/tuple/control_dependencymain/pi/Exp_1*'
_output_shapes
:?????????*
T0
f
$gradients/main/q1_1/concat_grad/RankConst*
value	B :*
_output_shapes
: *
dtype0

#gradients/main/q1_1/concat_grad/modFloorModmain/q1_1/concat/axis$gradients/main/q1_1/concat_grad/Rank*
_output_shapes
: *
T0
r
%gradients/main/q1_1/concat_grad/ShapeShapePlaceholder_1*
T0*
_output_shapes
:*
out_type0

&gradients/main/q1_1/concat_grad/ShapeNShapeNPlaceholder_1
main/mul_1*
T0*
out_type0*
N* 
_output_shapes
::
ή
,gradients/main/q1_1/concat_grad/ConcatOffsetConcatOffset#gradients/main/q1_1/concat_grad/mod&gradients/main/q1_1/concat_grad/ShapeN(gradients/main/q1_1/concat_grad/ShapeN:1* 
_output_shapes
::*
N

%gradients/main/q1_1/concat_grad/SliceSlice>gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependency,gradients/main/q1_1/concat_grad/ConcatOffset&gradients/main/q1_1/concat_grad/ShapeN*'
_output_shapes
:?????????6*
T0*
Index0

'gradients/main/q1_1/concat_grad/Slice_1Slice>gradients/main/q1_1/dense/MatMul_grad/tuple/control_dependency.gradients/main/q1_1/concat_grad/ConcatOffset:1(gradients/main/q1_1/concat_grad/ShapeN:1*'
_output_shapes
:?????????*
T0*
Index0

0gradients/main/q1_1/concat_grad/tuple/group_depsNoOp&^gradients/main/q1_1/concat_grad/Slice(^gradients/main/q1_1/concat_grad/Slice_1

8gradients/main/q1_1/concat_grad/tuple/control_dependencyIdentity%gradients/main/q1_1/concat_grad/Slice1^gradients/main/q1_1/concat_grad/tuple/group_deps*'
_output_shapes
:?????????6*8
_class.
,*loc:@gradients/main/q1_1/concat_grad/Slice*
T0

:gradients/main/q1_1/concat_grad/tuple/control_dependency_1Identity'gradients/main/q1_1/concat_grad/Slice_11^gradients/main/q1_1/concat_grad/tuple/group_deps*'
_output_shapes
:?????????*:
_class0
.,loc:@gradients/main/q1_1/concat_grad/Slice_1*
T0
o
"gradients/main/pi/sub_1_grad/ShapeShapemain/pi/sub_1/x*
out_type0*
T0*
_output_shapes
: 
q
$gradients/main/pi/sub_1_grad/Shape_1Shapemain/pi/pow_1*
out_type0*
_output_shapes
:*
T0
?
2gradients/main/pi/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/sub_1_grad/Shape$gradients/main/pi/sub_1_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
?
 gradients/main/pi/sub_1_grad/SumSum5gradients/main/pi/add_7_grad/tuple/control_dependency2gradients/main/pi/sub_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
_output_shapes
:*
T0
€
$gradients/main/pi/sub_1_grad/ReshapeReshape gradients/main/pi/sub_1_grad/Sum"gradients/main/pi/sub_1_grad/Shape*
_output_shapes
: *
T0*
Tshape0

 gradients/main/pi/sub_1_grad/NegNeg5gradients/main/pi/add_7_grad/tuple/control_dependency*
T0*'
_output_shapes
:?????????
Α
"gradients/main/pi/sub_1_grad/Sum_1Sum gradients/main/pi/sub_1_grad/Neg4gradients/main/pi/sub_1_grad/BroadcastGradientArgs:1*
	keep_dims( *
_output_shapes
:*
T0*

Tidx0
»
&gradients/main/pi/sub_1_grad/Reshape_1Reshape"gradients/main/pi/sub_1_grad/Sum_1$gradients/main/pi/sub_1_grad/Shape_1*
Tshape0*'
_output_shapes
:?????????*
T0

-gradients/main/pi/sub_1_grad/tuple/group_depsNoOp%^gradients/main/pi/sub_1_grad/Reshape'^gradients/main/pi/sub_1_grad/Reshape_1
ρ
5gradients/main/pi/sub_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/sub_1_grad/Reshape.^gradients/main/pi/sub_1_grad/tuple/group_deps*
_output_shapes
: *
T0*7
_class-
+)loc:@gradients/main/pi/sub_1_grad/Reshape

7gradients/main/pi/sub_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/sub_1_grad/Reshape_1.^gradients/main/pi/sub_1_grad/tuple/group_deps*'
_output_shapes
:?????????*
T0*9
_class/
-+loc:@gradients/main/pi/sub_1_grad/Reshape_1
m
gradients/main/mul_1_grad/ShapeShapemain/pi/Tanh_1*
out_type0*
T0*
_output_shapes
:
k
!gradients/main/mul_1_grad/Shape_1Shapemain/mul_1/y*
out_type0*
T0*
_output_shapes
: 
Ι
/gradients/main/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/main/mul_1_grad/Shape!gradients/main/mul_1_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
 
gradients/main/mul_1_grad/MulMul:gradients/main/q1_1/concat_grad/tuple/control_dependency_1main/mul_1/y*'
_output_shapes
:?????????*
T0
΄
gradients/main/mul_1_grad/SumSumgradients/main/mul_1_grad/Mul/gradients/main/mul_1_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
¬
!gradients/main/mul_1_grad/ReshapeReshapegradients/main/mul_1_grad/Sumgradients/main/mul_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:?????????
€
gradients/main/mul_1_grad/Mul_1Mulmain/pi/Tanh_1:gradients/main/q1_1/concat_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:?????????
Ί
gradients/main/mul_1_grad/Sum_1Sumgradients/main/mul_1_grad/Mul_11gradients/main/mul_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
‘
#gradients/main/mul_1_grad/Reshape_1Reshapegradients/main/mul_1_grad/Sum_1!gradients/main/mul_1_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0
|
*gradients/main/mul_1_grad/tuple/group_depsNoOp"^gradients/main/mul_1_grad/Reshape$^gradients/main/mul_1_grad/Reshape_1
φ
2gradients/main/mul_1_grad/tuple/control_dependencyIdentity!gradients/main/mul_1_grad/Reshape+^gradients/main/mul_1_grad/tuple/group_deps*4
_class*
(&loc:@gradients/main/mul_1_grad/Reshape*'
_output_shapes
:?????????*
T0
λ
4gradients/main/mul_1_grad/tuple/control_dependency_1Identity#gradients/main/mul_1_grad/Reshape_1+^gradients/main/mul_1_grad/tuple/group_deps*6
_class,
*(loc:@gradients/main/mul_1_grad/Reshape_1*
_output_shapes
: *
T0
p
"gradients/main/pi/pow_1_grad/ShapeShapemain/pi/Tanh_1*
T0*
out_type0*
_output_shapes
:
q
$gradients/main/pi/pow_1_grad/Shape_1Shapemain/pi/pow_1/y*
T0*
out_type0*
_output_shapes
: 
?
2gradients/main/pi/pow_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/pow_1_grad/Shape$gradients/main/pi/pow_1_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
£
 gradients/main/pi/pow_1_grad/mulMul7gradients/main/pi/sub_1_grad/tuple/control_dependency_1main/pi/pow_1/y*'
_output_shapes
:?????????*
T0
g
"gradients/main/pi/pow_1_grad/sub/yConst*
valueB
 *  ?*
_output_shapes
: *
dtype0
}
 gradients/main/pi/pow_1_grad/subSubmain/pi/pow_1/y"gradients/main/pi/pow_1_grad/sub/y*
T0*
_output_shapes
: 

 gradients/main/pi/pow_1_grad/PowPowmain/pi/Tanh_1 gradients/main/pi/pow_1_grad/sub*
T0*'
_output_shapes
:?????????

"gradients/main/pi/pow_1_grad/mul_1Mul gradients/main/pi/pow_1_grad/mul gradients/main/pi/pow_1_grad/Pow*
T0*'
_output_shapes
:?????????
Ώ
 gradients/main/pi/pow_1_grad/SumSum"gradients/main/pi/pow_1_grad/mul_12gradients/main/pi/pow_1_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *
T0*

Tidx0
΅
$gradients/main/pi/pow_1_grad/ReshapeReshape gradients/main/pi/pow_1_grad/Sum"gradients/main/pi/pow_1_grad/Shape*
Tshape0*
T0*'
_output_shapes
:?????????
k
&gradients/main/pi/pow_1_grad/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 

$gradients/main/pi/pow_1_grad/GreaterGreatermain/pi/Tanh_1&gradients/main/pi/pow_1_grad/Greater/y*
T0*'
_output_shapes
:?????????
z
,gradients/main/pi/pow_1_grad/ones_like/ShapeShapemain/pi/Tanh_1*
T0*
out_type0*
_output_shapes
:
q
,gradients/main/pi/pow_1_grad/ones_like/ConstConst*
valueB
 *  ?*
_output_shapes
: *
dtype0
Ξ
&gradients/main/pi/pow_1_grad/ones_likeFill,gradients/main/pi/pow_1_grad/ones_like/Shape,gradients/main/pi/pow_1_grad/ones_like/Const*
T0*

index_type0*'
_output_shapes
:?????????
½
#gradients/main/pi/pow_1_grad/SelectSelect$gradients/main/pi/pow_1_grad/Greatermain/pi/Tanh_1&gradients/main/pi/pow_1_grad/ones_like*
T0*'
_output_shapes
:?????????
~
 gradients/main/pi/pow_1_grad/LogLog#gradients/main/pi/pow_1_grad/Select*
T0*'
_output_shapes
:?????????
v
'gradients/main/pi/pow_1_grad/zeros_like	ZerosLikemain/pi/Tanh_1*
T0*'
_output_shapes
:?????????
?
%gradients/main/pi/pow_1_grad/Select_1Select$gradients/main/pi/pow_1_grad/Greater gradients/main/pi/pow_1_grad/Log'gradients/main/pi/pow_1_grad/zeros_like*
T0*'
_output_shapes
:?????????
£
"gradients/main/pi/pow_1_grad/mul_2Mul7gradients/main/pi/sub_1_grad/tuple/control_dependency_1main/pi/pow_1*
T0*'
_output_shapes
:?????????
¦
"gradients/main/pi/pow_1_grad/mul_3Mul"gradients/main/pi/pow_1_grad/mul_2%gradients/main/pi/pow_1_grad/Select_1*'
_output_shapes
:?????????*
T0
Γ
"gradients/main/pi/pow_1_grad/Sum_1Sum"gradients/main/pi/pow_1_grad/mul_34gradients/main/pi/pow_1_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
ͺ
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
:?????????
χ
7gradients/main/pi/pow_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/pow_1_grad/Reshape_1.^gradients/main/pi/pow_1_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/main/pi/pow_1_grad/Reshape_1*
_output_shapes
: 
ς
gradients/AddNAddN2gradients/main/mul_1_grad/tuple/control_dependency5gradients/main/pi/pow_1_grad/tuple/control_dependency*'
_output_shapes
:?????????*
N*
T0*4
_class*
(&loc:@gradients/main/mul_1_grad/Reshape

&gradients/main/pi/Tanh_1_grad/TanhGradTanhGradmain/pi/Tanh_1gradients/AddN*'
_output_shapes
:?????????*
T0
η
gradients/AddN_1AddN3gradients/main/pi/sub_grad/tuple/control_dependency&gradients/main/pi/Tanh_1_grad/TanhGrad*5
_class+
)'loc:@gradients/main/pi/sub_grad/Reshape*
N*'
_output_shapes
:?????????*
T0
y
"gradients/main/pi/add_2_grad/ShapeShapemain/pi/dense_2/BiasAdd*
_output_shapes
:*
out_type0*
T0
q
$gradients/main/pi/add_2_grad/Shape_1Shapemain/pi/mul_1*
_output_shapes
:*
out_type0*
T0
?
2gradients/main/pi/add_2_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_2_grad/Shape$gradients/main/pi/add_2_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
­
 gradients/main/pi/add_2_grad/SumSumgradients/AddN_12gradients/main/pi/add_2_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
΅
$gradients/main/pi/add_2_grad/ReshapeReshape gradients/main/pi/add_2_grad/Sum"gradients/main/pi/add_2_grad/Shape*
T0*
Tshape0*'
_output_shapes
:?????????
±
"gradients/main/pi/add_2_grad/Sum_1Sumgradients/AddN_14gradients/main/pi/add_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
»
&gradients/main/pi/add_2_grad/Reshape_1Reshape"gradients/main/pi/add_2_grad/Sum_1$gradients/main/pi/add_2_grad/Shape_1*'
_output_shapes
:?????????*
Tshape0*
T0

-gradients/main/pi/add_2_grad/tuple/group_depsNoOp%^gradients/main/pi/add_2_grad/Reshape'^gradients/main/pi/add_2_grad/Reshape_1

5gradients/main/pi/add_2_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_2_grad/Reshape.^gradients/main/pi/add_2_grad/tuple/group_deps*'
_output_shapes
:?????????*
T0*7
_class-
+)loc:@gradients/main/pi/add_2_grad/Reshape

7gradients/main/pi/add_2_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_2_grad/Reshape_1.^gradients/main/pi/add_2_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/main/pi/add_2_grad/Reshape_1*'
_output_shapes
:?????????
ϊ
gradients/AddN_2AddN5gradients/main/pi/sub_grad/tuple/control_dependency_15gradients/main/pi/add_2_grad/tuple/control_dependency*
T0*7
_class-
+)loc:@gradients/main/pi/sub_grad/Reshape_1*'
_output_shapes
:?????????*
N

2gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_2*
T0*
_output_shapes
:*
data_formatNHWC

7gradients/main/pi/dense_2/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_23^gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGrad

?gradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_28^gradients/main/pi/dense_2/BiasAdd_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/sub_grad/Reshape_1*
T0*'
_output_shapes
:?????????
§
Agradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGrad8^gradients/main/pi/dense_2/BiasAdd_grad/tuple/group_deps*
_output_shapes
:*E
_class;
97loc:@gradients/main/pi/dense_2/BiasAdd_grad/BiasAddGrad*
T0
w
"gradients/main/pi/mul_1_grad/ShapeShapemain/pi/random_normal*
T0*
out_type0*
_output_shapes
:
o
$gradients/main/pi/mul_1_grad/Shape_1Shapemain/pi/Exp*
out_type0*
_output_shapes
:*
T0
?
2gradients/main/pi/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/mul_1_grad/Shape$gradients/main/pi/mul_1_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????

 gradients/main/pi/mul_1_grad/MulMul7gradients/main/pi/add_2_grad/tuple/control_dependency_1main/pi/Exp*'
_output_shapes
:?????????*
T0
½
 gradients/main/pi/mul_1_grad/SumSum gradients/main/pi/mul_1_grad/Mul2gradients/main/pi/mul_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
_output_shapes
:*
	keep_dims( 
΅
$gradients/main/pi/mul_1_grad/ReshapeReshape gradients/main/pi/mul_1_grad/Sum"gradients/main/pi/mul_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:?????????
«
"gradients/main/pi/mul_1_grad/Mul_1Mulmain/pi/random_normal7gradients/main/pi/add_2_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:?????????
Γ
"gradients/main/pi/mul_1_grad/Sum_1Sum"gradients/main/pi/mul_1_grad/Mul_14gradients/main/pi/mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
»
&gradients/main/pi/mul_1_grad/Reshape_1Reshape"gradients/main/pi/mul_1_grad/Sum_1$gradients/main/pi/mul_1_grad/Shape_1*
Tshape0*'
_output_shapes
:?????????*
T0

-gradients/main/pi/mul_1_grad/tuple/group_depsNoOp%^gradients/main/pi/mul_1_grad/Reshape'^gradients/main/pi/mul_1_grad/Reshape_1

5gradients/main/pi/mul_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/mul_1_grad/Reshape.^gradients/main/pi/mul_1_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/mul_1_grad/Reshape*'
_output_shapes
:?????????

7gradients/main/pi/mul_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/mul_1_grad/Reshape_1.^gradients/main/pi/mul_1_grad/tuple/group_deps*'
_output_shapes
:?????????*
T0*9
_class/
-+loc:@gradients/main/pi/mul_1_grad/Reshape_1
ν
,gradients/main/pi/dense_2/MatMul_grad/MatMulMatMul?gradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependencymain/pi/dense_2/kernel/read*
transpose_a( *(
_output_shapes
:?????????¬*
T0*
transpose_b(
ί
.gradients/main/pi/dense_2/MatMul_grad/MatMul_1MatMulmain/pi/dense_1/Relu?gradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	¬*
transpose_b( *
transpose_a(*
T0

6gradients/main/pi/dense_2/MatMul_grad/tuple/group_depsNoOp-^gradients/main/pi/dense_2/MatMul_grad/MatMul/^gradients/main/pi/dense_2/MatMul_grad/MatMul_1
₯
>gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_2/MatMul_grad/MatMul7^gradients/main/pi/dense_2/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/main/pi/dense_2/MatMul_grad/MatMul*(
_output_shapes
:?????????¬
’
@gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/pi/dense_2/MatMul_grad/MatMul_17^gradients/main/pi/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*A
_class7
53loc:@gradients/main/pi/dense_2/MatMul_grad/MatMul_1*
T0

gradients/main/pi/Exp_grad/mulMul7gradients/main/pi/mul_1_grad/tuple/control_dependency_1main/pi/Exp*
T0*'
_output_shapes
:?????????

gradients/AddN_3AddN7gradients/main/pi/mul_2_grad/tuple/control_dependency_1 gradients/main/pi/Exp_1_grad/mulgradients/main/pi/Exp_grad/mul*'
_output_shapes
:?????????*9
_class/
-+loc:@gradients/main/pi/mul_2_grad/Reshape_1*
T0*
N
o
"gradients/main/pi/add_1_grad/ShapeShapemain/pi/add_1/x*
T0*
out_type0*
_output_shapes
: 
o
$gradients/main/pi/add_1_grad/Shape_1Shapemain/pi/mul*
_output_shapes
:*
out_type0*
T0
?
2gradients/main/pi/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/main/pi/add_1_grad/Shape$gradients/main/pi/add_1_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
­
 gradients/main/pi/add_1_grad/SumSumgradients/AddN_32gradients/main/pi/add_1_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0*
_output_shapes
:
€
$gradients/main/pi/add_1_grad/ReshapeReshape gradients/main/pi/add_1_grad/Sum"gradients/main/pi/add_1_grad/Shape*
_output_shapes
: *
T0*
Tshape0
±
"gradients/main/pi/add_1_grad/Sum_1Sumgradients/AddN_34gradients/main/pi/add_1_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0
»
&gradients/main/pi/add_1_grad/Reshape_1Reshape"gradients/main/pi/add_1_grad/Sum_1$gradients/main/pi/add_1_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:?????????

-gradients/main/pi/add_1_grad/tuple/group_depsNoOp%^gradients/main/pi/add_1_grad/Reshape'^gradients/main/pi/add_1_grad/Reshape_1
ρ
5gradients/main/pi/add_1_grad/tuple/control_dependencyIdentity$gradients/main/pi/add_1_grad/Reshape.^gradients/main/pi/add_1_grad/tuple/group_deps*
_output_shapes
: *7
_class-
+)loc:@gradients/main/pi/add_1_grad/Reshape*
T0

7gradients/main/pi/add_1_grad/tuple/control_dependency_1Identity&gradients/main/pi/add_1_grad/Reshape_1.^gradients/main/pi/add_1_grad/tuple/group_deps*'
_output_shapes
:?????????*
T0*9
_class/
-+loc:@gradients/main/pi/add_1_grad/Reshape_1
k
 gradients/main/pi/mul_grad/ShapeShapemain/pi/mul/x*
T0*
_output_shapes
: *
out_type0
m
"gradients/main/pi/mul_grad/Shape_1Shapemain/pi/add*
out_type0*
_output_shapes
:*
T0
Μ
0gradients/main/pi/mul_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/mul_grad/Shape"gradients/main/pi/mul_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0

gradients/main/pi/mul_grad/MulMul7gradients/main/pi/add_1_grad/tuple/control_dependency_1main/pi/add*
T0*'
_output_shapes
:?????????
·
gradients/main/pi/mul_grad/SumSumgradients/main/pi/mul_grad/Mul0gradients/main/pi/mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
_output_shapes
:*
	keep_dims( 

"gradients/main/pi/mul_grad/ReshapeReshapegradients/main/pi/mul_grad/Sum gradients/main/pi/mul_grad/Shape*
_output_shapes
: *
T0*
Tshape0
‘
 gradients/main/pi/mul_grad/Mul_1Mulmain/pi/mul/x7gradients/main/pi/add_1_grad/tuple/control_dependency_1*'
_output_shapes
:?????????*
T0
½
 gradients/main/pi/mul_grad/Sum_1Sum gradients/main/pi/mul_grad/Mul_12gradients/main/pi/mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
_output_shapes
:*
	keep_dims( 
΅
$gradients/main/pi/mul_grad/Reshape_1Reshape gradients/main/pi/mul_grad/Sum_1"gradients/main/pi/mul_grad/Shape_1*
Tshape0*'
_output_shapes
:?????????*
T0

+gradients/main/pi/mul_grad/tuple/group_depsNoOp#^gradients/main/pi/mul_grad/Reshape%^gradients/main/pi/mul_grad/Reshape_1
ι
3gradients/main/pi/mul_grad/tuple/control_dependencyIdentity"gradients/main/pi/mul_grad/Reshape,^gradients/main/pi/mul_grad/tuple/group_deps*5
_class+
)'loc:@gradients/main/pi/mul_grad/Reshape*
_output_shapes
: *
T0

5gradients/main/pi/mul_grad/tuple/control_dependency_1Identity$gradients/main/pi/mul_grad/Reshape_1,^gradients/main/pi/mul_grad/tuple/group_deps*7
_class-
+)loc:@gradients/main/pi/mul_grad/Reshape_1*
T0*'
_output_shapes
:?????????
t
 gradients/main/pi/add_grad/ShapeShapemain/pi/dense_3/Tanh*
out_type0*
T0*
_output_shapes
:
m
"gradients/main/pi/add_grad/Shape_1Shapemain/pi/add/y*
T0*
out_type0*
_output_shapes
: 
Μ
0gradients/main/pi/add_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/main/pi/add_grad/Shape"gradients/main/pi/add_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
Ξ
gradients/main/pi/add_grad/SumSum5gradients/main/pi/mul_grad/tuple/control_dependency_10gradients/main/pi/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0
―
"gradients/main/pi/add_grad/ReshapeReshapegradients/main/pi/add_grad/Sum gradients/main/pi/add_grad/Shape*
Tshape0*
T0*'
_output_shapes
:?????????
?
 gradients/main/pi/add_grad/Sum_1Sum5gradients/main/pi/mul_grad/tuple/control_dependency_12gradients/main/pi/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
€
$gradients/main/pi/add_grad/Reshape_1Reshape gradients/main/pi/add_grad/Sum_1"gradients/main/pi/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 

+gradients/main/pi/add_grad/tuple/group_depsNoOp#^gradients/main/pi/add_grad/Reshape%^gradients/main/pi/add_grad/Reshape_1
ϊ
3gradients/main/pi/add_grad/tuple/control_dependencyIdentity"gradients/main/pi/add_grad/Reshape,^gradients/main/pi/add_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????*5
_class+
)'loc:@gradients/main/pi/add_grad/Reshape
ο
5gradients/main/pi/add_grad/tuple/control_dependency_1Identity$gradients/main/pi/add_grad/Reshape_1,^gradients/main/pi/add_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/main/pi/add_grad/Reshape_1*
_output_shapes
: 
΅
,gradients/main/pi/dense_3/Tanh_grad/TanhGradTanhGradmain/pi/dense_3/Tanh3gradients/main/pi/add_grad/tuple/control_dependency*'
_output_shapes
:?????????*
T0
«
2gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients/main/pi/dense_3/Tanh_grad/TanhGrad*
data_formatNHWC*
T0*
_output_shapes
:
£
7gradients/main/pi/dense_3/BiasAdd_grad/tuple/group_depsNoOp3^gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGrad-^gradients/main/pi/dense_3/Tanh_grad/TanhGrad
¦
?gradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_3/Tanh_grad/TanhGrad8^gradients/main/pi/dense_3/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/main/pi/dense_3/Tanh_grad/TanhGrad*'
_output_shapes
:?????????
§
Agradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGrad8^gradients/main/pi/dense_3/BiasAdd_grad/tuple/group_deps*
_output_shapes
:*E
_class;
97loc:@gradients/main/pi/dense_3/BiasAdd_grad/BiasAddGrad*
T0
ν
,gradients/main/pi/dense_3/MatMul_grad/MatMulMatMul?gradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependencymain/pi/dense_3/kernel/read*
T0*(
_output_shapes
:?????????¬*
transpose_b(*
transpose_a( 
ί
.gradients/main/pi/dense_3/MatMul_grad/MatMul_1MatMulmain/pi/dense_1/Relu?gradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes
:	¬*
transpose_a(*
transpose_b( 

6gradients/main/pi/dense_3/MatMul_grad/tuple/group_depsNoOp-^gradients/main/pi/dense_3/MatMul_grad/MatMul/^gradients/main/pi/dense_3/MatMul_grad/MatMul_1
₯
>gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_3/MatMul_grad/MatMul7^gradients/main/pi/dense_3/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/pi/dense_3/MatMul_grad/MatMul*
T0*(
_output_shapes
:?????????¬
’
@gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/pi/dense_3/MatMul_grad/MatMul_17^gradients/main/pi/dense_3/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/main/pi/dense_3/MatMul_grad/MatMul_1*
_output_shapes
:	¬

gradients/AddN_4AddN>gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependency>gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependency*
N*
T0*?
_class5
31loc:@gradients/main/pi/dense_2/MatMul_grad/MatMul*(
_output_shapes
:?????????¬

,gradients/main/pi/dense_1/Relu_grad/ReluGradReluGradgradients/AddN_4main/pi/dense_1/Relu*
T0*(
_output_shapes
:?????????¬
¬
2gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients/main/pi/dense_1/Relu_grad/ReluGrad*
T0*
data_formatNHWC*
_output_shapes	
:¬
£
7gradients/main/pi/dense_1/BiasAdd_grad/tuple/group_depsNoOp3^gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGrad-^gradients/main/pi/dense_1/Relu_grad/ReluGrad
§
?gradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_1/Relu_grad/ReluGrad8^gradients/main/pi/dense_1/BiasAdd_grad/tuple/group_deps*(
_output_shapes
:?????????¬*?
_class5
31loc:@gradients/main/pi/dense_1/Relu_grad/ReluGrad*
T0
¨
Agradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGrad8^gradients/main/pi/dense_1/BiasAdd_grad/tuple/group_deps*E
_class;
97loc:@gradients/main/pi/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:¬
ν
,gradients/main/pi/dense_1/MatMul_grad/MatMulMatMul?gradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependencymain/pi/dense_1/kernel/read*
transpose_b(*
T0*
transpose_a( *(
_output_shapes
:?????????
ή
.gradients/main/pi/dense_1/MatMul_grad/MatMul_1MatMulmain/pi/dense/Relu?gradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependency* 
_output_shapes
:
¬*
transpose_b( *
transpose_a(*
T0

6gradients/main/pi/dense_1/MatMul_grad/tuple/group_depsNoOp-^gradients/main/pi/dense_1/MatMul_grad/MatMul/^gradients/main/pi/dense_1/MatMul_grad/MatMul_1
₯
>gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependencyIdentity,gradients/main/pi/dense_1/MatMul_grad/MatMul7^gradients/main/pi/dense_1/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/main/pi/dense_1/MatMul_grad/MatMul*
T0*(
_output_shapes
:?????????
£
@gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependency_1Identity.gradients/main/pi/dense_1/MatMul_grad/MatMul_17^gradients/main/pi/dense_1/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/main/pi/dense_1/MatMul_grad/MatMul_1* 
_output_shapes
:
¬
½
*gradients/main/pi/dense/Relu_grad/ReluGradReluGrad>gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependencymain/pi/dense/Relu*
T0*(
_output_shapes
:?????????
¨
0gradients/main/pi/dense/BiasAdd_grad/BiasAddGradBiasAddGrad*gradients/main/pi/dense/Relu_grad/ReluGrad*
_output_shapes	
:*
data_formatNHWC*
T0

5gradients/main/pi/dense/BiasAdd_grad/tuple/group_depsNoOp1^gradients/main/pi/dense/BiasAdd_grad/BiasAddGrad+^gradients/main/pi/dense/Relu_grad/ReluGrad

=gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependencyIdentity*gradients/main/pi/dense/Relu_grad/ReluGrad6^gradients/main/pi/dense/BiasAdd_grad/tuple/group_deps*
T0*(
_output_shapes
:?????????*=
_class3
1/loc:@gradients/main/pi/dense/Relu_grad/ReluGrad
 
?gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependency_1Identity0gradients/main/pi/dense/BiasAdd_grad/BiasAddGrad6^gradients/main/pi/dense/BiasAdd_grad/tuple/group_deps*C
_class9
75loc:@gradients/main/pi/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
ζ
*gradients/main/pi/dense/MatMul_grad/MatMulMatMul=gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependencymain/pi/dense/kernel/read*
transpose_a( *'
_output_shapes
:?????????6*
transpose_b(*
T0
Τ
,gradients/main/pi/dense/MatMul_grad/MatMul_1MatMulPlaceholder_1=gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(*
_output_shapes
:	6

4gradients/main/pi/dense/MatMul_grad/tuple/group_depsNoOp+^gradients/main/pi/dense/MatMul_grad/MatMul-^gradients/main/pi/dense/MatMul_grad/MatMul_1

<gradients/main/pi/dense/MatMul_grad/tuple/control_dependencyIdentity*gradients/main/pi/dense/MatMul_grad/MatMul5^gradients/main/pi/dense/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????6*=
_class3
1/loc:@gradients/main/pi/dense/MatMul_grad/MatMul

>gradients/main/pi/dense/MatMul_grad/tuple/control_dependency_1Identity,gradients/main/pi/dense/MatMul_grad/MatMul_15^gradients/main/pi/dense/MatMul_grad/tuple/group_deps*
_output_shapes
:	6*?
_class5
31loc:@gradients/main/pi/dense/MatMul_grad/MatMul_1*
T0

beta1_power/initial_valueConst*
_output_shapes
: *
dtype0*%
_class
loc:@main/pi/dense/bias*
valueB
 *fff?

beta1_power
VariableV2*
shared_name *
_output_shapes
: *%
_class
loc:@main/pi/dense/bias*
dtype0*
shape: *
	container 
΅
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
validate_shape(*%
_class
loc:@main/pi/dense/bias*
use_locking(*
T0*
_output_shapes
: 
q
beta1_power/readIdentitybeta1_power*
T0*%
_class
loc:@main/pi/dense/bias*
_output_shapes
: 

beta2_power/initial_valueConst*
valueB
 *wΎ?*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias*
dtype0

beta2_power
VariableV2*
dtype0*
	container *%
_class
loc:@main/pi/dense/bias*
shape: *
_output_shapes
: *
shared_name 
΅
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
_output_shapes
: *
use_locking(*
T0*
validate_shape(*%
_class
loc:@main/pi/dense/bias
q
beta2_power/readIdentitybeta2_power*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes
: 
΅
;main/pi/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"6     *'
_class
loc:@main/pi/dense/kernel

1main/pi/dense/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *'
_class
loc:@main/pi/dense/kernel*
_output_shapes
: *
dtype0

+main/pi/dense/kernel/Adam/Initializer/zerosFill;main/pi/dense/kernel/Adam/Initializer/zeros/shape_as_tensor1main/pi/dense/kernel/Adam/Initializer/zeros/Const*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel*

index_type0
Έ
main/pi/dense/kernel/Adam
VariableV2*
shared_name *
	container *
shape:	6*
dtype0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel
ξ
 main/pi/dense/kernel/Adam/AssignAssignmain/pi/dense/kernel/Adam+main/pi/dense/kernel/Adam/Initializer/zeros*
validate_shape(*
T0*
use_locking(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6

main/pi/dense/kernel/Adam/readIdentitymain/pi/dense/kernel/Adam*
_output_shapes
:	6*
T0*'
_class
loc:@main/pi/dense/kernel
·
=main/pi/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"6     *
_output_shapes
:*
dtype0*'
_class
loc:@main/pi/dense/kernel
‘
3main/pi/dense/kernel/Adam_1/Initializer/zeros/ConstConst*'
_class
loc:@main/pi/dense/kernel*
valueB
 *    *
dtype0*
_output_shapes
: 

-main/pi/dense/kernel/Adam_1/Initializer/zerosFill=main/pi/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor3main/pi/dense/kernel/Adam_1/Initializer/zeros/Const*
_output_shapes
:	6*
T0*'
_class
loc:@main/pi/dense/kernel*

index_type0
Ί
main/pi/dense/kernel/Adam_1
VariableV2*
shared_name *
shape:	6*
	container *
dtype0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel
τ
"main/pi/dense/kernel/Adam_1/AssignAssignmain/pi/dense/kernel/Adam_1-main/pi/dense/kernel/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes
:	6*
use_locking(*'
_class
loc:@main/pi/dense/kernel*
T0

 main/pi/dense/kernel/Adam_1/readIdentitymain/pi/dense/kernel/Adam_1*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel

)main/pi/dense/bias/Adam/Initializer/zerosConst*
_output_shapes	
:*
valueB*    *%
_class
loc:@main/pi/dense/bias*
dtype0
¬
main/pi/dense/bias/Adam
VariableV2*
shared_name *
dtype0*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
	container *
shape:
β
main/pi/dense/bias/Adam/AssignAssignmain/pi/dense/bias/Adam)main/pi/dense/bias/Adam/Initializer/zeros*
use_locking(*
validate_shape(*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias*
T0

main/pi/dense/bias/Adam/readIdentitymain/pi/dense/bias/Adam*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes	
:
‘
+main/pi/dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:*
dtype0*%
_class
loc:@main/pi/dense/bias*
valueB*    
?
main/pi/dense/bias/Adam_1
VariableV2*%
_class
loc:@main/pi/dense/bias*
dtype0*
shape:*
_output_shapes	
:*
shared_name *
	container 
θ
 main/pi/dense/bias/Adam_1/AssignAssignmain/pi/dense/bias/Adam_1+main/pi/dense/bias/Adam_1/Initializer/zeros*
_output_shapes	
:*
use_locking(*
T0*%
_class
loc:@main/pi/dense/bias*
validate_shape(

main/pi/dense/bias/Adam_1/readIdentitymain/pi/dense/bias/Adam_1*
T0*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias
Ή
=main/pi/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*
valueB"  ,  *)
_class
loc:@main/pi/dense_1/kernel
£
3main/pi/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    *)
_class
loc:@main/pi/dense_1/kernel

-main/pi/dense_1/kernel/Adam/Initializer/zerosFill=main/pi/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor3main/pi/dense_1/kernel/Adam/Initializer/zeros/Const*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*

index_type0
Ύ
main/pi/dense_1/kernel/Adam
VariableV2*
	container *
shared_name *)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
shape:
¬*
dtype0
χ
"main/pi/dense_1/kernel/Adam/AssignAssignmain/pi/dense_1/kernel/Adam-main/pi/dense_1/kernel/Adam/Initializer/zeros*
validate_shape(* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*
T0*
use_locking(

 main/pi/dense_1/kernel/Adam/readIdentitymain/pi/dense_1/kernel/Adam*
T0*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬
»
?main/pi/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB"  ,  *)
_class
loc:@main/pi/dense_1/kernel
₯
5main/pi/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*)
_class
loc:@main/pi/dense_1/kernel*
dtype0*
_output_shapes
: *
valueB
 *    

/main/pi/dense_1/kernel/Adam_1/Initializer/zerosFill?main/pi/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/pi/dense_1/kernel/Adam_1/Initializer/zeros/Const*)
_class
loc:@main/pi/dense_1/kernel*
T0*

index_type0* 
_output_shapes
:
¬
ΐ
main/pi/dense_1/kernel/Adam_1
VariableV2*
shape:
¬* 
_output_shapes
:
¬*
dtype0*
shared_name *)
_class
loc:@main/pi/dense_1/kernel*
	container 
ύ
$main/pi/dense_1/kernel/Adam_1/AssignAssignmain/pi/dense_1/kernel/Adam_1/main/pi/dense_1/kernel/Adam_1/Initializer/zeros* 
_output_shapes
:
¬*
use_locking(*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_1/kernel
£
"main/pi/dense_1/kernel/Adam_1/readIdentitymain/pi/dense_1/kernel/Adam_1*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
T0
£
+main/pi/dense_1/bias/Adam/Initializer/zerosConst*'
_class
loc:@main/pi/dense_1/bias*
valueB¬*    *
dtype0*
_output_shapes	
:¬
°
main/pi/dense_1/bias/Adam
VariableV2*'
_class
loc:@main/pi/dense_1/bias*
	container *
shape:¬*
shared_name *
dtype0*
_output_shapes	
:¬
κ
 main/pi/dense_1/bias/Adam/AssignAssignmain/pi/dense_1/bias/Adam+main/pi/dense_1/bias/Adam/Initializer/zeros*'
_class
loc:@main/pi/dense_1/bias*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:¬

main/pi/dense_1/bias/Adam/readIdentitymain/pi/dense_1/bias/Adam*
T0*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias
₯
-main/pi/dense_1/bias/Adam_1/Initializer/zerosConst*'
_class
loc:@main/pi/dense_1/bias*
_output_shapes	
:¬*
dtype0*
valueB¬*    
²
main/pi/dense_1/bias/Adam_1
VariableV2*
shape:¬*
dtype0*
shared_name *
	container *
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias
π
"main/pi/dense_1/bias/Adam_1/AssignAssignmain/pi/dense_1/bias/Adam_1-main/pi/dense_1/bias/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias*
use_locking(*
T0

 main/pi/dense_1/bias/Adam_1/readIdentitymain/pi/dense_1/bias/Adam_1*
_output_shapes	
:¬*
T0*'
_class
loc:@main/pi/dense_1/bias
Ή
=main/pi/dense_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*)
_class
loc:@main/pi/dense_2/kernel*
dtype0*
valueB",     *
_output_shapes
:
£
3main/pi/dense_2/kernel/Adam/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
: 

-main/pi/dense_2/kernel/Adam/Initializer/zerosFill=main/pi/dense_2/kernel/Adam/Initializer/zeros/shape_as_tensor3main/pi/dense_2/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬
Ό
main/pi/dense_2/kernel/Adam
VariableV2*
	container *
dtype0*
shared_name *
_output_shapes
:	¬*
shape:	¬*)
_class
loc:@main/pi/dense_2/kernel
φ
"main/pi/dense_2/kernel/Adam/AssignAssignmain/pi/dense_2/kernel/Adam-main/pi/dense_2/kernel/Adam/Initializer/zeros*
validate_shape(*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬*
T0*
use_locking(

 main/pi/dense_2/kernel/Adam/readIdentitymain/pi/dense_2/kernel/Adam*
_output_shapes
:	¬*
T0*)
_class
loc:@main/pi/dense_2/kernel
»
?main/pi/dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB",     *
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:
₯
5main/pi/dense_2/kernel/Adam_1/Initializer/zeros/ConstConst*
_output_shapes
: *)
_class
loc:@main/pi/dense_2/kernel*
valueB
 *    *
dtype0

/main/pi/dense_2/kernel/Adam_1/Initializer/zerosFill?main/pi/dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/pi/dense_2/kernel/Adam_1/Initializer/zeros/Const*

index_type0*)
_class
loc:@main/pi/dense_2/kernel*
T0*
_output_shapes
:	¬
Ύ
main/pi/dense_2/kernel/Adam_1
VariableV2*
_output_shapes
:	¬*
	container *
shared_name *
dtype0*)
_class
loc:@main/pi/dense_2/kernel*
shape:	¬
ό
$main/pi/dense_2/kernel/Adam_1/AssignAssignmain/pi/dense_2/kernel/Adam_1/main/pi/dense_2/kernel/Adam_1/Initializer/zeros*
validate_shape(*)
_class
loc:@main/pi/dense_2/kernel*
T0*
use_locking(*
_output_shapes
:	¬
’
"main/pi/dense_2/kernel/Adam_1/readIdentitymain/pi/dense_2/kernel/Adam_1*
T0*)
_class
loc:@main/pi/dense_2/kernel*
_output_shapes
:	¬
‘
+main/pi/dense_2/bias/Adam/Initializer/zerosConst*
valueB*    *'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
dtype0
?
main/pi/dense_2/bias/Adam
VariableV2*
shape:*
_output_shapes
:*
	container *
shared_name *
dtype0*'
_class
loc:@main/pi/dense_2/bias
ι
 main/pi/dense_2/bias/Adam/AssignAssignmain/pi/dense_2/bias/Adam+main/pi/dense_2/bias/Adam/Initializer/zeros*
use_locking(*
validate_shape(*
_output_shapes
:*'
_class
loc:@main/pi/dense_2/bias*
T0

main/pi/dense_2/bias/Adam/readIdentitymain/pi/dense_2/bias/Adam*
_output_shapes
:*
T0*'
_class
loc:@main/pi/dense_2/bias
£
-main/pi/dense_2/bias/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:
°
main/pi/dense_2/bias/Adam_1
VariableV2*
shape:*
	container *
shared_name *'
_class
loc:@main/pi/dense_2/bias*
dtype0*
_output_shapes
:
ο
"main/pi/dense_2/bias/Adam_1/AssignAssignmain/pi/dense_2/bias/Adam_1-main/pi/dense_2/bias/Adam_1/Initializer/zeros*'
_class
loc:@main/pi/dense_2/bias*
validate_shape(*
_output_shapes
:*
T0*
use_locking(

 main/pi/dense_2/bias/Adam_1/readIdentitymain/pi/dense_2/bias/Adam_1*
T0*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:
Ή
=main/pi/dense_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB",     *
dtype0*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:
£
3main/pi/dense_3/kernel/Adam/Initializer/zeros/ConstConst*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *    

-main/pi/dense_3/kernel/Adam/Initializer/zerosFill=main/pi/dense_3/kernel/Adam/Initializer/zeros/shape_as_tensor3main/pi/dense_3/kernel/Adam/Initializer/zeros/Const*)
_class
loc:@main/pi/dense_3/kernel*

index_type0*
T0*
_output_shapes
:	¬
Ό
main/pi/dense_3/kernel/Adam
VariableV2*
dtype0*
shared_name *
	container *
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
shape:	¬
φ
"main/pi/dense_3/kernel/Adam/AssignAssignmain/pi/dense_3/kernel/Adam-main/pi/dense_3/kernel/Adam/Initializer/zeros*
T0*
_output_shapes
:	¬*
use_locking(*
validate_shape(*)
_class
loc:@main/pi/dense_3/kernel

 main/pi/dense_3/kernel/Adam/readIdentitymain/pi/dense_3/kernel/Adam*)
_class
loc:@main/pi/dense_3/kernel*
T0*
_output_shapes
:	¬
»
?main/pi/dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:*
valueB",     
₯
5main/pi/dense_3/kernel/Adam_1/Initializer/zeros/ConstConst*)
_class
loc:@main/pi/dense_3/kernel*
valueB
 *    *
_output_shapes
: *
dtype0

/main/pi/dense_3/kernel/Adam_1/Initializer/zerosFill?main/pi/dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/pi/dense_3/kernel/Adam_1/Initializer/zeros/Const*
T0*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*

index_type0
Ύ
main/pi/dense_3/kernel/Adam_1
VariableV2*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
shape:	¬*
	container *
dtype0*
shared_name 
ό
$main/pi/dense_3/kernel/Adam_1/AssignAssignmain/pi/dense_3/kernel/Adam_1/main/pi/dense_3/kernel/Adam_1/Initializer/zeros*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_3/kernel*
T0*
use_locking(*
validate_shape(
’
"main/pi/dense_3/kernel/Adam_1/readIdentitymain/pi/dense_3/kernel/Adam_1*
T0*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬
‘
+main/pi/dense_3/bias/Adam/Initializer/zerosConst*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:*
dtype0*
valueB*    
?
main/pi/dense_3/bias/Adam
VariableV2*
_output_shapes
:*
dtype0*
shared_name *'
_class
loc:@main/pi/dense_3/bias*
	container *
shape:
ι
 main/pi/dense_3/bias/Adam/AssignAssignmain/pi/dense_3/bias/Adam+main/pi/dense_3/bias/Adam/Initializer/zeros*
_output_shapes
:*'
_class
loc:@main/pi/dense_3/bias*
use_locking(*
validate_shape(*
T0

main/pi/dense_3/bias/Adam/readIdentitymain/pi/dense_3/bias/Adam*
T0*
_output_shapes
:*'
_class
loc:@main/pi/dense_3/bias
£
-main/pi/dense_3/bias/Adam_1/Initializer/zerosConst*'
_class
loc:@main/pi/dense_3/bias*
_output_shapes
:*
valueB*    *
dtype0
°
main/pi/dense_3/bias/Adam_1
VariableV2*
shape:*
_output_shapes
:*
dtype0*
shared_name *'
_class
loc:@main/pi/dense_3/bias*
	container 
ο
"main/pi/dense_3/bias/Adam_1/AssignAssignmain/pi/dense_3/bias/Adam_1-main/pi/dense_3/bias/Adam_1/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*'
_class
loc:@main/pi/dense_3/bias*
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

Adam/beta1Const*
_output_shapes
: *
dtype0*
valueB
 *fff?
O

Adam/beta2Const*
valueB
 *wΎ?*
_output_shapes
: *
dtype0
Q
Adam/epsilonConst*
_output_shapes
: *
dtype0*
valueB
 *wΜ+2

*Adam/update_main/pi/dense/kernel/ApplyAdam	ApplyAdammain/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon>gradients/main/pi/dense/MatMul_grad/tuple/control_dependency_1*
_output_shapes
:	6*
T0*
use_nesterov( *'
_class
loc:@main/pi/dense/kernel*
use_locking( 

(Adam/update_main/pi/dense/bias/ApplyAdam	ApplyAdammain/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon?gradients/main/pi/dense/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:
ͺ
,Adam/update_main/pi/dense_1/kernel/ApplyAdam	ApplyAdammain/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/main/pi/dense_1/MatMul_grad/tuple/control_dependency_1* 
_output_shapes
:
¬*)
_class
loc:@main/pi/dense_1/kernel*
use_locking( *
use_nesterov( *
T0

*Adam/update_main/pi/dense_1/bias/ApplyAdam	ApplyAdammain/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonAgradients/main/pi/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
use_nesterov( *
_output_shapes	
:¬*'
_class
loc:@main/pi/dense_1/bias*
T0
©
,Adam/update_main/pi/dense_2/kernel/ApplyAdam	ApplyAdammain/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/main/pi/dense_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *)
_class
loc:@main/pi/dense_2/kernel*
T0*
_output_shapes
:	¬*
use_nesterov( 

*Adam/update_main/pi/dense_2/bias/ApplyAdam	ApplyAdammain/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonAgradients/main/pi/dense_2/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
T0*
_output_shapes
:*'
_class
loc:@main/pi/dense_2/bias*
use_locking( 
©
,Adam/update_main/pi/dense_3/kernel/ApplyAdam	ApplyAdammain/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/main/pi/dense_3/MatMul_grad/tuple/control_dependency_1*
T0*)
_class
loc:@main/pi/dense_3/kernel*
use_nesterov( *
_output_shapes
:	¬*
use_locking( 

*Adam/update_main/pi/dense_3/bias/ApplyAdam	ApplyAdammain/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonAgradients/main/pi/dense_3/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *'
_class
loc:@main/pi/dense_3/bias*
use_nesterov( 
α
Adam/mulMulbeta1_power/read
Adam/beta1)^Adam/update_main/pi/dense/bias/ApplyAdam+^Adam/update_main/pi/dense/kernel/ApplyAdam+^Adam/update_main/pi/dense_1/bias/ApplyAdam-^Adam/update_main/pi/dense_1/kernel/ApplyAdam+^Adam/update_main/pi/dense_2/bias/ApplyAdam-^Adam/update_main/pi/dense_2/kernel/ApplyAdam+^Adam/update_main/pi/dense_3/bias/ApplyAdam-^Adam/update_main/pi/dense_3/kernel/ApplyAdam*
T0*%
_class
loc:@main/pi/dense/bias*
_output_shapes
: 

Adam/AssignAssignbeta1_powerAdam/mul*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias*
use_locking( *
validate_shape(*
T0
γ

Adam/mul_1Mulbeta2_power/read
Adam/beta2)^Adam/update_main/pi/dense/bias/ApplyAdam+^Adam/update_main/pi/dense/kernel/ApplyAdam+^Adam/update_main/pi/dense_1/bias/ApplyAdam-^Adam/update_main/pi/dense_1/kernel/ApplyAdam+^Adam/update_main/pi/dense_2/bias/ApplyAdam-^Adam/update_main/pi/dense_2/kernel/ApplyAdam+^Adam/update_main/pi/dense_3/bias/ApplyAdam-^Adam/update_main/pi/dense_3/kernel/ApplyAdam*
_output_shapes
: *%
_class
loc:@main/pi/dense/bias*
T0
‘
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
_output_shapes
: *
validate_shape(*%
_class
loc:@main/pi/dense/bias*
T0*
use_locking( 

AdamNoOp^Adam/Assign^Adam/Assign_1)^Adam/update_main/pi/dense/bias/ApplyAdam+^Adam/update_main/pi/dense/kernel/ApplyAdam+^Adam/update_main/pi/dense_1/bias/ApplyAdam-^Adam/update_main/pi/dense_1/kernel/ApplyAdam+^Adam/update_main/pi/dense_2/bias/ApplyAdam-^Adam/update_main/pi/dense_2/kernel/ApplyAdam+^Adam/update_main/pi/dense_3/bias/ApplyAdam-^Adam/update_main/pi/dense_3/kernel/ApplyAdam
[
gradients_1/ShapeConst^Adam*
valueB *
_output_shapes
: *
dtype0
a
gradients_1/grad_ys_0Const^Adam*
_output_shapes
: *
valueB
 *  ?*
dtype0
u
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
I
'gradients_1/add_2_grad/tuple/group_depsNoOp^Adam^gradients_1/Fill
½
/gradients_1/add_2_grad/tuple/control_dependencyIdentitygradients_1/Fill(^gradients_1/add_2_grad/tuple/group_deps*#
_class
loc:@gradients_1/Fill*
T0*
_output_shapes
: 
Ώ
1gradients_1/add_2_grad/tuple/control_dependency_1Identitygradients_1/Fill(^gradients_1/add_2_grad/tuple/group_deps*
_output_shapes
: *
T0*#
_class
loc:@gradients_1/Fill
h
'gradients_1/add_1_grad/tuple/group_depsNoOp^Adam0^gradients_1/add_2_grad/tuple/control_dependency
ά
/gradients_1/add_1_grad/tuple/control_dependencyIdentity/gradients_1/add_2_grad/tuple/control_dependency(^gradients_1/add_1_grad/tuple/group_deps*#
_class
loc:@gradients_1/Fill*
T0*
_output_shapes
: 
ή
1gradients_1/add_1_grad/tuple/control_dependency_1Identity/gradients_1/add_2_grad/tuple/control_dependency(^gradients_1/add_1_grad/tuple/group_deps*#
_class
loc:@gradients_1/Fill*
T0*
_output_shapes
: 
}
gradients_1/mul_6_grad/MulMul1gradients_1/add_2_grad/tuple/control_dependency_1Mean_3*
T0*
_output_shapes
: 

gradients_1/mul_6_grad/Mul_1Mul1gradients_1/add_2_grad/tuple/control_dependency_1mul_6/x*
_output_shapes
: *
T0
r
'gradients_1/mul_6_grad/tuple/group_depsNoOp^Adam^gradients_1/mul_6_grad/Mul^gradients_1/mul_6_grad/Mul_1
Ρ
/gradients_1/mul_6_grad/tuple/control_dependencyIdentitygradients_1/mul_6_grad/Mul(^gradients_1/mul_6_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/mul_6_grad/Mul*
_output_shapes
: 
Χ
1gradients_1/mul_6_grad/tuple/control_dependency_1Identitygradients_1/mul_6_grad/Mul_1(^gradients_1/mul_6_grad/tuple/group_deps*/
_class%
#!loc:@gradients_1/mul_6_grad/Mul_1*
_output_shapes
: *
T0
{
gradients_1/mul_4_grad/MulMul/gradients_1/add_1_grad/tuple/control_dependencyMean_1*
_output_shapes
: *
T0
~
gradients_1/mul_4_grad/Mul_1Mul/gradients_1/add_1_grad/tuple/control_dependencymul_4/x*
T0*
_output_shapes
: 
r
'gradients_1/mul_4_grad/tuple/group_depsNoOp^Adam^gradients_1/mul_4_grad/Mul^gradients_1/mul_4_grad/Mul_1
Ρ
/gradients_1/mul_4_grad/tuple/control_dependencyIdentitygradients_1/mul_4_grad/Mul(^gradients_1/mul_4_grad/tuple/group_deps*
T0*
_output_shapes
: *-
_class#
!loc:@gradients_1/mul_4_grad/Mul
Χ
1gradients_1/mul_4_grad/tuple/control_dependency_1Identitygradients_1/mul_4_grad/Mul_1(^gradients_1/mul_4_grad/tuple/group_deps*
_output_shapes
: */
_class%
#!loc:@gradients_1/mul_4_grad/Mul_1*
T0
}
gradients_1/mul_5_grad/MulMul1gradients_1/add_1_grad/tuple/control_dependency_1Mean_2*
_output_shapes
: *
T0

gradients_1/mul_5_grad/Mul_1Mul1gradients_1/add_1_grad/tuple/control_dependency_1mul_5/x*
T0*
_output_shapes
: 
r
'gradients_1/mul_5_grad/tuple/group_depsNoOp^Adam^gradients_1/mul_5_grad/Mul^gradients_1/mul_5_grad/Mul_1
Ρ
/gradients_1/mul_5_grad/tuple/control_dependencyIdentitygradients_1/mul_5_grad/Mul(^gradients_1/mul_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/mul_5_grad/Mul*
_output_shapes
: 
Χ
1gradients_1/mul_5_grad/tuple/control_dependency_1Identitygradients_1/mul_5_grad/Mul_1(^gradients_1/mul_5_grad/tuple/group_deps*
_output_shapes
: *
T0*/
_class%
#!loc:@gradients_1/mul_5_grad/Mul_1
v
%gradients_1/Mean_3_grad/Reshape/shapeConst^Adam*
_output_shapes
:*
valueB:*
dtype0
·
gradients_1/Mean_3_grad/ReshapeReshape1gradients_1/mul_6_grad/tuple/control_dependency_1%gradients_1/Mean_3_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
i
gradients_1/Mean_3_grad/ShapeShapepow_2^Adam*
out_type0*
_output_shapes
:*
T0
€
gradients_1/Mean_3_grad/TileTilegradients_1/Mean_3_grad/Reshapegradients_1/Mean_3_grad/Shape*#
_output_shapes
:?????????*

Tmultiples0*
T0
k
gradients_1/Mean_3_grad/Shape_1Shapepow_2^Adam*
out_type0*
T0*
_output_shapes
:
i
gradients_1/Mean_3_grad/Shape_2Const^Adam*
dtype0*
_output_shapes
: *
valueB 
n
gradients_1/Mean_3_grad/ConstConst^Adam*
_output_shapes
:*
valueB: *
dtype0
’
gradients_1/Mean_3_grad/ProdProdgradients_1/Mean_3_grad/Shape_1gradients_1/Mean_3_grad/Const*
T0*

Tidx0*
	keep_dims( *
_output_shapes
: 
p
gradients_1/Mean_3_grad/Const_1Const^Adam*
dtype0*
_output_shapes
:*
valueB: 
¦
gradients_1/Mean_3_grad/Prod_1Prodgradients_1/Mean_3_grad/Shape_2gradients_1/Mean_3_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
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
gradients_1/Mean_3_grad/CastCast gradients_1/Mean_3_grad/floordiv*
Truncate( *

DstT0*

SrcT0*
_output_shapes
: 

gradients_1/Mean_3_grad/truedivRealDivgradients_1/Mean_3_grad/Tilegradients_1/Mean_3_grad/Cast*
T0*#
_output_shapes
:?????????
v
%gradients_1/Mean_1_grad/Reshape/shapeConst^Adam*
_output_shapes
:*
valueB:*
dtype0
·
gradients_1/Mean_1_grad/ReshapeReshape1gradients_1/mul_4_grad/tuple/control_dependency_1%gradients_1/Mean_1_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
g
gradients_1/Mean_1_grad/ShapeShapepow^Adam*
_output_shapes
:*
out_type0*
T0
€
gradients_1/Mean_1_grad/TileTilegradients_1/Mean_1_grad/Reshapegradients_1/Mean_1_grad/Shape*
T0*

Tmultiples0*#
_output_shapes
:?????????
i
gradients_1/Mean_1_grad/Shape_1Shapepow^Adam*
_output_shapes
:*
T0*
out_type0
i
gradients_1/Mean_1_grad/Shape_2Const^Adam*
valueB *
dtype0*
_output_shapes
: 
n
gradients_1/Mean_1_grad/ConstConst^Adam*
valueB: *
_output_shapes
:*
dtype0
’
gradients_1/Mean_1_grad/ProdProdgradients_1/Mean_1_grad/Shape_1gradients_1/Mean_1_grad/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
p
gradients_1/Mean_1_grad/Const_1Const^Adam*
valueB: *
dtype0*
_output_shapes
:
¦
gradients_1/Mean_1_grad/Prod_1Prodgradients_1/Mean_1_grad/Shape_2gradients_1/Mean_1_grad/Const_1*
_output_shapes
: *
	keep_dims( *
T0*

Tidx0
j
!gradients_1/Mean_1_grad/Maximum/yConst^Adam*
_output_shapes
: *
value	B :*
dtype0
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
gradients_1/Mean_1_grad/truedivRealDivgradients_1/Mean_1_grad/Tilegradients_1/Mean_1_grad/Cast*#
_output_shapes
:?????????*
T0
v
%gradients_1/Mean_2_grad/Reshape/shapeConst^Adam*
valueB:*
_output_shapes
:*
dtype0
·
gradients_1/Mean_2_grad/ReshapeReshape1gradients_1/mul_5_grad/tuple/control_dependency_1%gradients_1/Mean_2_grad/Reshape/shape*
_output_shapes
:*
Tshape0*
T0
i
gradients_1/Mean_2_grad/ShapeShapepow_1^Adam*
out_type0*
_output_shapes
:*
T0
€
gradients_1/Mean_2_grad/TileTilegradients_1/Mean_2_grad/Reshapegradients_1/Mean_2_grad/Shape*#
_output_shapes
:?????????*

Tmultiples0*
T0
k
gradients_1/Mean_2_grad/Shape_1Shapepow_1^Adam*
out_type0*
_output_shapes
:*
T0
i
gradients_1/Mean_2_grad/Shape_2Const^Adam*
_output_shapes
: *
dtype0*
valueB 
n
gradients_1/Mean_2_grad/ConstConst^Adam*
dtype0*
valueB: *
_output_shapes
:
’
gradients_1/Mean_2_grad/ProdProdgradients_1/Mean_2_grad/Shape_1gradients_1/Mean_2_grad/Const*
T0*

Tidx0*
_output_shapes
: *
	keep_dims( 
p
gradients_1/Mean_2_grad/Const_1Const^Adam*
dtype0*
valueB: *
_output_shapes
:
¦
gradients_1/Mean_2_grad/Prod_1Prodgradients_1/Mean_2_grad/Shape_2gradients_1/Mean_2_grad/Const_1*

Tidx0*
	keep_dims( *
_output_shapes
: *
T0
j
!gradients_1/Mean_2_grad/Maximum/yConst^Adam*
_output_shapes
: *
value	B :*
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
gradients_1/Mean_2_grad/CastCast gradients_1/Mean_2_grad/floordiv*
Truncate( *

SrcT0*

DstT0*
_output_shapes
: 

gradients_1/Mean_2_grad/truedivRealDivgradients_1/Mean_2_grad/Tilegradients_1/Mean_2_grad/Cast*#
_output_shapes
:?????????*
T0
h
gradients_1/pow_2_grad/ShapeShapesub_5^Adam*
T0*
_output_shapes
:*
out_type0
j
gradients_1/pow_2_grad/Shape_1Shapepow_2/y^Adam*
_output_shapes
: *
out_type0*
T0
ΐ
,gradients_1/pow_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/pow_2_grad/Shapegradients_1/pow_2_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
y
gradients_1/pow_2_grad/mulMulgradients_1/Mean_3_grad/truedivpow_2/y*#
_output_shapes
:?????????*
T0
h
gradients_1/pow_2_grad/sub/yConst^Adam*
dtype0*
_output_shapes
: *
valueB
 *  ?
i
gradients_1/pow_2_grad/subSubpow_2/ygradients_1/pow_2_grad/sub/y*
T0*
_output_shapes
: 
r
gradients_1/pow_2_grad/PowPowsub_5gradients_1/pow_2_grad/sub*#
_output_shapes
:?????????*
T0

gradients_1/pow_2_grad/mul_1Mulgradients_1/pow_2_grad/mulgradients_1/pow_2_grad/Pow*#
_output_shapes
:?????????*
T0
­
gradients_1/pow_2_grad/SumSumgradients_1/pow_2_grad/mul_1,gradients_1/pow_2_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*

Tidx0*
	keep_dims( 

gradients_1/pow_2_grad/ReshapeReshapegradients_1/pow_2_grad/Sumgradients_1/pow_2_grad/Shape*#
_output_shapes
:?????????*
Tshape0*
T0
l
 gradients_1/pow_2_grad/Greater/yConst^Adam*
_output_shapes
: *
valueB
 *    *
dtype0

gradients_1/pow_2_grad/GreaterGreatersub_5 gradients_1/pow_2_grad/Greater/y*
T0*#
_output_shapes
:?????????
r
&gradients_1/pow_2_grad/ones_like/ShapeShapesub_5^Adam*
_output_shapes
:*
T0*
out_type0
r
&gradients_1/pow_2_grad/ones_like/ConstConst^Adam*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Έ
 gradients_1/pow_2_grad/ones_likeFill&gradients_1/pow_2_grad/ones_like/Shape&gradients_1/pow_2_grad/ones_like/Const*
T0*

index_type0*#
_output_shapes
:?????????

gradients_1/pow_2_grad/SelectSelectgradients_1/pow_2_grad/Greatersub_5 gradients_1/pow_2_grad/ones_like*
T0*#
_output_shapes
:?????????
n
gradients_1/pow_2_grad/LogLoggradients_1/pow_2_grad/Select*
T0*#
_output_shapes
:?????????
j
!gradients_1/pow_2_grad/zeros_like	ZerosLikesub_5^Adam*#
_output_shapes
:?????????*
T0
Ά
gradients_1/pow_2_grad/Select_1Selectgradients_1/pow_2_grad/Greatergradients_1/pow_2_grad/Log!gradients_1/pow_2_grad/zeros_like*#
_output_shapes
:?????????*
T0
y
gradients_1/pow_2_grad/mul_2Mulgradients_1/Mean_3_grad/truedivpow_2*
T0*#
_output_shapes
:?????????

gradients_1/pow_2_grad/mul_3Mulgradients_1/pow_2_grad/mul_2gradients_1/pow_2_grad/Select_1*#
_output_shapes
:?????????*
T0
±
gradients_1/pow_2_grad/Sum_1Sumgradients_1/pow_2_grad/mul_3.gradients_1/pow_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
_output_shapes
:*
	keep_dims( 

 gradients_1/pow_2_grad/Reshape_1Reshapegradients_1/pow_2_grad/Sum_1gradients_1/pow_2_grad/Shape_1*
_output_shapes
: *
Tshape0*
T0
z
'gradients_1/pow_2_grad/tuple/group_depsNoOp^Adam^gradients_1/pow_2_grad/Reshape!^gradients_1/pow_2_grad/Reshape_1
ζ
/gradients_1/pow_2_grad/tuple/control_dependencyIdentitygradients_1/pow_2_grad/Reshape(^gradients_1/pow_2_grad/tuple/group_deps*
T0*#
_output_shapes
:?????????*1
_class'
%#loc:@gradients_1/pow_2_grad/Reshape
ί
1gradients_1/pow_2_grad/tuple/control_dependency_1Identity gradients_1/pow_2_grad/Reshape_1(^gradients_1/pow_2_grad/tuple/group_deps*
T0*
_output_shapes
: *3
_class)
'%loc:@gradients_1/pow_2_grad/Reshape_1
f
gradients_1/pow_grad/ShapeShapesub_3^Adam*
T0*
_output_shapes
:*
out_type0
f
gradients_1/pow_grad/Shape_1Shapepow/y^Adam*
out_type0*
T0*
_output_shapes
: 
Ί
*gradients_1/pow_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/pow_grad/Shapegradients_1/pow_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
u
gradients_1/pow_grad/mulMulgradients_1/Mean_1_grad/truedivpow/y*
T0*#
_output_shapes
:?????????
f
gradients_1/pow_grad/sub/yConst^Adam*
dtype0*
_output_shapes
: *
valueB
 *  ?
c
gradients_1/pow_grad/subSubpow/ygradients_1/pow_grad/sub/y*
_output_shapes
: *
T0
n
gradients_1/pow_grad/PowPowsub_3gradients_1/pow_grad/sub*#
_output_shapes
:?????????*
T0

gradients_1/pow_grad/mul_1Mulgradients_1/pow_grad/mulgradients_1/pow_grad/Pow*
T0*#
_output_shapes
:?????????
§
gradients_1/pow_grad/SumSumgradients_1/pow_grad/mul_1*gradients_1/pow_grad/BroadcastGradientArgs*
T0*
	keep_dims( *
_output_shapes
:*

Tidx0

gradients_1/pow_grad/ReshapeReshapegradients_1/pow_grad/Sumgradients_1/pow_grad/Shape*#
_output_shapes
:?????????*
Tshape0*
T0
j
gradients_1/pow_grad/Greater/yConst^Adam*
dtype0*
_output_shapes
: *
valueB
 *    
|
gradients_1/pow_grad/GreaterGreatersub_3gradients_1/pow_grad/Greater/y*
T0*#
_output_shapes
:?????????
p
$gradients_1/pow_grad/ones_like/ShapeShapesub_3^Adam*
out_type0*
_output_shapes
:*
T0
p
$gradients_1/pow_grad/ones_like/ConstConst^Adam*
_output_shapes
: *
dtype0*
valueB
 *  ?
²
gradients_1/pow_grad/ones_likeFill$gradients_1/pow_grad/ones_like/Shape$gradients_1/pow_grad/ones_like/Const*

index_type0*#
_output_shapes
:?????????*
T0

gradients_1/pow_grad/SelectSelectgradients_1/pow_grad/Greatersub_3gradients_1/pow_grad/ones_like*
T0*#
_output_shapes
:?????????
j
gradients_1/pow_grad/LogLoggradients_1/pow_grad/Select*#
_output_shapes
:?????????*
T0
h
gradients_1/pow_grad/zeros_like	ZerosLikesub_3^Adam*#
_output_shapes
:?????????*
T0
?
gradients_1/pow_grad/Select_1Selectgradients_1/pow_grad/Greatergradients_1/pow_grad/Loggradients_1/pow_grad/zeros_like*
T0*#
_output_shapes
:?????????
u
gradients_1/pow_grad/mul_2Mulgradients_1/Mean_1_grad/truedivpow*#
_output_shapes
:?????????*
T0

gradients_1/pow_grad/mul_3Mulgradients_1/pow_grad/mul_2gradients_1/pow_grad/Select_1*
T0*#
_output_shapes
:?????????
«
gradients_1/pow_grad/Sum_1Sumgradients_1/pow_grad/mul_3,gradients_1/pow_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_1/pow_grad/Reshape_1Reshapegradients_1/pow_grad/Sum_1gradients_1/pow_grad/Shape_1*
T0*
_output_shapes
: *
Tshape0
t
%gradients_1/pow_grad/tuple/group_depsNoOp^Adam^gradients_1/pow_grad/Reshape^gradients_1/pow_grad/Reshape_1
ή
-gradients_1/pow_grad/tuple/control_dependencyIdentitygradients_1/pow_grad/Reshape&^gradients_1/pow_grad/tuple/group_deps*#
_output_shapes
:?????????*/
_class%
#!loc:@gradients_1/pow_grad/Reshape*
T0
Χ
/gradients_1/pow_grad/tuple/control_dependency_1Identitygradients_1/pow_grad/Reshape_1&^gradients_1/pow_grad/tuple/group_deps*
_output_shapes
: *
T0*1
_class'
%#loc:@gradients_1/pow_grad/Reshape_1
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
ΐ
,gradients_1/pow_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/pow_1_grad/Shapegradients_1/pow_1_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
y
gradients_1/pow_1_grad/mulMulgradients_1/Mean_2_grad/truedivpow_1/y*
T0*#
_output_shapes
:?????????
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
:?????????*
T0

gradients_1/pow_1_grad/mul_1Mulgradients_1/pow_1_grad/mulgradients_1/pow_1_grad/Pow*#
_output_shapes
:?????????*
T0
­
gradients_1/pow_1_grad/SumSumgradients_1/pow_1_grad/mul_1,gradients_1/pow_1_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0*
_output_shapes
:

gradients_1/pow_1_grad/ReshapeReshapegradients_1/pow_1_grad/Sumgradients_1/pow_1_grad/Shape*
T0*#
_output_shapes
:?????????*
Tshape0
l
 gradients_1/pow_1_grad/Greater/yConst^Adam*
_output_shapes
: *
valueB
 *    *
dtype0

gradients_1/pow_1_grad/GreaterGreatersub_4 gradients_1/pow_1_grad/Greater/y*
T0*#
_output_shapes
:?????????
r
&gradients_1/pow_1_grad/ones_like/ShapeShapesub_4^Adam*
_output_shapes
:*
out_type0*
T0
r
&gradients_1/pow_1_grad/ones_like/ConstConst^Adam*
_output_shapes
: *
dtype0*
valueB
 *  ?
Έ
 gradients_1/pow_1_grad/ones_likeFill&gradients_1/pow_1_grad/ones_like/Shape&gradients_1/pow_1_grad/ones_like/Const*#
_output_shapes
:?????????*

index_type0*
T0

gradients_1/pow_1_grad/SelectSelectgradients_1/pow_1_grad/Greatersub_4 gradients_1/pow_1_grad/ones_like*#
_output_shapes
:?????????*
T0
n
gradients_1/pow_1_grad/LogLoggradients_1/pow_1_grad/Select*
T0*#
_output_shapes
:?????????
j
!gradients_1/pow_1_grad/zeros_like	ZerosLikesub_4^Adam*
T0*#
_output_shapes
:?????????
Ά
gradients_1/pow_1_grad/Select_1Selectgradients_1/pow_1_grad/Greatergradients_1/pow_1_grad/Log!gradients_1/pow_1_grad/zeros_like*
T0*#
_output_shapes
:?????????
y
gradients_1/pow_1_grad/mul_2Mulgradients_1/Mean_2_grad/truedivpow_1*#
_output_shapes
:?????????*
T0

gradients_1/pow_1_grad/mul_3Mulgradients_1/pow_1_grad/mul_2gradients_1/pow_1_grad/Select_1*#
_output_shapes
:?????????*
T0
±
gradients_1/pow_1_grad/Sum_1Sumgradients_1/pow_1_grad/mul_3.gradients_1/pow_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
_output_shapes
:*
T0

 gradients_1/pow_1_grad/Reshape_1Reshapegradients_1/pow_1_grad/Sum_1gradients_1/pow_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
z
'gradients_1/pow_1_grad/tuple/group_depsNoOp^Adam^gradients_1/pow_1_grad/Reshape!^gradients_1/pow_1_grad/Reshape_1
ζ
/gradients_1/pow_1_grad/tuple/control_dependencyIdentitygradients_1/pow_1_grad/Reshape(^gradients_1/pow_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/pow_1_grad/Reshape*#
_output_shapes
:?????????
ί
1gradients_1/pow_1_grad/tuple/control_dependency_1Identity gradients_1/pow_1_grad/Reshape_1(^gradients_1/pow_1_grad/tuple/group_deps*
T0*
_output_shapes
: *3
_class)
'%loc:@gradients_1/pow_1_grad/Reshape_1
q
gradients_1/sub_5_grad/ShapeShapeStopGradient_1^Adam*
T0*
out_type0*
_output_shapes
:
s
gradients_1/sub_5_grad/Shape_1Shapemain/v/Squeeze^Adam*
T0*
_output_shapes
:*
out_type0
ΐ
,gradients_1/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_5_grad/Shapegradients_1/sub_5_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
ΐ
gradients_1/sub_5_grad/SumSum/gradients_1/pow_2_grad/tuple/control_dependency,gradients_1/sub_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:

gradients_1/sub_5_grad/ReshapeReshapegradients_1/sub_5_grad/Sumgradients_1/sub_5_grad/Shape*
Tshape0*
T0*#
_output_shapes
:?????????

gradients_1/sub_5_grad/NegNeg/gradients_1/pow_2_grad/tuple/control_dependency*
T0*#
_output_shapes
:?????????
―
gradients_1/sub_5_grad/Sum_1Sumgradients_1/sub_5_grad/Neg.gradients_1/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
₯
 gradients_1/sub_5_grad/Reshape_1Reshapegradients_1/sub_5_grad/Sum_1gradients_1/sub_5_grad/Shape_1*
Tshape0*
T0*#
_output_shapes
:?????????
z
'gradients_1/sub_5_grad/tuple/group_depsNoOp^Adam^gradients_1/sub_5_grad/Reshape!^gradients_1/sub_5_grad/Reshape_1
ζ
/gradients_1/sub_5_grad/tuple/control_dependencyIdentitygradients_1/sub_5_grad/Reshape(^gradients_1/sub_5_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/sub_5_grad/Reshape*
T0*#
_output_shapes
:?????????
μ
1gradients_1/sub_5_grad/tuple/control_dependency_1Identity gradients_1/sub_5_grad/Reshape_1(^gradients_1/sub_5_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/sub_5_grad/Reshape_1*
T0*#
_output_shapes
:?????????
o
gradients_1/sub_3_grad/ShapeShapeStopGradient^Adam*
T0*
_output_shapes
:*
out_type0
t
gradients_1/sub_3_grad/Shape_1Shapemain/q1/Squeeze^Adam*
T0*
out_type0*
_output_shapes
:
ΐ
,gradients_1/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_3_grad/Shapegradients_1/sub_3_grad/Shape_1*
T0*2
_output_shapes 
:?????????:?????????
Ύ
gradients_1/sub_3_grad/SumSum-gradients_1/pow_grad/tuple/control_dependency,gradients_1/sub_3_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0

gradients_1/sub_3_grad/ReshapeReshapegradients_1/sub_3_grad/Sumgradients_1/sub_3_grad/Shape*#
_output_shapes
:?????????*
Tshape0*
T0
~
gradients_1/sub_3_grad/NegNeg-gradients_1/pow_grad/tuple/control_dependency*
T0*#
_output_shapes
:?????????
―
gradients_1/sub_3_grad/Sum_1Sumgradients_1/sub_3_grad/Neg.gradients_1/sub_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
₯
 gradients_1/sub_3_grad/Reshape_1Reshapegradients_1/sub_3_grad/Sum_1gradients_1/sub_3_grad/Shape_1*#
_output_shapes
:?????????*
T0*
Tshape0
z
'gradients_1/sub_3_grad/tuple/group_depsNoOp^Adam^gradients_1/sub_3_grad/Reshape!^gradients_1/sub_3_grad/Reshape_1
ζ
/gradients_1/sub_3_grad/tuple/control_dependencyIdentitygradients_1/sub_3_grad/Reshape(^gradients_1/sub_3_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/sub_3_grad/Reshape*#
_output_shapes
:?????????*
T0
μ
1gradients_1/sub_3_grad/tuple/control_dependency_1Identity gradients_1/sub_3_grad/Reshape_1(^gradients_1/sub_3_grad/tuple/group_deps*
T0*#
_output_shapes
:?????????*3
_class)
'%loc:@gradients_1/sub_3_grad/Reshape_1
o
gradients_1/sub_4_grad/ShapeShapeStopGradient^Adam*
T0*
_output_shapes
:*
out_type0
t
gradients_1/sub_4_grad/Shape_1Shapemain/q2/Squeeze^Adam*
_output_shapes
:*
out_type0*
T0
ΐ
,gradients_1/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_4_grad/Shapegradients_1/sub_4_grad/Shape_1*2
_output_shapes 
:?????????:?????????*
T0
ΐ
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
:?????????*
Tshape0

gradients_1/sub_4_grad/NegNeg/gradients_1/pow_1_grad/tuple/control_dependency*#
_output_shapes
:?????????*
T0
―
gradients_1/sub_4_grad/Sum_1Sumgradients_1/sub_4_grad/Neg.gradients_1/sub_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*

Tidx0*
	keep_dims( 
₯
 gradients_1/sub_4_grad/Reshape_1Reshapegradients_1/sub_4_grad/Sum_1gradients_1/sub_4_grad/Shape_1*#
_output_shapes
:?????????*
T0*
Tshape0
z
'gradients_1/sub_4_grad/tuple/group_depsNoOp^Adam^gradients_1/sub_4_grad/Reshape!^gradients_1/sub_4_grad/Reshape_1
ζ
/gradients_1/sub_4_grad/tuple/control_dependencyIdentitygradients_1/sub_4_grad/Reshape(^gradients_1/sub_4_grad/tuple/group_deps*#
_output_shapes
:?????????*1
_class'
%#loc:@gradients_1/sub_4_grad/Reshape*
T0
μ
1gradients_1/sub_4_grad/tuple/control_dependency_1Identity gradients_1/sub_4_grad/Reshape_1(^gradients_1/sub_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_4_grad/Reshape_1*#
_output_shapes
:?????????

%gradients_1/main/v/Squeeze_grad/ShapeShapemain/v/dense_2/BiasAdd^Adam*
out_type0*
_output_shapes
:*
T0
Μ
'gradients_1/main/v/Squeeze_grad/ReshapeReshape1gradients_1/sub_5_grad/tuple/control_dependency_1%gradients_1/main/v/Squeeze_grad/Shape*
Tshape0*'
_output_shapes
:?????????*
T0

&gradients_1/main/q1/Squeeze_grad/ShapeShapemain/q1/dense_2/BiasAdd^Adam*
_output_shapes
:*
out_type0*
T0
Ξ
(gradients_1/main/q1/Squeeze_grad/ReshapeReshape1gradients_1/sub_3_grad/tuple/control_dependency_1&gradients_1/main/q1/Squeeze_grad/Shape*'
_output_shapes
:?????????*
T0*
Tshape0

&gradients_1/main/q2/Squeeze_grad/ShapeShapemain/q2/dense_2/BiasAdd^Adam*
_output_shapes
:*
T0*
out_type0
Ξ
(gradients_1/main/q2/Squeeze_grad/ReshapeReshape1gradients_1/sub_4_grad/tuple/control_dependency_1&gradients_1/main/q2/Squeeze_grad/Shape*
T0*
Tshape0*'
_output_shapes
:?????????
§
3gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad'gradients_1/main/v/Squeeze_grad/Reshape*
data_formatNHWC*
_output_shapes
:*
T0
§
8gradients_1/main/v/dense_2/BiasAdd_grad/tuple/group_depsNoOp^Adam(^gradients_1/main/v/Squeeze_grad/Reshape4^gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGrad

@gradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity'gradients_1/main/v/Squeeze_grad/Reshape9^gradients_1/main/v/dense_2/BiasAdd_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????*:
_class0
.,loc:@gradients_1/main/v/Squeeze_grad/Reshape
«
Bgradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity3gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGrad9^gradients_1/main/v/dense_2/BiasAdd_grad/tuple/group_deps*
_output_shapes
:*
T0*F
_class<
:8loc:@gradients_1/main/v/dense_2/BiasAdd_grad/BiasAddGrad
©
4gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad(gradients_1/main/q1/Squeeze_grad/Reshape*
T0*
data_formatNHWC*
_output_shapes
:
ͺ
9gradients_1/main/q1/dense_2/BiasAdd_grad/tuple/group_depsNoOp^Adam)^gradients_1/main/q1/Squeeze_grad/Reshape5^gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGrad
’
Agradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity(gradients_1/main/q1/Squeeze_grad/Reshape:^gradients_1/main/q1/dense_2/BiasAdd_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????*;
_class1
/-loc:@gradients_1/main/q1/Squeeze_grad/Reshape
―
Cgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q1/dense_2/BiasAdd_grad/tuple/group_deps*
_output_shapes
:*
T0*G
_class=
;9loc:@gradients_1/main/q1/dense_2/BiasAdd_grad/BiasAddGrad
©
4gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad(gradients_1/main/q2/Squeeze_grad/Reshape*
data_formatNHWC*
_output_shapes
:*
T0
ͺ
9gradients_1/main/q2/dense_2/BiasAdd_grad/tuple/group_depsNoOp^Adam)^gradients_1/main/q2/Squeeze_grad/Reshape5^gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGrad
’
Agradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity(gradients_1/main/q2/Squeeze_grad/Reshape:^gradients_1/main/q2/dense_2/BiasAdd_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????*;
_class1
/-loc:@gradients_1/main/q2/Squeeze_grad/Reshape
―
Cgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q2/dense_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*G
_class=
;9loc:@gradients_1/main/q2/dense_2/BiasAdd_grad/BiasAddGrad
ξ
-gradients_1/main/v/dense_2/MatMul_grad/MatMulMatMul@gradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependencymain/v/dense_2/kernel/read*
T0*
transpose_b(*(
_output_shapes
:?????????¬*
transpose_a( 
ΰ
/gradients_1/main/v/dense_2/MatMul_grad/MatMul_1MatMulmain/v/dense_1/Relu@gradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	¬*
T0*
transpose_b( *
transpose_a(
¨
7gradients_1/main/v/dense_2/MatMul_grad/tuple/group_depsNoOp^Adam.^gradients_1/main/v/dense_2/MatMul_grad/MatMul0^gradients_1/main/v/dense_2/MatMul_grad/MatMul_1
©
?gradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependencyIdentity-gradients_1/main/v/dense_2/MatMul_grad/MatMul8^gradients_1/main/v/dense_2/MatMul_grad/tuple/group_deps*@
_class6
42loc:@gradients_1/main/v/dense_2/MatMul_grad/MatMul*(
_output_shapes
:?????????¬*
T0
¦
Agradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependency_1Identity/gradients_1/main/v/dense_2/MatMul_grad/MatMul_18^gradients_1/main/v/dense_2/MatMul_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients_1/main/v/dense_2/MatMul_grad/MatMul_1*
_output_shapes
:	¬
ρ
.gradients_1/main/q1/dense_2/MatMul_grad/MatMulMatMulAgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependencymain/q1/dense_2/kernel/read*(
_output_shapes
:?????????¬*
T0*
transpose_b(*
transpose_a( 
γ
0gradients_1/main/q1/dense_2/MatMul_grad/MatMul_1MatMulmain/q1/dense_1/ReluAgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
T0*
transpose_b( *
_output_shapes
:	¬
«
8gradients_1/main/q1/dense_2/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q1/dense_2/MatMul_grad/MatMul1^gradients_1/main/q1/dense_2/MatMul_grad/MatMul_1
­
@gradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q1/dense_2/MatMul_grad/MatMul9^gradients_1/main/q1/dense_2/MatMul_grad/tuple/group_deps*
T0*(
_output_shapes
:?????????¬*A
_class7
53loc:@gradients_1/main/q1/dense_2/MatMul_grad/MatMul
ͺ
Bgradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q1/dense_2/MatMul_grad/MatMul_19^gradients_1/main/q1/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*C
_class9
75loc:@gradients_1/main/q1/dense_2/MatMul_grad/MatMul_1*
T0
ρ
.gradients_1/main/q2/dense_2/MatMul_grad/MatMulMatMulAgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependencymain/q2/dense_2/kernel/read*
T0*(
_output_shapes
:?????????¬*
transpose_a( *
transpose_b(
γ
0gradients_1/main/q2/dense_2/MatMul_grad/MatMul_1MatMulmain/q2/dense_1/ReluAgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( *
_output_shapes
:	¬
«
8gradients_1/main/q2/dense_2/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q2/dense_2/MatMul_grad/MatMul1^gradients_1/main/q2/dense_2/MatMul_grad/MatMul_1
­
@gradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q2/dense_2/MatMul_grad/MatMul9^gradients_1/main/q2/dense_2/MatMul_grad/tuple/group_deps*
T0*(
_output_shapes
:?????????¬*A
_class7
53loc:@gradients_1/main/q2/dense_2/MatMul_grad/MatMul
ͺ
Bgradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q2/dense_2/MatMul_grad/MatMul_19^gradients_1/main/q2/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	¬*
T0*C
_class9
75loc:@gradients_1/main/q2/dense_2/MatMul_grad/MatMul_1
Β
-gradients_1/main/v/dense_1/Relu_grad/ReluGradReluGrad?gradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependencymain/v/dense_1/Relu*
T0*(
_output_shapes
:?????????¬
Ε
.gradients_1/main/q1/dense_1/Relu_grad/ReluGradReluGrad@gradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependencymain/q1/dense_1/Relu*
T0*(
_output_shapes
:?????????¬
Ε
.gradients_1/main/q2/dense_1/Relu_grad/ReluGradReluGrad@gradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependencymain/q2/dense_1/Relu*
T0*(
_output_shapes
:?????????¬
?
3gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad-gradients_1/main/v/dense_1/Relu_grad/ReluGrad*
data_formatNHWC*
T0*
_output_shapes	
:¬
­
8gradients_1/main/v/dense_1/BiasAdd_grad/tuple/group_depsNoOp^Adam4^gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGrad.^gradients_1/main/v/dense_1/Relu_grad/ReluGrad
«
@gradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity-gradients_1/main/v/dense_1/Relu_grad/ReluGrad9^gradients_1/main/v/dense_1/BiasAdd_grad/tuple/group_deps*(
_output_shapes
:?????????¬*
T0*@
_class6
42loc:@gradients_1/main/v/dense_1/Relu_grad/ReluGrad
¬
Bgradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity3gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGrad9^gradients_1/main/v/dense_1/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:¬*
T0*F
_class<
:8loc:@gradients_1/main/v/dense_1/BiasAdd_grad/BiasAddGrad
°
4gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad.gradients_1/main/q1/dense_1/Relu_grad/ReluGrad*
_output_shapes	
:¬*
T0*
data_formatNHWC
°
9gradients_1/main/q1/dense_1/BiasAdd_grad/tuple/group_depsNoOp^Adam5^gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGrad/^gradients_1/main/q1/dense_1/Relu_grad/ReluGrad
―
Agradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity.gradients_1/main/q1/dense_1/Relu_grad/ReluGrad:^gradients_1/main/q1/dense_1/BiasAdd_grad/tuple/group_deps*A
_class7
53loc:@gradients_1/main/q1/dense_1/Relu_grad/ReluGrad*(
_output_shapes
:?????????¬*
T0
°
Cgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q1/dense_1/BiasAdd_grad/tuple/group_deps*G
_class=
;9loc:@gradients_1/main/q1/dense_1/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:¬*
T0
°
4gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad.gradients_1/main/q2/dense_1/Relu_grad/ReluGrad*
T0*
data_formatNHWC*
_output_shapes	
:¬
°
9gradients_1/main/q2/dense_1/BiasAdd_grad/tuple/group_depsNoOp^Adam5^gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGrad/^gradients_1/main/q2/dense_1/Relu_grad/ReluGrad
―
Agradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity.gradients_1/main/q2/dense_1/Relu_grad/ReluGrad:^gradients_1/main/q2/dense_1/BiasAdd_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/main/q2/dense_1/Relu_grad/ReluGrad*(
_output_shapes
:?????????¬
°
Cgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGrad:^gradients_1/main/q2/dense_1/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main/q2/dense_1/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:¬
ξ
-gradients_1/main/v/dense_1/MatMul_grad/MatMulMatMul@gradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependencymain/v/dense_1/kernel/read*
T0*
transpose_b(*
transpose_a( *(
_output_shapes
:?????????
ί
/gradients_1/main/v/dense_1/MatMul_grad/MatMul_1MatMulmain/v/dense/Relu@gradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
T0* 
_output_shapes
:
¬
¨
7gradients_1/main/v/dense_1/MatMul_grad/tuple/group_depsNoOp^Adam.^gradients_1/main/v/dense_1/MatMul_grad/MatMul0^gradients_1/main/v/dense_1/MatMul_grad/MatMul_1
©
?gradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependencyIdentity-gradients_1/main/v/dense_1/MatMul_grad/MatMul8^gradients_1/main/v/dense_1/MatMul_grad/tuple/group_deps*(
_output_shapes
:?????????*
T0*@
_class6
42loc:@gradients_1/main/v/dense_1/MatMul_grad/MatMul
§
Agradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependency_1Identity/gradients_1/main/v/dense_1/MatMul_grad/MatMul_18^gradients_1/main/v/dense_1/MatMul_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients_1/main/v/dense_1/MatMul_grad/MatMul_1* 
_output_shapes
:
¬
ρ
.gradients_1/main/q1/dense_1/MatMul_grad/MatMulMatMulAgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependencymain/q1/dense_1/kernel/read*
transpose_b(*
transpose_a( *(
_output_shapes
:?????????*
T0
β
0gradients_1/main/q1/dense_1/MatMul_grad/MatMul_1MatMulmain/q1/dense/ReluAgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0* 
_output_shapes
:
¬*
transpose_a(
«
8gradients_1/main/q1/dense_1/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q1/dense_1/MatMul_grad/MatMul1^gradients_1/main/q1/dense_1/MatMul_grad/MatMul_1
­
@gradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q1/dense_1/MatMul_grad/MatMul9^gradients_1/main/q1/dense_1/MatMul_grad/tuple/group_deps*(
_output_shapes
:?????????*A
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
ρ
.gradients_1/main/q2/dense_1/MatMul_grad/MatMulMatMulAgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependencymain/q2/dense_1/kernel/read*(
_output_shapes
:?????????*
transpose_b(*
transpose_a( *
T0
β
0gradients_1/main/q2/dense_1/MatMul_grad/MatMul_1MatMulmain/q2/dense/ReluAgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( * 
_output_shapes
:
¬*
transpose_a(*
T0
«
8gradients_1/main/q2/dense_1/MatMul_grad/tuple/group_depsNoOp^Adam/^gradients_1/main/q2/dense_1/MatMul_grad/MatMul1^gradients_1/main/q2/dense_1/MatMul_grad/MatMul_1
­
@gradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/main/q2/dense_1/MatMul_grad/MatMul9^gradients_1/main/q2/dense_1/MatMul_grad/tuple/group_deps*(
_output_shapes
:?????????*
T0*A
_class7
53loc:@gradients_1/main/q2/dense_1/MatMul_grad/MatMul
«
Bgradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/main/q2/dense_1/MatMul_grad/MatMul_19^gradients_1/main/q2/dense_1/MatMul_grad/tuple/group_deps*C
_class9
75loc:@gradients_1/main/q2/dense_1/MatMul_grad/MatMul_1* 
_output_shapes
:
¬*
T0
Ύ
+gradients_1/main/v/dense/Relu_grad/ReluGradReluGrad?gradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependencymain/v/dense/Relu*
T0*(
_output_shapes
:?????????
Α
,gradients_1/main/q1/dense/Relu_grad/ReluGradReluGrad@gradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependencymain/q1/dense/Relu*(
_output_shapes
:?????????*
T0
Α
,gradients_1/main/q2/dense/Relu_grad/ReluGradReluGrad@gradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependencymain/q2/dense/Relu*(
_output_shapes
:?????????*
T0
ͺ
1gradients_1/main/v/dense/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients_1/main/v/dense/Relu_grad/ReluGrad*
T0*
_output_shapes	
:*
data_formatNHWC
§
6gradients_1/main/v/dense/BiasAdd_grad/tuple/group_depsNoOp^Adam2^gradients_1/main/v/dense/BiasAdd_grad/BiasAddGrad,^gradients_1/main/v/dense/Relu_grad/ReluGrad
£
>gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependencyIdentity+gradients_1/main/v/dense/Relu_grad/ReluGrad7^gradients_1/main/v/dense/BiasAdd_grad/tuple/group_deps*>
_class4
20loc:@gradients_1/main/v/dense/Relu_grad/ReluGrad*(
_output_shapes
:?????????*
T0
€
@gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependency_1Identity1gradients_1/main/v/dense/BiasAdd_grad/BiasAddGrad7^gradients_1/main/v/dense/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes	
:*D
_class:
86loc:@gradients_1/main/v/dense/BiasAdd_grad/BiasAddGrad
¬
2gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients_1/main/q1/dense/Relu_grad/ReluGrad*
T0*
_output_shapes	
:*
data_formatNHWC
ͺ
7gradients_1/main/q1/dense/BiasAdd_grad/tuple/group_depsNoOp^Adam3^gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGrad-^gradients_1/main/q1/dense/Relu_grad/ReluGrad
§
?gradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependencyIdentity,gradients_1/main/q1/dense/Relu_grad/ReluGrad8^gradients_1/main/q1/dense/BiasAdd_grad/tuple/group_deps*?
_class5
31loc:@gradients_1/main/q1/dense/Relu_grad/ReluGrad*
T0*(
_output_shapes
:?????????
¨
Agradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependency_1Identity2gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGrad8^gradients_1/main/q1/dense/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:*
T0*E
_class;
97loc:@gradients_1/main/q1/dense/BiasAdd_grad/BiasAddGrad
¬
2gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGradBiasAddGrad,gradients_1/main/q2/dense/Relu_grad/ReluGrad*
_output_shapes	
:*
data_formatNHWC*
T0
ͺ
7gradients_1/main/q2/dense/BiasAdd_grad/tuple/group_depsNoOp^Adam3^gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGrad-^gradients_1/main/q2/dense/Relu_grad/ReluGrad
§
?gradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependencyIdentity,gradients_1/main/q2/dense/Relu_grad/ReluGrad8^gradients_1/main/q2/dense/BiasAdd_grad/tuple/group_deps*(
_output_shapes
:?????????*
T0*?
_class5
31loc:@gradients_1/main/q2/dense/Relu_grad/ReluGrad
¨
Agradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependency_1Identity2gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGrad8^gradients_1/main/q2/dense/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes	
:*E
_class;
97loc:@gradients_1/main/q2/dense/BiasAdd_grad/BiasAddGrad
η
+gradients_1/main/v/dense/MatMul_grad/MatMulMatMul>gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependencymain/v/dense/kernel/read*'
_output_shapes
:?????????6*
transpose_b(*
transpose_a( *
T0
Φ
-gradients_1/main/v/dense/MatMul_grad/MatMul_1MatMulPlaceholder_1>gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
_output_shapes
:	6*
T0
’
5gradients_1/main/v/dense/MatMul_grad/tuple/group_depsNoOp^Adam,^gradients_1/main/v/dense/MatMul_grad/MatMul.^gradients_1/main/v/dense/MatMul_grad/MatMul_1
 
=gradients_1/main/v/dense/MatMul_grad/tuple/control_dependencyIdentity+gradients_1/main/v/dense/MatMul_grad/MatMul6^gradients_1/main/v/dense/MatMul_grad/tuple/group_deps*>
_class4
20loc:@gradients_1/main/v/dense/MatMul_grad/MatMul*
T0*'
_output_shapes
:?????????6

?gradients_1/main/v/dense/MatMul_grad/tuple/control_dependency_1Identity-gradients_1/main/v/dense/MatMul_grad/MatMul_16^gradients_1/main/v/dense/MatMul_grad/tuple/group_deps*@
_class6
42loc:@gradients_1/main/v/dense/MatMul_grad/MatMul_1*
_output_shapes
:	6*
T0
κ
,gradients_1/main/q1/dense/MatMul_grad/MatMulMatMul?gradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependencymain/q1/dense/kernel/read*'
_output_shapes
:?????????B*
transpose_a( *
transpose_b(*
T0
Ω
.gradients_1/main/q1/dense/MatMul_grad/MatMul_1MatMulmain/q1/concat?gradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes
:	B*
transpose_a(*
transpose_b( 
₯
6gradients_1/main/q1/dense/MatMul_grad/tuple/group_depsNoOp^Adam-^gradients_1/main/q1/dense/MatMul_grad/MatMul/^gradients_1/main/q1/dense/MatMul_grad/MatMul_1
€
>gradients_1/main/q1/dense/MatMul_grad/tuple/control_dependencyIdentity,gradients_1/main/q1/dense/MatMul_grad/MatMul7^gradients_1/main/q1/dense/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:?????????B*?
_class5
31loc:@gradients_1/main/q1/dense/MatMul_grad/MatMul
’
@gradients_1/main/q1/dense/MatMul_grad/tuple/control_dependency_1Identity.gradients_1/main/q1/dense/MatMul_grad/MatMul_17^gradients_1/main/q1/dense/MatMul_grad/tuple/group_deps*
_output_shapes
:	B*A
_class7
53loc:@gradients_1/main/q1/dense/MatMul_grad/MatMul_1*
T0
κ
,gradients_1/main/q2/dense/MatMul_grad/MatMulMatMul?gradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependencymain/q2/dense/kernel/read*
T0*
transpose_b(*'
_output_shapes
:?????????B*
transpose_a( 
Ω
.gradients_1/main/q2/dense/MatMul_grad/MatMul_1MatMulmain/q2/concat?gradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	B*
transpose_a(*
T0*
transpose_b( 
₯
6gradients_1/main/q2/dense/MatMul_grad/tuple/group_depsNoOp^Adam-^gradients_1/main/q2/dense/MatMul_grad/MatMul/^gradients_1/main/q2/dense/MatMul_grad/MatMul_1
€
>gradients_1/main/q2/dense/MatMul_grad/tuple/control_dependencyIdentity,gradients_1/main/q2/dense/MatMul_grad/MatMul7^gradients_1/main/q2/dense/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients_1/main/q2/dense/MatMul_grad/MatMul*
T0*'
_output_shapes
:?????????B
’
@gradients_1/main/q2/dense/MatMul_grad/tuple/control_dependency_1Identity.gradients_1/main/q2/dense/MatMul_grad/MatMul_17^gradients_1/main/q2/dense/MatMul_grad/tuple/group_deps*
T0*
_output_shapes
:	B*A
_class7
53loc:@gradients_1/main/q2/dense/MatMul_grad/MatMul_1

beta1_power_1/initial_valueConst*
valueB
 *fff?*
dtype0*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias

beta1_power_1
VariableV2*%
_class
loc:@main/q1/dense/bias*
shared_name *
shape: *
_output_shapes
: *
	container *
dtype0
»
beta1_power_1/AssignAssignbeta1_power_1beta1_power_1/initial_value*
T0*
use_locking(*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
validate_shape(
u
beta1_power_1/readIdentitybeta1_power_1*
T0*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias

beta2_power_1/initial_valueConst*
valueB
 *wΎ?*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
dtype0

beta2_power_1
VariableV2*
shared_name *
shape: *
dtype0*
	container *
_output_shapes
: *%
_class
loc:@main/q1/dense/bias
»
beta2_power_1/AssignAssignbeta2_power_1beta2_power_1/initial_value*
_output_shapes
: *
validate_shape(*%
_class
loc:@main/q1/dense/bias*
T0*
use_locking(
u
beta2_power_1/readIdentitybeta2_power_1*
T0*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias
΅
;main/q1/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"B     *'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:

1main/q1/dense/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: *'
_class
loc:@main/q1/dense/kernel

+main/q1/dense/kernel/Adam/Initializer/zerosFill;main/q1/dense/kernel/Adam/Initializer/zeros/shape_as_tensor1main/q1/dense/kernel/Adam/Initializer/zeros/Const*
_output_shapes
:	B*
T0*'
_class
loc:@main/q1/dense/kernel*

index_type0
Έ
main/q1/dense/kernel/Adam
VariableV2*
_output_shapes
:	B*
	container *'
_class
loc:@main/q1/dense/kernel*
shape:	B*
dtype0*
shared_name 
ξ
 main/q1/dense/kernel/Adam/AssignAssignmain/q1/dense/kernel/Adam+main/q1/dense/kernel/Adam/Initializer/zeros*
T0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
validate_shape(*
use_locking(

main/q1/dense/kernel/Adam/readIdentitymain/q1/dense/kernel/Adam*
T0*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B
·
=main/q1/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"B     *'
_class
loc:@main/q1/dense/kernel*
dtype0*
_output_shapes
:
‘
3main/q1/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *'
_class
loc:@main/q1/dense/kernel*
_output_shapes
: 

-main/q1/dense/kernel/Adam_1/Initializer/zerosFill=main/q1/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor3main/q1/dense/kernel/Adam_1/Initializer/zeros/Const*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*
T0*

index_type0
Ί
main/q1/dense/kernel/Adam_1
VariableV2*
shape:	B*
	container *
_output_shapes
:	B*
dtype0*'
_class
loc:@main/q1/dense/kernel*
shared_name 
τ
"main/q1/dense/kernel/Adam_1/AssignAssignmain/q1/dense/kernel/Adam_1-main/q1/dense/kernel/Adam_1/Initializer/zeros*
_output_shapes
:	B*
T0*'
_class
loc:@main/q1/dense/kernel*
validate_shape(*
use_locking(

 main/q1/dense/kernel/Adam_1/readIdentitymain/q1/dense/kernel/Adam_1*
T0*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel

)main/q1/dense/bias/Adam/Initializer/zerosConst*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
valueB*    *
dtype0
¬
main/q1/dense/bias/Adam
VariableV2*
	container *%
_class
loc:@main/q1/dense/bias*
dtype0*
shared_name *
_output_shapes	
:*
shape:
β
main/q1/dense/bias/Adam/AssignAssignmain/q1/dense/bias/Adam)main/q1/dense/bias/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias

main/q1/dense/bias/Adam/readIdentitymain/q1/dense/bias/Adam*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:
‘
+main/q1/dense/bias/Adam_1/Initializer/zerosConst*
dtype0*
valueB*    *
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias
?
main/q1/dense/bias/Adam_1
VariableV2*
	container *
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias*
shape:*
shared_name *
dtype0
θ
 main/q1/dense/bias/Adam_1/AssignAssignmain/q1/dense/bias/Adam_1+main/q1/dense/bias/Adam_1/Initializer/zeros*%
_class
loc:@main/q1/dense/bias*
validate_shape(*
T0*
_output_shapes	
:*
use_locking(

main/q1/dense/bias/Adam_1/readIdentitymain/q1/dense/bias/Adam_1*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:
Ή
=main/q1/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"  ,  *
_output_shapes
:*
dtype0*)
_class
loc:@main/q1/dense_1/kernel
£
3main/q1/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *)
_class
loc:@main/q1/dense_1/kernel*
valueB
 *    

-main/q1/dense_1/kernel/Adam/Initializer/zerosFill=main/q1/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor3main/q1/dense_1/kernel/Adam/Initializer/zeros/Const*)
_class
loc:@main/q1/dense_1/kernel*
T0*

index_type0* 
_output_shapes
:
¬
Ύ
main/q1/dense_1/kernel/Adam
VariableV2*
shared_name * 
_output_shapes
:
¬*
dtype0*
	container *
shape:
¬*)
_class
loc:@main/q1/dense_1/kernel
χ
"main/q1/dense_1/kernel/Adam/AssignAssignmain/q1/dense_1/kernel/Adam-main/q1/dense_1/kernel/Adam/Initializer/zeros* 
_output_shapes
:
¬*
use_locking(*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel*
T0

 main/q1/dense_1/kernel/Adam/readIdentitymain/q1/dense_1/kernel/Adam*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬*
T0
»
?main/q1/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
valueB"  ,  *)
_class
loc:@main/q1/dense_1/kernel*
dtype0
₯
5main/q1/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *)
_class
loc:@main/q1/dense_1/kernel*
_output_shapes
: *
dtype0

/main/q1/dense_1/kernel/Adam_1/Initializer/zerosFill?main/q1/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/q1/dense_1/kernel/Adam_1/Initializer/zeros/Const* 
_output_shapes
:
¬*

index_type0*
T0*)
_class
loc:@main/q1/dense_1/kernel
ΐ
main/q1/dense_1/kernel/Adam_1
VariableV2*
shape:
¬*
shared_name *
dtype0*)
_class
loc:@main/q1/dense_1/kernel*
	container * 
_output_shapes
:
¬
ύ
$main/q1/dense_1/kernel/Adam_1/AssignAssignmain/q1/dense_1/kernel/Adam_1/main/q1/dense_1/kernel/Adam_1/Initializer/zeros*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬*
use_locking(*
T0*
validate_shape(
£
"main/q1/dense_1/kernel/Adam_1/readIdentitymain/q1/dense_1/kernel/Adam_1*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel
£
+main/q1/dense_1/bias/Adam/Initializer/zerosConst*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
valueB¬*    *
dtype0
°
main/q1/dense_1/bias/Adam
VariableV2*
shape:¬*
dtype0*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
	container *
shared_name 
κ
 main/q1/dense_1/bias/Adam/AssignAssignmain/q1/dense_1/bias/Adam+main/q1/dense_1/bias/Adam/Initializer/zeros*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
validate_shape(*
T0

main/q1/dense_1/bias/Adam/readIdentitymain/q1/dense_1/bias/Adam*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
T0
₯
-main/q1/dense_1/bias/Adam_1/Initializer/zerosConst*'
_class
loc:@main/q1/dense_1/bias*
valueB¬*    *
_output_shapes	
:¬*
dtype0
²
main/q1/dense_1/bias/Adam_1
VariableV2*
shape:¬*
	container *
shared_name *
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
dtype0
π
"main/q1/dense_1/bias/Adam_1/AssignAssignmain/q1/dense_1/bias/Adam_1-main/q1/dense_1/bias/Adam_1/Initializer/zeros*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬*
T0*
validate_shape(*
use_locking(

 main/q1/dense_1/bias/Adam_1/readIdentitymain/q1/dense_1/bias/Adam_1*
_output_shapes	
:¬*
T0*'
_class
loc:@main/q1/dense_1/bias
―
-main/q1/dense_2/kernel/Adam/Initializer/zerosConst*
valueB	¬*    *
_output_shapes
:	¬*
dtype0*)
_class
loc:@main/q1/dense_2/kernel
Ό
main/q1/dense_2/kernel/Adam
VariableV2*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:	¬*
shared_name *
dtype0*
	container *
shape:	¬
φ
"main/q1/dense_2/kernel/Adam/AssignAssignmain/q1/dense_2/kernel/Adam-main/q1/dense_2/kernel/Adam/Initializer/zeros*
T0*)
_class
loc:@main/q1/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
validate_shape(

 main/q1/dense_2/kernel/Adam/readIdentitymain/q1/dense_2/kernel/Adam*
T0*
_output_shapes
:	¬*)
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
Ύ
main/q1/dense_2/kernel/Adam_1
VariableV2*)
_class
loc:@main/q1/dense_2/kernel*
dtype0*
shape:	¬*
	container *
shared_name *
_output_shapes
:	¬
ό
$main/q1/dense_2/kernel/Adam_1/AssignAssignmain/q1/dense_2/kernel/Adam_1/main/q1/dense_2/kernel/Adam_1/Initializer/zeros*)
_class
loc:@main/q1/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
validate_shape(*
T0
’
"main/q1/dense_2/kernel/Adam_1/readIdentitymain/q1/dense_2/kernel/Adam_1*
T0*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:	¬
‘
+main/q1/dense_2/bias/Adam/Initializer/zerosConst*
valueB*    *
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
dtype0
?
main/q1/dense_2/bias/Adam
VariableV2*
shape:*
	container *'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:*
shared_name *
dtype0
ι
 main/q1/dense_2/bias/Adam/AssignAssignmain/q1/dense_2/bias/Adam+main/q1/dense_2/bias/Adam/Initializer/zeros*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:*
use_locking(*
validate_shape(*
T0

main/q1/dense_2/bias/Adam/readIdentitymain/q1/dense_2/bias/Adam*
T0*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:
£
-main/q1/dense_2/bias/Adam_1/Initializer/zerosConst*
dtype0*
valueB*    *
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias
°
main/q1/dense_2/bias/Adam_1
VariableV2*'
_class
loc:@main/q1/dense_2/bias*
shape:*
	container *
shared_name *
dtype0*
_output_shapes
:
ο
"main/q1/dense_2/bias/Adam_1/AssignAssignmain/q1/dense_2/bias/Adam_1-main/q1/dense_2/bias/Adam_1/Initializer/zeros*
validate_shape(*'
_class
loc:@main/q1/dense_2/bias*
T0*
_output_shapes
:*
use_locking(

 main/q1/dense_2/bias/Adam_1/readIdentitymain/q1/dense_2/bias/Adam_1*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
T0
΅
;main/q2/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB"B     *'
_class
loc:@main/q2/dense/kernel

1main/q2/dense/kernel/Adam/Initializer/zeros/ConstConst*'
_class
loc:@main/q2/dense/kernel*
valueB
 *    *
dtype0*
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
Έ
main/q2/dense/kernel/Adam
VariableV2*
	container *
dtype0*
shape:	B*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B*
shared_name 
ξ
 main/q2/dense/kernel/Adam/AssignAssignmain/q2/dense/kernel/Adam+main/q2/dense/kernel/Adam/Initializer/zeros*
use_locking(*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B*
validate_shape(*
T0

main/q2/dense/kernel/Adam/readIdentitymain/q2/dense/kernel/Adam*
T0*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B
·
=main/q2/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"B     *'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:*
dtype0
‘
3main/q2/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*'
_class
loc:@main/q2/dense/kernel*
valueB
 *    *
_output_shapes
: 

-main/q2/dense/kernel/Adam_1/Initializer/zerosFill=main/q2/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor3main/q2/dense/kernel/Adam_1/Initializer/zeros/Const*'
_class
loc:@main/q2/dense/kernel*
_output_shapes
:	B*
T0*

index_type0
Ί
main/q2/dense/kernel/Adam_1
VariableV2*
_output_shapes
:	B*
shared_name *
shape:	B*'
_class
loc:@main/q2/dense/kernel*
	container *
dtype0
τ
"main/q2/dense/kernel/Adam_1/AssignAssignmain/q2/dense/kernel/Adam_1-main/q2/dense/kernel/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes
:	B*
use_locking(*
T0*'
_class
loc:@main/q2/dense/kernel

 main/q2/dense/kernel/Adam_1/readIdentitymain/q2/dense/kernel/Adam_1*
T0*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel

)main/q2/dense/bias/Adam/Initializer/zerosConst*
_output_shapes	
:*
dtype0*%
_class
loc:@main/q2/dense/bias*
valueB*    
¬
main/q2/dense/bias/Adam
VariableV2*
shape:*
dtype0*
_output_shapes	
:*
	container *%
_class
loc:@main/q2/dense/bias*
shared_name 
β
main/q2/dense/bias/Adam/AssignAssignmain/q2/dense/bias/Adam)main/q2/dense/bias/Adam/Initializer/zeros*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
T0*
validate_shape(*
use_locking(

main/q2/dense/bias/Adam/readIdentitymain/q2/dense/bias/Adam*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias*
T0
‘
+main/q2/dense/bias/Adam_1/Initializer/zerosConst*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
?
main/q2/dense/bias/Adam_1
VariableV2*
shared_name *
	container *
shape:*
dtype0*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:
θ
 main/q2/dense/bias/Adam_1/AssignAssignmain/q2/dense/bias/Adam_1+main/q2/dense/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias

main/q2/dense/bias/Adam_1/readIdentitymain/q2/dense/bias/Adam_1*%
_class
loc:@main/q2/dense/bias*
_output_shapes	
:*
T0
Ή
=main/q2/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"  ,  *
dtype0*
_output_shapes
:*)
_class
loc:@main/q2/dense_1/kernel
£
3main/q2/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
_output_shapes
: *)
_class
loc:@main/q2/dense_1/kernel*
valueB
 *    *
dtype0

-main/q2/dense_1/kernel/Adam/Initializer/zerosFill=main/q2/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor3main/q2/dense_1/kernel/Adam/Initializer/zeros/Const*

index_type0*
T0*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬
Ύ
main/q2/dense_1/kernel/Adam
VariableV2*
dtype0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
	container *
shared_name *
shape:
¬
χ
"main/q2/dense_1/kernel/Adam/AssignAssignmain/q2/dense_1/kernel/Adam-main/q2/dense_1/kernel/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel

 main/q2/dense_1/kernel/Adam/readIdentitymain/q2/dense_1/kernel/Adam*)
_class
loc:@main/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬
»
?main/q2/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*)
_class
loc:@main/q2/dense_1/kernel*
dtype0*
_output_shapes
:*
valueB"  ,  
₯
5main/q2/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*)
_class
loc:@main/q2/dense_1/kernel*
valueB
 *    *
_output_shapes
: *
dtype0

/main/q2/dense_1/kernel/Adam_1/Initializer/zerosFill?main/q2/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor5main/q2/dense_1/kernel/Adam_1/Initializer/zeros/Const* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
T0*

index_type0
ΐ
main/q2/dense_1/kernel/Adam_1
VariableV2*
shape:
¬*
	container *)
_class
loc:@main/q2/dense_1/kernel*
dtype0* 
_output_shapes
:
¬*
shared_name 
ύ
$main/q2/dense_1/kernel/Adam_1/AssignAssignmain/q2/dense_1/kernel/Adam_1/main/q2/dense_1/kernel/Adam_1/Initializer/zeros*
validate_shape(* 
_output_shapes
:
¬*
T0*)
_class
loc:@main/q2/dense_1/kernel*
use_locking(
£
"main/q2/dense_1/kernel/Adam_1/readIdentitymain/q2/dense_1/kernel/Adam_1*
T0* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel
£
+main/q2/dense_1/bias/Adam/Initializer/zerosConst*
dtype0*
valueB¬*    *'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
°
main/q2/dense_1/bias/Adam
VariableV2*'
_class
loc:@main/q2/dense_1/bias*
dtype0*
shape:¬*
_output_shapes	
:¬*
shared_name *
	container 
κ
 main/q2/dense_1/bias/Adam/AssignAssignmain/q2/dense_1/bias/Adam+main/q2/dense_1/bias/Adam/Initializer/zeros*
_output_shapes	
:¬*
T0*'
_class
loc:@main/q2/dense_1/bias*
validate_shape(*
use_locking(

main/q2/dense_1/bias/Adam/readIdentitymain/q2/dense_1/bias/Adam*
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias*
T0
₯
-main/q2/dense_1/bias/Adam_1/Initializer/zerosConst*'
_class
loc:@main/q2/dense_1/bias*
valueB¬*    *
dtype0*
_output_shapes	
:¬
²
main/q2/dense_1/bias/Adam_1
VariableV2*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
shape:¬*
dtype0*
shared_name *
	container 
π
"main/q2/dense_1/bias/Adam_1/AssignAssignmain/q2/dense_1/bias/Adam_1-main/q2/dense_1/bias/Adam_1/Initializer/zeros*
T0*'
_class
loc:@main/q2/dense_1/bias*
use_locking(*
validate_shape(*
_output_shapes	
:¬

 main/q2/dense_1/bias/Adam_1/readIdentitymain/q2/dense_1/bias/Adam_1*
T0*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
―
-main/q2/dense_2/kernel/Adam/Initializer/zerosConst*
valueB	¬*    *
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
dtype0
Ό
main/q2/dense_2/kernel/Adam
VariableV2*)
_class
loc:@main/q2/dense_2/kernel*
shared_name *
	container *
_output_shapes
:	¬*
dtype0*
shape:	¬
φ
"main/q2/dense_2/kernel/Adam/AssignAssignmain/q2/dense_2/kernel/Adam-main/q2/dense_2/kernel/Adam/Initializer/zeros*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(*
use_locking(

 main/q2/dense_2/kernel/Adam/readIdentitymain/q2/dense_2/kernel/Adam*
_output_shapes
:	¬*
T0*)
_class
loc:@main/q2/dense_2/kernel
±
/main/q2/dense_2/kernel/Adam_1/Initializer/zerosConst*
valueB	¬*    *
dtype0*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬
Ύ
main/q2/dense_2/kernel/Adam_1
VariableV2*
	container *
dtype0*
shared_name *
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
shape:	¬
ό
$main/q2/dense_2/kernel/Adam_1/AssignAssignmain/q2/dense_2/kernel/Adam_1/main/q2/dense_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel*
T0*
_output_shapes
:	¬
’
"main/q2/dense_2/kernel/Adam_1/readIdentitymain/q2/dense_2/kernel/Adam_1*
T0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel
‘
+main/q2/dense_2/bias/Adam/Initializer/zerosConst*
valueB*    *
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias*
dtype0
?
main/q2/dense_2/bias/Adam
VariableV2*
_output_shapes
:*
shared_name *
shape:*
dtype0*
	container *'
_class
loc:@main/q2/dense_2/bias
ι
 main/q2/dense_2/bias/Adam/AssignAssignmain/q2/dense_2/bias/Adam+main/q2/dense_2/bias/Adam/Initializer/zeros*
validate_shape(*
T0*
use_locking(*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:

main/q2/dense_2/bias/Adam/readIdentitymain/q2/dense_2/bias/Adam*
T0*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:
£
-main/q2/dense_2/bias/Adam_1/Initializer/zerosConst*
valueB*    *'
_class
loc:@main/q2/dense_2/bias*
dtype0*
_output_shapes
:
°
main/q2/dense_2/bias/Adam_1
VariableV2*
shared_name *
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias*
	container *
dtype0*
shape:
ο
"main/q2/dense_2/bias/Adam_1/AssignAssignmain/q2/dense_2/bias/Adam_1-main/q2/dense_2/bias/Adam_1/Initializer/zeros*
_output_shapes
:*
use_locking(*'
_class
loc:@main/q2/dense_2/bias*
T0*
validate_shape(
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
loc:@main/v/dense/kernel*
valueB"6     *
_output_shapes
:*
dtype0

0main/v/dense/kernel/Adam/Initializer/zeros/ConstConst*&
_class
loc:@main/v/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *    

*main/v/dense/kernel/Adam/Initializer/zerosFill:main/v/dense/kernel/Adam/Initializer/zeros/shape_as_tensor0main/v/dense/kernel/Adam/Initializer/zeros/Const*
T0*&
_class
loc:@main/v/dense/kernel*

index_type0*
_output_shapes
:	6
Ά
main/v/dense/kernel/Adam
VariableV2*
shared_name *
	container *
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
dtype0*
shape:	6
κ
main/v/dense/kernel/Adam/AssignAssignmain/v/dense/kernel/Adam*main/v/dense/kernel/Adam/Initializer/zeros*
use_locking(*
validate_shape(*
_output_shapes
:	6*
T0*&
_class
loc:@main/v/dense/kernel

main/v/dense/kernel/Adam/readIdentitymain/v/dense/kernel/Adam*
_output_shapes
:	6*
T0*&
_class
loc:@main/v/dense/kernel
΅
<main/v/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@main/v/dense/kernel*
valueB"6     *
_output_shapes
:*
dtype0

2main/v/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0*&
_class
loc:@main/v/dense/kernel

,main/v/dense/kernel/Adam_1/Initializer/zerosFill<main/v/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor2main/v/dense/kernel/Adam_1/Initializer/zeros/Const*&
_class
loc:@main/v/dense/kernel*
T0*

index_type0*
_output_shapes
:	6
Έ
main/v/dense/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
	container *
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
shape:	6
π
!main/v/dense/kernel/Adam_1/AssignAssignmain/v/dense/kernel/Adam_1,main/v/dense/kernel/Adam_1/Initializer/zeros*
use_locking(*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
T0

main/v/dense/kernel/Adam_1/readIdentitymain/v/dense/kernel/Adam_1*&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6*
T0

(main/v/dense/bias/Adam/Initializer/zerosConst*
_output_shapes	
:*
valueB*    *$
_class
loc:@main/v/dense/bias*
dtype0
ͺ
main/v/dense/bias/Adam
VariableV2*$
_class
loc:@main/v/dense/bias*
	container *
_output_shapes	
:*
shape:*
shared_name *
dtype0
ή
main/v/dense/bias/Adam/AssignAssignmain/v/dense/bias/Adam(main/v/dense/bias/Adam/Initializer/zeros*$
_class
loc:@main/v/dense/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:

main/v/dense/bias/Adam/readIdentitymain/v/dense/bias/Adam*
T0*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:
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
VariableV2*
shape:*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
	container *
dtype0*
shared_name 
δ
main/v/dense/bias/Adam_1/AssignAssignmain/v/dense/bias/Adam_1*main/v/dense/bias/Adam_1/Initializer/zeros*$
_class
loc:@main/v/dense/bias*
T0*
_output_shapes	
:*
validate_shape(*
use_locking(

main/v/dense/bias/Adam_1/readIdentitymain/v/dense/bias/Adam_1*
T0*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias
·
<main/v/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*(
_class
loc:@main/v/dense_1/kernel*
dtype0*
valueB"  ,  
‘
2main/v/dense_1/kernel/Adam/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *(
_class
loc:@main/v/dense_1/kernel*
_output_shapes
: 

,main/v/dense_1/kernel/Adam/Initializer/zerosFill<main/v/dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor2main/v/dense_1/kernel/Adam/Initializer/zeros/Const*(
_class
loc:@main/v/dense_1/kernel*

index_type0* 
_output_shapes
:
¬*
T0
Ό
main/v/dense_1/kernel/Adam
VariableV2*
dtype0*
	container *
shape:
¬*(
_class
loc:@main/v/dense_1/kernel*
shared_name * 
_output_shapes
:
¬
σ
!main/v/dense_1/kernel/Adam/AssignAssignmain/v/dense_1/kernel/Adam,main/v/dense_1/kernel/Adam/Initializer/zeros*(
_class
loc:@main/v/dense_1/kernel*
T0* 
_output_shapes
:
¬*
use_locking(*
validate_shape(

main/v/dense_1/kernel/Adam/readIdentitymain/v/dense_1/kernel/Adam*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
Ή
>main/v/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*(
_class
loc:@main/v/dense_1/kernel*
valueB"  ,  
£
4main/v/dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0*(
_class
loc:@main/v/dense_1/kernel

.main/v/dense_1/kernel/Adam_1/Initializer/zerosFill>main/v/dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor4main/v/dense_1/kernel/Adam_1/Initializer/zeros/Const*
T0* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*

index_type0
Ύ
main/v/dense_1/kernel/Adam_1
VariableV2*
dtype0*
	container *
shared_name *(
_class
loc:@main/v/dense_1/kernel*
shape:
¬* 
_output_shapes
:
¬
ω
#main/v/dense_1/kernel/Adam_1/AssignAssignmain/v/dense_1/kernel/Adam_1.main/v/dense_1/kernel/Adam_1/Initializer/zeros*
use_locking(* 
_output_shapes
:
¬*
T0*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(
 
!main/v/dense_1/kernel/Adam_1/readIdentitymain/v/dense_1/kernel/Adam_1*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0
‘
*main/v/dense_1/bias/Adam/Initializer/zerosConst*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias*
dtype0*
valueB¬*    
?
main/v/dense_1/bias/Adam
VariableV2*
shape:¬*
	container *
_output_shapes	
:¬*
shared_name *&
_class
loc:@main/v/dense_1/bias*
dtype0
ζ
main/v/dense_1/bias/Adam/AssignAssignmain/v/dense_1/bias/Adam*main/v/dense_1/bias/Adam/Initializer/zeros*
_output_shapes	
:¬*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
T0*
validate_shape(

main/v/dense_1/bias/Adam/readIdentitymain/v/dense_1/bias/Adam*
_output_shapes	
:¬*
T0*&
_class
loc:@main/v/dense_1/bias
£
,main/v/dense_1/bias/Adam_1/Initializer/zerosConst*&
_class
loc:@main/v/dense_1/bias*
dtype0*
valueB¬*    *
_output_shapes	
:¬
°
main/v/dense_1/bias/Adam_1
VariableV2*
dtype0*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
	container *
shared_name *
shape:¬
μ
!main/v/dense_1/bias/Adam_1/AssignAssignmain/v/dense_1/bias/Adam_1,main/v/dense_1/bias/Adam_1/Initializer/zeros*&
_class
loc:@main/v/dense_1/bias*
T0*
validate_shape(*
_output_shapes	
:¬*
use_locking(

main/v/dense_1/bias/Adam_1/readIdentitymain/v/dense_1/bias/Adam_1*
T0*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias
­
,main/v/dense_2/kernel/Adam/Initializer/zerosConst*
valueB	¬*    *
_output_shapes
:	¬*
dtype0*(
_class
loc:@main/v/dense_2/kernel
Ί
main/v/dense_2/kernel/Adam
VariableV2*
shared_name *(
_class
loc:@main/v/dense_2/kernel*
dtype0*
	container *
shape:	¬*
_output_shapes
:	¬
ς
!main/v/dense_2/kernel/Adam/AssignAssignmain/v/dense_2/kernel/Adam,main/v/dense_2/kernel/Adam/Initializer/zeros*
use_locking(*
validate_shape(*
_output_shapes
:	¬*
T0*(
_class
loc:@main/v/dense_2/kernel

main/v/dense_2/kernel/Adam/readIdentitymain/v/dense_2/kernel/Adam*
_output_shapes
:	¬*
T0*(
_class
loc:@main/v/dense_2/kernel
―
.main/v/dense_2/kernel/Adam_1/Initializer/zerosConst*
dtype0*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
valueB	¬*    
Ό
main/v/dense_2/kernel/Adam_1
VariableV2*
_output_shapes
:	¬*
	container *
dtype0*
shape:	¬*
shared_name *(
_class
loc:@main/v/dense_2/kernel
ψ
#main/v/dense_2/kernel/Adam_1/AssignAssignmain/v/dense_2/kernel/Adam_1.main/v/dense_2/kernel/Adam_1/Initializer/zeros*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
validate_shape(*
use_locking(*
T0

!main/v/dense_2/kernel/Adam_1/readIdentitymain/v/dense_2/kernel/Adam_1*(
_class
loc:@main/v/dense_2/kernel*
T0*
_output_shapes
:	¬
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
shape:*
_output_shapes
:*
dtype0*
	container *
shared_name *&
_class
loc:@main/v/dense_2/bias
ε
main/v/dense_2/bias/Adam/AssignAssignmain/v/dense_2/bias/Adam*main/v/dense_2/bias/Adam/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*&
_class
loc:@main/v/dense_2/bias*
validate_shape(

main/v/dense_2/bias/Adam/readIdentitymain/v/dense_2/bias/Adam*
T0*
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias
‘
,main/v/dense_2/bias/Adam_1/Initializer/zerosConst*
dtype0*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:*
valueB*    
?
main/v/dense_2/bias/Adam_1
VariableV2*
shared_name *
	container *
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias*
shape:*
dtype0
λ
!main/v/dense_2/bias/Adam_1/AssignAssignmain/v/dense_2/bias/Adam_1,main/v/dense_2/bias/Adam_1/Initializer/zeros*&
_class
loc:@main/v/dense_2/bias*
T0*
_output_shapes
:*
use_locking(*
validate_shape(

main/v/dense_2/bias/Adam_1/readIdentitymain/v/dense_2/bias/Adam_1*
T0*&
_class
loc:@main/v/dense_2/bias*
_output_shapes
:
`
Adam_1/learning_rateConst^Adam*
_output_shapes
: *
dtype0*
valueB
 *o:
X
Adam_1/beta1Const^Adam*
_output_shapes
: *
dtype0*
valueB
 *fff?
X
Adam_1/beta2Const^Adam*
valueB
 *wΎ?*
dtype0*
_output_shapes
: 
Z
Adam_1/epsilonConst^Adam*
dtype0*
valueB
 *wΜ+2*
_output_shapes
: 
­
,Adam_1/update_main/q1/dense/kernel/ApplyAdam	ApplyAdammain/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon@gradients_1/main/q1/dense/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
T0*
use_locking( *
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel
 
*Adam_1/update_main/q1/dense/bias/ApplyAdam	ApplyAdammain/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/q1/dense/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
_output_shapes	
:*
use_locking( *%
_class
loc:@main/q1/dense/bias*
T0
Ί
.Adam_1/update_main/q1/dense_1/kernel/ApplyAdam	ApplyAdammain/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q1/dense_1/MatMul_grad/tuple/control_dependency_1*
T0*)
_class
loc:@main/q1/dense_1/kernel*
use_locking( * 
_output_shapes
:
¬*
use_nesterov( 
¬
,Adam_1/update_main/q1/dense_1/bias/ApplyAdam	ApplyAdammain/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q1/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *'
_class
loc:@main/q1/dense_1/bias*
use_nesterov( *
T0*
_output_shapes	
:¬
Ή
.Adam_1/update_main/q1/dense_2/kernel/ApplyAdam	ApplyAdammain/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q1/dense_2/MatMul_grad/tuple/control_dependency_1*
T0*)
_class
loc:@main/q1/dense_2/kernel*
use_nesterov( *
use_locking( *
_output_shapes
:	¬
«
,Adam_1/update_main/q1/dense_2/bias/ApplyAdam	ApplyAdammain/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q1/dense_2/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
T0*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:*
use_locking( 
­
,Adam_1/update_main/q2/dense/kernel/ApplyAdam	ApplyAdammain/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon@gradients_1/main/q2/dense/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *'
_class
loc:@main/q2/dense/kernel*
T0*
_output_shapes
:	B*
use_locking( 
 
*Adam_1/update_main/q2/dense/bias/ApplyAdam	ApplyAdammain/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/q2/dense/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes	
:*
use_nesterov( *%
_class
loc:@main/q2/dense/bias
Ί
.Adam_1/update_main/q2/dense_1/kernel/ApplyAdam	ApplyAdammain/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q2/dense_1/MatMul_grad/tuple/control_dependency_1* 
_output_shapes
:
¬*
use_locking( *)
_class
loc:@main/q2/dense_1/kernel*
T0*
use_nesterov( 
¬
,Adam_1/update_main/q2/dense_1/bias/ApplyAdam	ApplyAdammain/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q2/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
use_nesterov( *'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬
Ή
.Adam_1/update_main/q2/dense_2/kernel/ApplyAdam	ApplyAdammain/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/q2/dense_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
use_nesterov( 
«
,Adam_1/update_main/q2/dense_2/bias/ApplyAdam	ApplyAdammain/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonCgradients_1/main/q2/dense_2/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias*
T0*
use_locking( *
use_nesterov( 
§
+Adam_1/update_main/v/dense/kernel/ApplyAdam	ApplyAdammain/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon?gradients_1/main/v/dense/MatMul_grad/tuple/control_dependency_1*
use_locking( *&
_class
loc:@main/v/dense/kernel*
_output_shapes
:	6*
T0*
use_nesterov( 

)Adam_1/update_main/v/dense/bias/ApplyAdam	ApplyAdammain/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon@gradients_1/main/v/dense/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes	
:*
use_nesterov( *
T0*
use_locking( *$
_class
loc:@main/v/dense/bias
΄
-Adam_1/update_main/v/dense_1/kernel/ApplyAdam	ApplyAdammain/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/v/dense_1/MatMul_grad/tuple/control_dependency_1*
T0*
use_nesterov( *(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
use_locking( 
¦
+Adam_1/update_main/v/dense_1/bias/ApplyAdam	ApplyAdammain/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/v/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
T0*
use_locking( *
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias
³
-Adam_1/update_main/v/dense_2/kernel/ApplyAdam	ApplyAdammain/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonAgradients_1/main/v/dense_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
use_nesterov( *(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
T0
₯
+Adam_1/update_main/v/dense_2/bias/ApplyAdam	ApplyAdammain/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilonBgradients_1/main/v/dense_2/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes
:*
use_nesterov( *
T0*
use_locking( *&
_class
loc:@main/v/dense_2/bias
Ι

Adam_1/mulMulbeta1_power_1/readAdam_1/beta1+^Adam_1/update_main/q1/dense/bias/ApplyAdam-^Adam_1/update_main/q1/dense/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_1/bias/ApplyAdam/^Adam_1/update_main/q1/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_2/bias/ApplyAdam/^Adam_1/update_main/q1/dense_2/kernel/ApplyAdam+^Adam_1/update_main/q2/dense/bias/ApplyAdam-^Adam_1/update_main/q2/dense/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_1/bias/ApplyAdam/^Adam_1/update_main/q2/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_2/bias/ApplyAdam/^Adam_1/update_main/q2/dense_2/kernel/ApplyAdam*^Adam_1/update_main/v/dense/bias/ApplyAdam,^Adam_1/update_main/v/dense/kernel/ApplyAdam,^Adam_1/update_main/v/dense_1/bias/ApplyAdam.^Adam_1/update_main/v/dense_1/kernel/ApplyAdam,^Adam_1/update_main/v/dense_2/bias/ApplyAdam.^Adam_1/update_main/v/dense_2/kernel/ApplyAdam*
T0*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias
£
Adam_1/AssignAssignbeta1_power_1
Adam_1/mul*
T0*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias*
use_locking( *
validate_shape(
Λ
Adam_1/mul_1Mulbeta2_power_1/readAdam_1/beta2+^Adam_1/update_main/q1/dense/bias/ApplyAdam-^Adam_1/update_main/q1/dense/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_1/bias/ApplyAdam/^Adam_1/update_main/q1/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_2/bias/ApplyAdam/^Adam_1/update_main/q1/dense_2/kernel/ApplyAdam+^Adam_1/update_main/q2/dense/bias/ApplyAdam-^Adam_1/update_main/q2/dense/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_1/bias/ApplyAdam/^Adam_1/update_main/q2/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_2/bias/ApplyAdam/^Adam_1/update_main/q2/dense_2/kernel/ApplyAdam*^Adam_1/update_main/v/dense/bias/ApplyAdam,^Adam_1/update_main/v/dense/kernel/ApplyAdam,^Adam_1/update_main/v/dense_1/bias/ApplyAdam.^Adam_1/update_main/v/dense_1/kernel/ApplyAdam,^Adam_1/update_main/v/dense_2/bias/ApplyAdam.^Adam_1/update_main/v/dense_2/kernel/ApplyAdam*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes
: 
§
Adam_1/Assign_1Assignbeta2_power_1Adam_1/mul_1*
_output_shapes
: *
T0*%
_class
loc:@main/q1/dense/bias*
use_locking( *
validate_shape(

Adam_1NoOp^Adam^Adam_1/Assign^Adam_1/Assign_1+^Adam_1/update_main/q1/dense/bias/ApplyAdam-^Adam_1/update_main/q1/dense/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_1/bias/ApplyAdam/^Adam_1/update_main/q1/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q1/dense_2/bias/ApplyAdam/^Adam_1/update_main/q1/dense_2/kernel/ApplyAdam+^Adam_1/update_main/q2/dense/bias/ApplyAdam-^Adam_1/update_main/q2/dense/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_1/bias/ApplyAdam/^Adam_1/update_main/q2/dense_1/kernel/ApplyAdam-^Adam_1/update_main/q2/dense_2/bias/ApplyAdam/^Adam_1/update_main/q2/dense_2/kernel/ApplyAdam*^Adam_1/update_main/v/dense/bias/ApplyAdam,^Adam_1/update_main/v/dense/kernel/ApplyAdam,^Adam_1/update_main/v/dense_1/bias/ApplyAdam.^Adam_1/update_main/v/dense_1/kernel/ApplyAdam,^Adam_1/update_main/v/dense_2/bias/ApplyAdam.^Adam_1/update_main/v/dense_2/kernel/ApplyAdam
U
mul_7/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
\
mul_7Mulmul_7/xtarget/pi/dense/kernel/read*
T0*
_output_shapes
:	6
U
mul_8/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
Χ£;
Z
mul_8Mulmul_8/xmain/pi/dense/kernel/read*
_output_shapes
:	6*
T0
F
add_3AddV2mul_7mul_8*
_output_shapes
:	6*
T0
­
AssignAssigntarget/pi/dense/kerneladd_3*
use_locking(*
_output_shapes
:	6*)
_class
loc:@target/pi/dense/kernel*
T0*
validate_shape(
U
mul_9/xConst^Adam_1*
_output_shapes
: *
valueB
 *RΈ~?*
dtype0
V
mul_9Mulmul_9/xtarget/pi/dense/bias/read*
T0*
_output_shapes	
:
V
mul_10/xConst^Adam_1*
valueB
 *
Χ£;*
dtype0*
_output_shapes
: 
V
mul_10Mulmul_10/xmain/pi/dense/bias/read*
T0*
_output_shapes	
:
C
add_4AddV2mul_9mul_10*
_output_shapes	
:*
T0
§
Assign_1Assigntarget/pi/dense/biasadd_4*
_output_shapes	
:*
validate_shape(*
use_locking(*
T0*'
_class
loc:@target/pi/dense/bias
V
mul_11/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
a
mul_11Mulmul_11/xtarget/pi/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
V
mul_12/xConst^Adam_1*
_output_shapes
: *
valueB
 *
Χ£;*
dtype0
_
mul_12Mulmul_12/xmain/pi/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
I
add_5AddV2mul_11mul_12* 
_output_shapes
:
¬*
T0
΄
Assign_2Assigntarget/pi/dense_1/kerneladd_5* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*
T0*+
_class!
loc:@target/pi/dense_1/kernel
V
mul_13/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
Z
mul_13Mulmul_13/xtarget/pi/dense_1/bias/read*
T0*
_output_shapes	
:¬
V
mul_14/xConst^Adam_1*
dtype0*
valueB
 *
Χ£;*
_output_shapes
: 
X
mul_14Mulmul_14/xmain/pi/dense_1/bias/read*
_output_shapes	
:¬*
T0
D
add_6AddV2mul_13mul_14*
_output_shapes	
:¬*
T0
«
Assign_3Assigntarget/pi/dense_1/biasadd_6*
use_locking(*
_output_shapes	
:¬*)
_class
loc:@target/pi/dense_1/bias*
validate_shape(*
T0
V
mul_15/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
`
mul_15Mulmul_15/xtarget/pi/dense_2/kernel/read*
T0*
_output_shapes
:	¬
V
mul_16/xConst^Adam_1*
dtype0*
valueB
 *
Χ£;*
_output_shapes
: 
^
mul_16Mulmul_16/xmain/pi/dense_2/kernel/read*
T0*
_output_shapes
:	¬
H
add_7AddV2mul_15mul_16*
_output_shapes
:	¬*
T0
³
Assign_4Assigntarget/pi/dense_2/kerneladd_7*
use_locking(*
validate_shape(*
_output_shapes
:	¬*
T0*+
_class!
loc:@target/pi/dense_2/kernel
V
mul_17/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *RΈ~?
Y
mul_17Mulmul_17/xtarget/pi/dense_2/bias/read*
_output_shapes
:*
T0
V
mul_18/xConst^Adam_1*
dtype0*
valueB
 *
Χ£;*
_output_shapes
: 
W
mul_18Mulmul_18/xmain/pi/dense_2/bias/read*
_output_shapes
:*
T0
C
add_8AddV2mul_17mul_18*
T0*
_output_shapes
:
ͺ
Assign_5Assigntarget/pi/dense_2/biasadd_8*
T0*
validate_shape(*
_output_shapes
:*
use_locking(*)
_class
loc:@target/pi/dense_2/bias
V
mul_19/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
`
mul_19Mulmul_19/xtarget/pi/dense_3/kernel/read*
T0*
_output_shapes
:	¬
V
mul_20/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
Χ£;
^
mul_20Mulmul_20/xmain/pi/dense_3/kernel/read*
T0*
_output_shapes
:	¬
H
add_9AddV2mul_19mul_20*
T0*
_output_shapes
:	¬
³
Assign_6Assigntarget/pi/dense_3/kerneladd_9*+
_class!
loc:@target/pi/dense_3/kernel*
validate_shape(*
_output_shapes
:	¬*
use_locking(*
T0
V
mul_21/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
Y
mul_21Mulmul_21/xtarget/pi/dense_3/bias/read*
T0*
_output_shapes
:
V
mul_22/xConst^Adam_1*
_output_shapes
: *
valueB
 *
Χ£;*
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
Assign_7Assigntarget/pi/dense_3/biasadd_10*
_output_shapes
:*
T0*
validate_shape(*
use_locking(*)
_class
loc:@target/pi/dense_3/bias
V
mul_23/xConst^Adam_1*
_output_shapes
: *
valueB
 *RΈ~?*
dtype0
^
mul_23Mulmul_23/xtarget/q1/dense/kernel/read*
_output_shapes
:	B*
T0
V
mul_24/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
Χ£;
\
mul_24Mulmul_24/xmain/q1/dense/kernel/read*
_output_shapes
:	B*
T0
I
add_11AddV2mul_23mul_24*
T0*
_output_shapes
:	B
°
Assign_8Assigntarget/q1/dense/kerneladd_11*
use_locking(*
validate_shape(*
_output_shapes
:	B*)
_class
loc:@target/q1/dense/kernel*
T0
V
mul_25/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
X
mul_25Mulmul_25/xtarget/q1/dense/bias/read*
T0*
_output_shapes	
:
V
mul_26/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
Χ£;
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
Assign_9Assigntarget/q1/dense/biasadd_12*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:*'
_class
loc:@target/q1/dense/bias
V
mul_27/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
a
mul_27Mulmul_27/xtarget/q1/dense_1/kernel/read*
T0* 
_output_shapes
:
¬
V
mul_28/xConst^Adam_1*
_output_shapes
: *
valueB
 *
Χ£;*
dtype0
_
mul_28Mulmul_28/xmain/q1/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
J
add_13AddV2mul_27mul_28* 
_output_shapes
:
¬*
T0
Ά
	Assign_10Assigntarget/q1/dense_1/kerneladd_13*
T0*
use_locking(*
validate_shape(*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬
V
mul_29/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
Z
mul_29Mulmul_29/xtarget/q1/dense_1/bias/read*
_output_shapes	
:¬*
T0
V
mul_30/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
Χ£;
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
	Assign_11Assigntarget/q1/dense_1/biasadd_14*
use_locking(*
T0*
validate_shape(*)
_class
loc:@target/q1/dense_1/bias*
_output_shapes	
:¬
V
mul_31/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
`
mul_31Mulmul_31/xtarget/q1/dense_2/kernel/read*
T0*
_output_shapes
:	¬
V
mul_32/xConst^Adam_1*
valueB
 *
Χ£;*
_output_shapes
: *
dtype0
^
mul_32Mulmul_32/xmain/q1/dense_2/kernel/read*
T0*
_output_shapes
:	¬
I
add_15AddV2mul_31mul_32*
T0*
_output_shapes
:	¬
΅
	Assign_12Assigntarget/q1/dense_2/kerneladd_15*+
_class!
loc:@target/q1/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(*
T0
V
mul_33/xConst^Adam_1*
dtype0*
valueB
 *RΈ~?*
_output_shapes
: 
Y
mul_33Mulmul_33/xtarget/q1/dense_2/bias/read*
T0*
_output_shapes
:
V
mul_34/xConst^Adam_1*
_output_shapes
: *
valueB
 *
Χ£;*
dtype0
W
mul_34Mulmul_34/xmain/q1/dense_2/bias/read*
_output_shapes
:*
T0
D
add_16AddV2mul_33mul_34*
_output_shapes
:*
T0
¬
	Assign_13Assigntarget/q1/dense_2/biasadd_16*
validate_shape(*
T0*)
_class
loc:@target/q1/dense_2/bias*
_output_shapes
:*
use_locking(
V
mul_35/xConst^Adam_1*
valueB
 *RΈ~?*
dtype0*
_output_shapes
: 
^
mul_35Mulmul_35/xtarget/q2/dense/kernel/read*
T0*
_output_shapes
:	B
V
mul_36/xConst^Adam_1*
valueB
 *
Χ£;*
dtype0*
_output_shapes
: 
\
mul_36Mulmul_36/xmain/q2/dense/kernel/read*
_output_shapes
:	B*
T0
I
add_17AddV2mul_35mul_36*
_output_shapes
:	B*
T0
±
	Assign_14Assigntarget/q2/dense/kerneladd_17*
_output_shapes
:	B*
validate_shape(*)
_class
loc:@target/q2/dense/kernel*
use_locking(*
T0
V
mul_37/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
X
mul_37Mulmul_37/xtarget/q2/dense/bias/read*
_output_shapes	
:*
T0
V
mul_38/xConst^Adam_1*
dtype0*
valueB
 *
Χ£;*
_output_shapes
: 
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
	Assign_15Assigntarget/q2/dense/biasadd_18*
use_locking(*
_output_shapes	
:*
T0*'
_class
loc:@target/q2/dense/bias*
validate_shape(
V
mul_39/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
a
mul_39Mulmul_39/xtarget/q2/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
V
mul_40/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *
Χ£;
_
mul_40Mulmul_40/xmain/q2/dense_1/kernel/read*
T0* 
_output_shapes
:
¬
J
add_19AddV2mul_39mul_40*
T0* 
_output_shapes
:
¬
Ά
	Assign_16Assigntarget/q2/dense_1/kerneladd_19* 
_output_shapes
:
¬*
use_locking(*
validate_shape(*
T0*+
_class!
loc:@target/q2/dense_1/kernel
V
mul_41/xConst^Adam_1*
valueB
 *RΈ~?*
_output_shapes
: *
dtype0
Z
mul_41Mulmul_41/xtarget/q2/dense_1/bias/read*
_output_shapes	
:¬*
T0
V
mul_42/xConst^Adam_1*
_output_shapes
: *
valueB
 *
Χ£;*
dtype0
X
mul_42Mulmul_42/xmain/q2/dense_1/bias/read*
_output_shapes	
:¬*
T0
E
add_20AddV2mul_41mul_42*
T0*
_output_shapes	
:¬
­
	Assign_17Assigntarget/q2/dense_1/biasadd_20*
T0*
use_locking(*)
_class
loc:@target/q2/dense_1/bias*
validate_shape(*
_output_shapes	
:¬
V
mul_43/xConst^Adam_1*
valueB
 *RΈ~?*
dtype0*
_output_shapes
: 
`
mul_43Mulmul_43/xtarget/q2/dense_2/kernel/read*
_output_shapes
:	¬*
T0
V
mul_44/xConst^Adam_1*
dtype0*
valueB
 *
Χ£;*
_output_shapes
: 
^
mul_44Mulmul_44/xmain/q2/dense_2/kernel/read*
T0*
_output_shapes
:	¬
I
add_21AddV2mul_43mul_44*
T0*
_output_shapes
:	¬
΅
	Assign_18Assigntarget/q2/dense_2/kerneladd_21*
use_locking(*
T0*
_output_shapes
:	¬*
validate_shape(*+
_class!
loc:@target/q2/dense_2/kernel
V
mul_45/xConst^Adam_1*
valueB
 *RΈ~?*
dtype0*
_output_shapes
: 
Y
mul_45Mulmul_45/xtarget/q2/dense_2/bias/read*
_output_shapes
:*
T0
V
mul_46/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
Χ£;
W
mul_46Mulmul_46/xmain/q2/dense_2/bias/read*
T0*
_output_shapes
:
D
add_22AddV2mul_45mul_46*
_output_shapes
:*
T0
¬
	Assign_19Assigntarget/q2/dense_2/biasadd_22*
use_locking(*
_output_shapes
:*
validate_shape(*
T0*)
_class
loc:@target/q2/dense_2/bias
V
mul_47/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *RΈ~?
]
mul_47Mulmul_47/xtarget/v/dense/kernel/read*
_output_shapes
:	6*
T0
V
mul_48/xConst^Adam_1*
_output_shapes
: *
valueB
 *
Χ£;*
dtype0
[
mul_48Mulmul_48/xmain/v/dense/kernel/read*
T0*
_output_shapes
:	6
I
add_23AddV2mul_47mul_48*
T0*
_output_shapes
:	6
―
	Assign_20Assigntarget/v/dense/kerneladd_23*
T0*
use_locking(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
validate_shape(
V
mul_49/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
W
mul_49Mulmul_49/xtarget/v/dense/bias/read*
_output_shapes	
:*
T0
V
mul_50/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *
Χ£;
U
mul_50Mulmul_50/xmain/v/dense/bias/read*
T0*
_output_shapes	
:
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
 *RΈ~?*
_output_shapes
: *
dtype0
`
mul_51Mulmul_51/xtarget/v/dense_1/kernel/read* 
_output_shapes
:
¬*
T0
V
mul_52/xConst^Adam_1*
valueB
 *
Χ£;*
dtype0*
_output_shapes
: 
^
mul_52Mulmul_52/xmain/v/dense_1/kernel/read*
T0* 
_output_shapes
:
¬
J
add_25AddV2mul_51mul_52*
T0* 
_output_shapes
:
¬
΄
	Assign_22Assigntarget/v/dense_1/kerneladd_25**
_class 
loc:@target/v/dense_1/kernel*
T0*
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
 *RΈ~?*
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
Χ£;*
_output_shapes
: *
dtype0
W
mul_54Mulmul_54/xmain/v/dense_1/bias/read*
_output_shapes	
:¬*
T0
E
add_26AddV2mul_53mul_54*
_output_shapes	
:¬*
T0
«
	Assign_23Assigntarget/v/dense_1/biasadd_26*
validate_shape(*
use_locking(*(
_class
loc:@target/v/dense_1/bias*
T0*
_output_shapes	
:¬
V
mul_55/xConst^Adam_1*
dtype0*
_output_shapes
: *
valueB
 *RΈ~?
_
mul_55Mulmul_55/xtarget/v/dense_2/kernel/read*
T0*
_output_shapes
:	¬
V
mul_56/xConst^Adam_1*
valueB
 *
Χ£;*
dtype0*
_output_shapes
: 
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
	Assign_24Assigntarget/v/dense_2/kerneladd_27*
validate_shape(**
_class 
loc:@target/v/dense_2/kernel*
T0*
use_locking(*
_output_shapes
:	¬
V
mul_57/xConst^Adam_1*
_output_shapes
: *
dtype0*
valueB
 *RΈ~?
X
mul_57Mulmul_57/xtarget/v/dense_2/bias/read*
_output_shapes
:*
T0
V
mul_58/xConst^Adam_1*
valueB
 *
Χ£;*
dtype0*
_output_shapes
: 
V
mul_58Mulmul_58/xmain/v/dense_2/bias/read*
T0*
_output_shapes
:
D
add_28AddV2mul_57mul_58*
_output_shapes
:*
T0
ͺ
	Assign_25Assigntarget/v/dense_2/biasadd_28*
validate_shape(*
T0*(
_class
loc:@target/v/dense_2/bias*
use_locking(*
_output_shapes
:
Η

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
Δ
	Assign_26Assigntarget/pi/dense/kernelmain/pi/dense/kernel/read*)
_class
loc:@target/pi/dense/kernel*
validate_shape(*
use_locking(*
T0*
_output_shapes
:	6
Ί
	Assign_27Assigntarget/pi/dense/biasmain/pi/dense/bias/read*'
_class
loc:@target/pi/dense/bias*
validate_shape(*
T0*
_output_shapes	
:*
use_locking(
Λ
	Assign_28Assigntarget/pi/dense_1/kernelmain/pi/dense_1/kernel/read*+
_class!
loc:@target/pi/dense_1/kernel*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*
T0
ΐ
	Assign_29Assigntarget/pi/dense_1/biasmain/pi/dense_1/bias/read*
validate_shape(*
use_locking(*
T0*)
_class
loc:@target/pi/dense_1/bias*
_output_shapes	
:¬
Κ
	Assign_30Assigntarget/pi/dense_2/kernelmain/pi/dense_2/kernel/read*
use_locking(*
validate_shape(*+
_class!
loc:@target/pi/dense_2/kernel*
_output_shapes
:	¬*
T0
Ώ
	Assign_31Assigntarget/pi/dense_2/biasmain/pi/dense_2/bias/read*)
_class
loc:@target/pi/dense_2/bias*
_output_shapes
:*
validate_shape(*
use_locking(*
T0
Κ
	Assign_32Assigntarget/pi/dense_3/kernelmain/pi/dense_3/kernel/read*
T0*
use_locking(*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_3/kernel*
validate_shape(
Ώ
	Assign_33Assigntarget/pi/dense_3/biasmain/pi/dense_3/bias/read*
use_locking(*
T0*
_output_shapes
:*)
_class
loc:@target/pi/dense_3/bias*
validate_shape(
Δ
	Assign_34Assigntarget/q1/dense/kernelmain/q1/dense/kernel/read*)
_class
loc:@target/q1/dense/kernel*
T0*
_output_shapes
:	B*
validate_shape(*
use_locking(
Ί
	Assign_35Assigntarget/q1/dense/biasmain/q1/dense/bias/read*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(*'
_class
loc:@target/q1/dense/bias
Λ
	Assign_36Assigntarget/q1/dense_1/kernelmain/q1/dense_1/kernel/read*+
_class!
loc:@target/q1/dense_1/kernel* 
_output_shapes
:
¬*
T0*
validate_shape(*
use_locking(
ΐ
	Assign_37Assigntarget/q1/dense_1/biasmain/q1/dense_1/bias/read*)
_class
loc:@target/q1/dense_1/bias*
use_locking(*
T0*
_output_shapes	
:¬*
validate_shape(
Κ
	Assign_38Assigntarget/q1/dense_2/kernelmain/q1/dense_2/kernel/read*
T0*
_output_shapes
:	¬*
use_locking(*
validate_shape(*+
_class!
loc:@target/q1/dense_2/kernel
Ώ
	Assign_39Assigntarget/q1/dense_2/biasmain/q1/dense_2/bias/read*)
_class
loc:@target/q1/dense_2/bias*
validate_shape(*
_output_shapes
:*
T0*
use_locking(
Δ
	Assign_40Assigntarget/q2/dense/kernelmain/q2/dense/kernel/read*)
_class
loc:@target/q2/dense/kernel*
validate_shape(*
use_locking(*
_output_shapes
:	B*
T0
Ί
	Assign_41Assigntarget/q2/dense/biasmain/q2/dense/bias/read*
_output_shapes	
:*
T0*
validate_shape(*
use_locking(*'
_class
loc:@target/q2/dense/bias
Λ
	Assign_42Assigntarget/q2/dense_1/kernelmain/q2/dense_1/kernel/read*
T0* 
_output_shapes
:
¬*
validate_shape(*+
_class!
loc:@target/q2/dense_1/kernel*
use_locking(
ΐ
	Assign_43Assigntarget/q2/dense_1/biasmain/q2/dense_1/bias/read*)
_class
loc:@target/q2/dense_1/bias*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:¬
Κ
	Assign_44Assigntarget/q2/dense_2/kernelmain/q2/dense_2/kernel/read*
_output_shapes
:	¬*
validate_shape(*+
_class!
loc:@target/q2/dense_2/kernel*
use_locking(*
T0
Ώ
	Assign_45Assigntarget/q2/dense_2/biasmain/q2/dense_2/bias/read*
_output_shapes
:*
T0*)
_class
loc:@target/q2/dense_2/bias*
use_locking(*
validate_shape(
Α
	Assign_46Assigntarget/v/dense/kernelmain/v/dense/kernel/read*
validate_shape(*
T0*
use_locking(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6
·
	Assign_47Assigntarget/v/dense/biasmain/v/dense/bias/read*
T0*
_output_shapes	
:*&
_class
loc:@target/v/dense/bias*
use_locking(*
validate_shape(
Θ
	Assign_48Assigntarget/v/dense_1/kernelmain/v/dense_1/kernel/read*
T0*
use_locking(**
_class 
loc:@target/v/dense_1/kernel* 
_output_shapes
:
¬*
validate_shape(
½
	Assign_49Assigntarget/v/dense_1/biasmain/v/dense_1/bias/read*
_output_shapes	
:¬*(
_class
loc:@target/v/dense_1/bias*
use_locking(*
T0*
validate_shape(
Η
	Assign_50Assigntarget/v/dense_2/kernelmain/v/dense_2/kernel/read*
_output_shapes
:	¬**
_class 
loc:@target/v/dense_2/kernel*
use_locking(*
validate_shape(*
T0
Ό
	Assign_51Assigntarget/v/dense_2/biasmain/v/dense_2/bias/read*
_output_shapes
:*
validate_shape(*
T0*
use_locking(*(
_class
loc:@target/v/dense_2/bias
Μ
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
τ
init_1NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^beta1_power/Assign^beta1_power_1/Assign^beta2_power/Assign^beta2_power_1/Assign^main/pi/dense/bias/Adam/Assign!^main/pi/dense/bias/Adam_1/Assign^main/pi/dense/bias/Assign!^main/pi/dense/kernel/Adam/Assign#^main/pi/dense/kernel/Adam_1/Assign^main/pi/dense/kernel/Assign!^main/pi/dense_1/bias/Adam/Assign#^main/pi/dense_1/bias/Adam_1/Assign^main/pi/dense_1/bias/Assign#^main/pi/dense_1/kernel/Adam/Assign%^main/pi/dense_1/kernel/Adam_1/Assign^main/pi/dense_1/kernel/Assign!^main/pi/dense_2/bias/Adam/Assign#^main/pi/dense_2/bias/Adam_1/Assign^main/pi/dense_2/bias/Assign#^main/pi/dense_2/kernel/Adam/Assign%^main/pi/dense_2/kernel/Adam_1/Assign^main/pi/dense_2/kernel/Assign!^main/pi/dense_3/bias/Adam/Assign#^main/pi/dense_3/bias/Adam_1/Assign^main/pi/dense_3/bias/Assign#^main/pi/dense_3/kernel/Adam/Assign%^main/pi/dense_3/kernel/Adam_1/Assign^main/pi/dense_3/kernel/Assign^main/q1/dense/bias/Adam/Assign!^main/q1/dense/bias/Adam_1/Assign^main/q1/dense/bias/Assign!^main/q1/dense/kernel/Adam/Assign#^main/q1/dense/kernel/Adam_1/Assign^main/q1/dense/kernel/Assign!^main/q1/dense_1/bias/Adam/Assign#^main/q1/dense_1/bias/Adam_1/Assign^main/q1/dense_1/bias/Assign#^main/q1/dense_1/kernel/Adam/Assign%^main/q1/dense_1/kernel/Adam_1/Assign^main/q1/dense_1/kernel/Assign!^main/q1/dense_2/bias/Adam/Assign#^main/q1/dense_2/bias/Adam_1/Assign^main/q1/dense_2/bias/Assign#^main/q1/dense_2/kernel/Adam/Assign%^main/q1/dense_2/kernel/Adam_1/Assign^main/q1/dense_2/kernel/Assign^main/q2/dense/bias/Adam/Assign!^main/q2/dense/bias/Adam_1/Assign^main/q2/dense/bias/Assign!^main/q2/dense/kernel/Adam/Assign#^main/q2/dense/kernel/Adam_1/Assign^main/q2/dense/kernel/Assign!^main/q2/dense_1/bias/Adam/Assign#^main/q2/dense_1/bias/Adam_1/Assign^main/q2/dense_1/bias/Assign#^main/q2/dense_1/kernel/Adam/Assign%^main/q2/dense_1/kernel/Adam_1/Assign^main/q2/dense_1/kernel/Assign!^main/q2/dense_2/bias/Adam/Assign#^main/q2/dense_2/bias/Adam_1/Assign^main/q2/dense_2/bias/Assign#^main/q2/dense_2/kernel/Adam/Assign%^main/q2/dense_2/kernel/Adam_1/Assign^main/q2/dense_2/kernel/Assign^main/v/dense/bias/Adam/Assign ^main/v/dense/bias/Adam_1/Assign^main/v/dense/bias/Assign ^main/v/dense/kernel/Adam/Assign"^main/v/dense/kernel/Adam_1/Assign^main/v/dense/kernel/Assign ^main/v/dense_1/bias/Adam/Assign"^main/v/dense_1/bias/Adam_1/Assign^main/v/dense_1/bias/Assign"^main/v/dense_1/kernel/Adam/Assign$^main/v/dense_1/kernel/Adam_1/Assign^main/v/dense_1/kernel/Assign ^main/v/dense_2/bias/Adam/Assign"^main/v/dense_2/bias/Adam_1/Assign^main/v/dense_2/bias/Assign"^main/v/dense_2/kernel/Adam/Assign$^main/v/dense_2/kernel/Adam_1/Assign^main/v/dense_2/kernel/Assign^target/pi/dense/bias/Assign^target/pi/dense/kernel/Assign^target/pi/dense_1/bias/Assign ^target/pi/dense_1/kernel/Assign^target/pi/dense_2/bias/Assign ^target/pi/dense_2/kernel/Assign^target/pi/dense_3/bias/Assign ^target/pi/dense_3/kernel/Assign^target/q1/dense/bias/Assign^target/q1/dense/kernel/Assign^target/q1/dense_1/bias/Assign ^target/q1/dense_1/kernel/Assign^target/q1/dense_2/bias/Assign ^target/q1/dense_2/kernel/Assign^target/q2/dense/bias/Assign^target/q2/dense/kernel/Assign^target/q2/dense_1/bias/Assign ^target/q2/dense_1/kernel/Assign^target/q2/dense_2/bias/Assign ^target/q2/dense_2/kernel/Assign^target/v/dense/bias/Assign^target/v/dense/kernel/Assign^target/v/dense_1/bias/Assign^target/v/dense_1/kernel/Assign^target/v/dense_2/bias/Assign^target/v/dense_2/kernel/Assign
[
save_1/filename/inputConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
r
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
dtype0*
shape: *
_output_shapes
: 
i
save_1/ConstPlaceholderWithDefaultsave_1/filename*
_output_shapes
: *
shape: *
dtype0

save_1/StringJoin/inputs_1Const*
_output_shapes
: *<
value3B1 B+_temp_9337eb6a481d417183136240479a8902/part*
dtype0
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
S
save_1/num_shardsConst*
value	B :*
_output_shapes
: *
dtype0
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
Β
save_1/SaveV2/tensor_namesConst*
dtype0*σ
valueιBζqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
_output_shapes
:q
Κ
save_1/SaveV2/shape_and_slicesConst*χ
valueνBκqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:q*
dtype0
Κ
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
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*
T0*
N*

axis *
_output_shapes
:

save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency*
_output_shapes
: *
T0
Ε
save_1/RestoreV2/tensor_namesConst*
dtype0*σ
valueιBζqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
_output_shapes
:q
Ν
!save_1/RestoreV2/shape_and_slicesConst*χ
valueνBκqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:q*
dtype0
Λ
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*Ϊ
_output_shapesΗ
Δ:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*
dtypesu
s2q
’
save_1/AssignAssignVariablesave_1/RestoreV2*
_class
loc:@Variable*
validate_shape(*
_output_shapes

:@*
use_locking(*
T0
ͺ
save_1/Assign_1Assign
Variable_1save_1/RestoreV2:1*
_output_shapes

:@@*
use_locking(*
_class
loc:@Variable_1*
validate_shape(*
T0
ͺ
save_1/Assign_2Assign
Variable_2save_1/RestoreV2:2*
_output_shapes

:@@*
_class
loc:@Variable_2*
use_locking(*
T0*
validate_shape(
ͺ
save_1/Assign_3Assign
Variable_3save_1/RestoreV2:3*
_class
loc:@Variable_3*
use_locking(*
_output_shapes

:@@*
T0*
validate_shape(
ͺ
save_1/Assign_4Assign
Variable_4save_1/RestoreV2:4*
_class
loc:@Variable_4*
validate_shape(*
T0*
_output_shapes

:@*
use_locking(
«
save_1/Assign_5Assignbeta1_powersave_1/RestoreV2:5*
_output_shapes
: *
validate_shape(*%
_class
loc:@main/pi/dense/bias*
use_locking(*
T0
­
save_1/Assign_6Assignbeta1_power_1save_1/RestoreV2:6*
validate_shape(*
T0*
use_locking(*
_output_shapes
: *%
_class
loc:@main/q1/dense/bias
«
save_1/Assign_7Assignbeta2_powersave_1/RestoreV2:7*%
_class
loc:@main/pi/dense/bias*
use_locking(*
T0*
validate_shape(*
_output_shapes
: 
­
save_1/Assign_8Assignbeta2_power_1save_1/RestoreV2:8*
validate_shape(*
use_locking(*
T0*%
_class
loc:@main/q1/dense/bias*
_output_shapes
: 
·
save_1/Assign_9Assignmain/pi/dense/biassave_1/RestoreV2:9*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias
Ύ
save_1/Assign_10Assignmain/pi/dense/bias/Adamsave_1/RestoreV2:10*%
_class
loc:@main/pi/dense/bias*
T0*
use_locking(*
_output_shapes	
:*
validate_shape(
ΐ
save_1/Assign_11Assignmain/pi/dense/bias/Adam_1save_1/RestoreV2:11*
validate_shape(*
T0*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
use_locking(
Α
save_1/Assign_12Assignmain/pi/dense/kernelsave_1/RestoreV2:12*'
_class
loc:@main/pi/dense/kernel*
use_locking(*
T0*
_output_shapes
:	6*
validate_shape(
Ζ
save_1/Assign_13Assignmain/pi/dense/kernel/Adamsave_1/RestoreV2:13*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	6*'
_class
loc:@main/pi/dense/kernel
Θ
save_1/Assign_14Assignmain/pi/dense/kernel/Adam_1save_1/RestoreV2:14*
_output_shapes
:	6*
validate_shape(*
T0*
use_locking(*'
_class
loc:@main/pi/dense/kernel
½
save_1/Assign_15Assignmain/pi/dense_1/biassave_1/RestoreV2:15*
T0*
_output_shapes	
:¬*
use_locking(*'
_class
loc:@main/pi/dense_1/bias*
validate_shape(
Β
save_1/Assign_16Assignmain/pi/dense_1/bias/Adamsave_1/RestoreV2:16*
use_locking(*
validate_shape(*'
_class
loc:@main/pi/dense_1/bias*
T0*
_output_shapes	
:¬
Δ
save_1/Assign_17Assignmain/pi/dense_1/bias/Adam_1save_1/RestoreV2:17*
_output_shapes	
:¬*
use_locking(*
T0*'
_class
loc:@main/pi/dense_1/bias*
validate_shape(
Ζ
save_1/Assign_18Assignmain/pi/dense_1/kernelsave_1/RestoreV2:18* 
_output_shapes
:
¬*
T0*
validate_shape(*)
_class
loc:@main/pi/dense_1/kernel*
use_locking(
Λ
save_1/Assign_19Assignmain/pi/dense_1/kernel/Adamsave_1/RestoreV2:19* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/pi/dense_1/kernel*
use_locking(*
T0
Ν
save_1/Assign_20Assignmain/pi/dense_1/kernel/Adam_1save_1/RestoreV2:20*)
_class
loc:@main/pi/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
T0*
use_locking(
Ό
save_1/Assign_21Assignmain/pi/dense_2/biassave_1/RestoreV2:21*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
T0*
_output_shapes
:*
use_locking(
Α
save_1/Assign_22Assignmain/pi/dense_2/bias/Adamsave_1/RestoreV2:22*
T0*
use_locking(*
validate_shape(*
_output_shapes
:*'
_class
loc:@main/pi/dense_2/bias
Γ
save_1/Assign_23Assignmain/pi/dense_2/bias/Adam_1save_1/RestoreV2:23*
use_locking(*
_output_shapes
:*
validate_shape(*
T0*'
_class
loc:@main/pi/dense_2/bias
Ε
save_1/Assign_24Assignmain/pi/dense_2/kernelsave_1/RestoreV2:24*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(*
T0*
use_locking(*
_output_shapes
:	¬
Κ
save_1/Assign_25Assignmain/pi/dense_2/kernel/Adamsave_1/RestoreV2:25*
_output_shapes
:	¬*
use_locking(*
T0*
validate_shape(*)
_class
loc:@main/pi/dense_2/kernel
Μ
save_1/Assign_26Assignmain/pi/dense_2/kernel/Adam_1save_1/RestoreV2:26*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel
Ό
save_1/Assign_27Assignmain/pi/dense_3/biassave_1/RestoreV2:27*
_output_shapes
:*
use_locking(*'
_class
loc:@main/pi/dense_3/bias*
T0*
validate_shape(
Α
save_1/Assign_28Assignmain/pi/dense_3/bias/Adamsave_1/RestoreV2:28*
T0*
use_locking(*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(*
_output_shapes
:
Γ
save_1/Assign_29Assignmain/pi/dense_3/bias/Adam_1save_1/RestoreV2:29*
_output_shapes
:*
T0*'
_class
loc:@main/pi/dense_3/bias*
use_locking(*
validate_shape(
Ε
save_1/Assign_30Assignmain/pi/dense_3/kernelsave_1/RestoreV2:30*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
validate_shape(*
T0*
use_locking(
Κ
save_1/Assign_31Assignmain/pi/dense_3/kernel/Adamsave_1/RestoreV2:31*
_output_shapes
:	¬*
validate_shape(*
T0*)
_class
loc:@main/pi/dense_3/kernel*
use_locking(
Μ
save_1/Assign_32Assignmain/pi/dense_3/kernel/Adam_1save_1/RestoreV2:32*
T0*
use_locking(*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
validate_shape(
Ή
save_1/Assign_33Assignmain/q1/dense/biassave_1/RestoreV2:33*%
_class
loc:@main/q1/dense/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:
Ύ
save_1/Assign_34Assignmain/q1/dense/bias/Adamsave_1/RestoreV2:34*
use_locking(*%
_class
loc:@main/q1/dense/bias*
_output_shapes	
:*
validate_shape(*
T0
ΐ
save_1/Assign_35Assignmain/q1/dense/bias/Adam_1save_1/RestoreV2:35*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:*
use_locking(
Α
save_1/Assign_36Assignmain/q1/dense/kernelsave_1/RestoreV2:36*'
_class
loc:@main/q1/dense/kernel*
use_locking(*
validate_shape(*
T0*
_output_shapes
:	B
Ζ
save_1/Assign_37Assignmain/q1/dense/kernel/Adamsave_1/RestoreV2:37*
_output_shapes
:	B*'
_class
loc:@main/q1/dense/kernel*
T0*
use_locking(*
validate_shape(
Θ
save_1/Assign_38Assignmain/q1/dense/kernel/Adam_1save_1/RestoreV2:38*
T0*
_output_shapes
:	B*
validate_shape(*
use_locking(*'
_class
loc:@main/q1/dense/kernel
½
save_1/Assign_39Assignmain/q1/dense_1/biassave_1/RestoreV2:39*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/q1/dense_1/bias*
_output_shapes	
:¬
Β
save_1/Assign_40Assignmain/q1/dense_1/bias/Adamsave_1/RestoreV2:40*
validate_shape(*
use_locking(*
_output_shapes	
:¬*
T0*'
_class
loc:@main/q1/dense_1/bias
Δ
save_1/Assign_41Assignmain/q1/dense_1/bias/Adam_1save_1/RestoreV2:41*'
_class
loc:@main/q1/dense_1/bias*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:¬
Ζ
save_1/Assign_42Assignmain/q1/dense_1/kernelsave_1/RestoreV2:42*
use_locking(* 
_output_shapes
:
¬*)
_class
loc:@main/q1/dense_1/kernel*
T0*
validate_shape(
Λ
save_1/Assign_43Assignmain/q1/dense_1/kernel/Adamsave_1/RestoreV2:43* 
_output_shapes
:
¬*
validate_shape(*
T0*)
_class
loc:@main/q1/dense_1/kernel*
use_locking(
Ν
save_1/Assign_44Assignmain/q1/dense_1/kernel/Adam_1save_1/RestoreV2:44*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel* 
_output_shapes
:
¬*
T0*
use_locking(
Ό
save_1/Assign_45Assignmain/q1/dense_2/biassave_1/RestoreV2:45*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:*
validate_shape(*
T0*
use_locking(
Α
save_1/Assign_46Assignmain/q1/dense_2/bias/Adamsave_1/RestoreV2:46*
use_locking(*'
_class
loc:@main/q1/dense_2/bias*
validate_shape(*
_output_shapes
:*
T0
Γ
save_1/Assign_47Assignmain/q1/dense_2/bias/Adam_1save_1/RestoreV2:47*
use_locking(*
_output_shapes
:*
T0*
validate_shape(*'
_class
loc:@main/q1/dense_2/bias
Ε
save_1/Assign_48Assignmain/q1/dense_2/kernelsave_1/RestoreV2:48*
use_locking(*)
_class
loc:@main/q1/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬*
T0
Κ
save_1/Assign_49Assignmain/q1/dense_2/kernel/Adamsave_1/RestoreV2:49*
use_locking(*
T0*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:	¬
Μ
save_1/Assign_50Assignmain/q1/dense_2/kernel/Adam_1save_1/RestoreV2:50*
T0*
use_locking(*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel*
_output_shapes
:	¬
Ή
save_1/Assign_51Assignmain/q2/dense/biassave_1/RestoreV2:51*%
_class
loc:@main/q2/dense/bias*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:
Ύ
save_1/Assign_52Assignmain/q2/dense/bias/Adamsave_1/RestoreV2:52*
validate_shape(*%
_class
loc:@main/q2/dense/bias*
use_locking(*
T0*
_output_shapes	
:
ΐ
save_1/Assign_53Assignmain/q2/dense/bias/Adam_1save_1/RestoreV2:53*
use_locking(*
T0*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias*
validate_shape(
Α
save_1/Assign_54Assignmain/q2/dense/kernelsave_1/RestoreV2:54*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
validate_shape(*
T0*
use_locking(
Ζ
save_1/Assign_55Assignmain/q2/dense/kernel/Adamsave_1/RestoreV2:55*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
use_locking(*
validate_shape(*
T0
Θ
save_1/Assign_56Assignmain/q2/dense/kernel/Adam_1save_1/RestoreV2:56*
validate_shape(*
use_locking(*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
T0
½
save_1/Assign_57Assignmain/q2/dense_1/biassave_1/RestoreV2:57*
use_locking(*'
_class
loc:@main/q2/dense_1/bias*
T0*
validate_shape(*
_output_shapes	
:¬
Β
save_1/Assign_58Assignmain/q2/dense_1/bias/Adamsave_1/RestoreV2:58*'
_class
loc:@main/q2/dense_1/bias*
validate_shape(*
use_locking(*
T0*
_output_shapes	
:¬
Δ
save_1/Assign_59Assignmain/q2/dense_1/bias/Adam_1save_1/RestoreV2:59*
validate_shape(*
_output_shapes	
:¬*'
_class
loc:@main/q2/dense_1/bias*
T0*
use_locking(
Ζ
save_1/Assign_60Assignmain/q2/dense_1/kernelsave_1/RestoreV2:60*)
_class
loc:@main/q2/dense_1/kernel*
T0*
use_locking(*
validate_shape(* 
_output_shapes
:
¬
Λ
save_1/Assign_61Assignmain/q2/dense_1/kernel/Adamsave_1/RestoreV2:61*
T0*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬*
validate_shape(*
use_locking(
Ν
save_1/Assign_62Assignmain/q2/dense_1/kernel/Adam_1save_1/RestoreV2:62* 
_output_shapes
:
¬*
validate_shape(*
T0*)
_class
loc:@main/q2/dense_1/kernel*
use_locking(
Ό
save_1/Assign_63Assignmain/q2/dense_2/biassave_1/RestoreV2:63*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
T0*
use_locking(*
validate_shape(
Α
save_1/Assign_64Assignmain/q2/dense_2/bias/Adamsave_1/RestoreV2:64*
use_locking(*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
validate_shape(*
T0
Γ
save_1/Assign_65Assignmain/q2/dense_2/bias/Adam_1save_1/RestoreV2:65*
use_locking(*
_output_shapes
:*
validate_shape(*'
_class
loc:@main/q2/dense_2/bias*
T0
Ε
save_1/Assign_66Assignmain/q2/dense_2/kernelsave_1/RestoreV2:66*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬*
use_locking(*
T0
Κ
save_1/Assign_67Assignmain/q2/dense_2/kernel/Adamsave_1/RestoreV2:67*
validate_shape(*
use_locking(*
_output_shapes
:	¬*)
_class
loc:@main/q2/dense_2/kernel*
T0
Μ
save_1/Assign_68Assignmain/q2/dense_2/kernel/Adam_1save_1/RestoreV2:68*
_output_shapes
:	¬*
T0*
use_locking(*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(
·
save_1/Assign_69Assignmain/v/dense/biassave_1/RestoreV2:69*
validate_shape(*
use_locking(*
T0*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:
Ό
save_1/Assign_70Assignmain/v/dense/bias/Adamsave_1/RestoreV2:70*
_output_shapes	
:*
T0*
use_locking(*
validate_shape(*$
_class
loc:@main/v/dense/bias
Ύ
save_1/Assign_71Assignmain/v/dense/bias/Adam_1save_1/RestoreV2:71*$
_class
loc:@main/v/dense/bias*
_output_shapes	
:*
validate_shape(*
T0*
use_locking(
Ώ
save_1/Assign_72Assignmain/v/dense/kernelsave_1/RestoreV2:72*
T0*
_output_shapes
:	6*
validate_shape(*
use_locking(*&
_class
loc:@main/v/dense/kernel
Δ
save_1/Assign_73Assignmain/v/dense/kernel/Adamsave_1/RestoreV2:73*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
T0*
use_locking(
Ζ
save_1/Assign_74Assignmain/v/dense/kernel/Adam_1save_1/RestoreV2:74*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
use_locking(*
T0*
validate_shape(
»
save_1/Assign_75Assignmain/v/dense_1/biassave_1/RestoreV2:75*
T0*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬*
validate_shape(
ΐ
save_1/Assign_76Assignmain/v/dense_1/bias/Adamsave_1/RestoreV2:76*
use_locking(*&
_class
loc:@main/v/dense_1/bias*
T0*
validate_shape(*
_output_shapes	
:¬
Β
save_1/Assign_77Assignmain/v/dense_1/bias/Adam_1save_1/RestoreV2:77*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:¬*&
_class
loc:@main/v/dense_1/bias
Δ
save_1/Assign_78Assignmain/v/dense_1/kernelsave_1/RestoreV2:78*
T0*
validate_shape(* 
_output_shapes
:
¬*
use_locking(*(
_class
loc:@main/v/dense_1/kernel
Ι
save_1/Assign_79Assignmain/v/dense_1/kernel/Adamsave_1/RestoreV2:79*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
T0*
validate_shape(*
use_locking(
Λ
save_1/Assign_80Assignmain/v/dense_1/kernel/Adam_1save_1/RestoreV2:80*
T0*(
_class
loc:@main/v/dense_1/kernel* 
_output_shapes
:
¬*
use_locking(*
validate_shape(
Ί
save_1/Assign_81Assignmain/v/dense_2/biassave_1/RestoreV2:81*
_output_shapes
:*
use_locking(*
validate_shape(*
T0*&
_class
loc:@main/v/dense_2/bias
Ώ
save_1/Assign_82Assignmain/v/dense_2/bias/Adamsave_1/RestoreV2:82*
validate_shape(*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
_output_shapes
:*
T0
Α
save_1/Assign_83Assignmain/v/dense_2/bias/Adam_1save_1/RestoreV2:83*
validate_shape(*
T0*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
_output_shapes
:
Γ
save_1/Assign_84Assignmain/v/dense_2/kernelsave_1/RestoreV2:84*
use_locking(*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel*
_output_shapes
:	¬*
T0
Θ
save_1/Assign_85Assignmain/v/dense_2/kernel/Adamsave_1/RestoreV2:85*
T0*
_output_shapes
:	¬*
validate_shape(*
use_locking(*(
_class
loc:@main/v/dense_2/kernel
Κ
save_1/Assign_86Assignmain/v/dense_2/kernel/Adam_1save_1/RestoreV2:86*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
use_locking(*
T0*
validate_shape(
½
save_1/Assign_87Assigntarget/pi/dense/biassave_1/RestoreV2:87*
T0*
_output_shapes	
:*
validate_shape(*
use_locking(*'
_class
loc:@target/pi/dense/bias
Ε
save_1/Assign_88Assigntarget/pi/dense/kernelsave_1/RestoreV2:88*
validate_shape(*
use_locking(*
T0*
_output_shapes
:	6*)
_class
loc:@target/pi/dense/kernel
Α
save_1/Assign_89Assigntarget/pi/dense_1/biassave_1/RestoreV2:89*)
_class
loc:@target/pi/dense_1/bias*
T0*
use_locking(*
_output_shapes	
:¬*
validate_shape(
Κ
save_1/Assign_90Assigntarget/pi/dense_1/kernelsave_1/RestoreV2:90*
T0* 
_output_shapes
:
¬*+
_class!
loc:@target/pi/dense_1/kernel*
validate_shape(*
use_locking(
ΐ
save_1/Assign_91Assigntarget/pi/dense_2/biassave_1/RestoreV2:91*
T0*
_output_shapes
:*)
_class
loc:@target/pi/dense_2/bias*
use_locking(*
validate_shape(
Ι
save_1/Assign_92Assigntarget/pi/dense_2/kernelsave_1/RestoreV2:92*
T0*
validate_shape(*
use_locking(*
_output_shapes
:	¬*+
_class!
loc:@target/pi/dense_2/kernel
ΐ
save_1/Assign_93Assigntarget/pi/dense_3/biassave_1/RestoreV2:93*
T0*
use_locking(*
validate_shape(*)
_class
loc:@target/pi/dense_3/bias*
_output_shapes
:
Ι
save_1/Assign_94Assigntarget/pi/dense_3/kernelsave_1/RestoreV2:94*
use_locking(*
T0*
validate_shape(*+
_class!
loc:@target/pi/dense_3/kernel*
_output_shapes
:	¬
½
save_1/Assign_95Assigntarget/q1/dense/biassave_1/RestoreV2:95*
_output_shapes	
:*
validate_shape(*'
_class
loc:@target/q1/dense/bias*
T0*
use_locking(
Ε
save_1/Assign_96Assigntarget/q1/dense/kernelsave_1/RestoreV2:96*)
_class
loc:@target/q1/dense/kernel*
validate_shape(*
_output_shapes
:	B*
T0*
use_locking(
Α
save_1/Assign_97Assigntarget/q1/dense_1/biassave_1/RestoreV2:97*
validate_shape(*
_output_shapes	
:¬*
use_locking(*)
_class
loc:@target/q1/dense_1/bias*
T0
Κ
save_1/Assign_98Assigntarget/q1/dense_1/kernelsave_1/RestoreV2:98*
use_locking(* 
_output_shapes
:
¬*+
_class!
loc:@target/q1/dense_1/kernel*
T0*
validate_shape(
ΐ
save_1/Assign_99Assigntarget/q1/dense_2/biassave_1/RestoreV2:99*
validate_shape(*
use_locking(*
_output_shapes
:*)
_class
loc:@target/q1/dense_2/bias*
T0
Λ
save_1/Assign_100Assigntarget/q1/dense_2/kernelsave_1/RestoreV2:100*
T0*
use_locking(*
_output_shapes
:	¬*
validate_shape(*+
_class!
loc:@target/q1/dense_2/kernel
Ώ
save_1/Assign_101Assigntarget/q2/dense/biassave_1/RestoreV2:101*
validate_shape(*
T0*
use_locking(*'
_class
loc:@target/q2/dense/bias*
_output_shapes	
:
Η
save_1/Assign_102Assigntarget/q2/dense/kernelsave_1/RestoreV2:102*
T0*
use_locking(*
validate_shape(*)
_class
loc:@target/q2/dense/kernel*
_output_shapes
:	B
Γ
save_1/Assign_103Assigntarget/q2/dense_1/biassave_1/RestoreV2:103*
validate_shape(*
T0*
_output_shapes	
:¬*)
_class
loc:@target/q2/dense_1/bias*
use_locking(
Μ
save_1/Assign_104Assigntarget/q2/dense_1/kernelsave_1/RestoreV2:104*
validate_shape(* 
_output_shapes
:
¬*+
_class!
loc:@target/q2/dense_1/kernel*
T0*
use_locking(
Β
save_1/Assign_105Assigntarget/q2/dense_2/biassave_1/RestoreV2:105*
T0*
validate_shape(*)
_class
loc:@target/q2/dense_2/bias*
_output_shapes
:*
use_locking(
Λ
save_1/Assign_106Assigntarget/q2/dense_2/kernelsave_1/RestoreV2:106*
T0*+
_class!
loc:@target/q2/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(
½
save_1/Assign_107Assigntarget/v/dense/biassave_1/RestoreV2:107*
T0*
_output_shapes	
:*
use_locking(*&
_class
loc:@target/v/dense/bias*
validate_shape(
Ε
save_1/Assign_108Assigntarget/v/dense/kernelsave_1/RestoreV2:108*
use_locking(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
T0*
validate_shape(
Α
save_1/Assign_109Assigntarget/v/dense_1/biassave_1/RestoreV2:109*
_output_shapes	
:¬*
validate_shape(*
use_locking(*(
_class
loc:@target/v/dense_1/bias*
T0
Κ
save_1/Assign_110Assigntarget/v/dense_1/kernelsave_1/RestoreV2:110*
T0* 
_output_shapes
:
¬*
validate_shape(*
use_locking(**
_class 
loc:@target/v/dense_1/kernel
ΐ
save_1/Assign_111Assigntarget/v/dense_2/biassave_1/RestoreV2:111*
_output_shapes
:*
validate_shape(*
T0*
use_locking(*(
_class
loc:@target/v/dense_2/bias
Ι
save_1/Assign_112Assigntarget/v/dense_2/kernelsave_1/RestoreV2:112*
use_locking(*
T0*
validate_shape(**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬

save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_100^save_1/Assign_101^save_1/Assign_102^save_1/Assign_103^save_1/Assign_104^save_1/Assign_105^save_1/Assign_106^save_1/Assign_107^save_1/Assign_108^save_1/Assign_109^save_1/Assign_11^save_1/Assign_110^save_1/Assign_111^save_1/Assign_112^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_3^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_4^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_46^save_1/Assign_47^save_1/Assign_48^save_1/Assign_49^save_1/Assign_5^save_1/Assign_50^save_1/Assign_51^save_1/Assign_52^save_1/Assign_53^save_1/Assign_54^save_1/Assign_55^save_1/Assign_56^save_1/Assign_57^save_1/Assign_58^save_1/Assign_59^save_1/Assign_6^save_1/Assign_60^save_1/Assign_61^save_1/Assign_62^save_1/Assign_63^save_1/Assign_64^save_1/Assign_65^save_1/Assign_66^save_1/Assign_67^save_1/Assign_68^save_1/Assign_69^save_1/Assign_7^save_1/Assign_70^save_1/Assign_71^save_1/Assign_72^save_1/Assign_73^save_1/Assign_74^save_1/Assign_75^save_1/Assign_76^save_1/Assign_77^save_1/Assign_78^save_1/Assign_79^save_1/Assign_8^save_1/Assign_80^save_1/Assign_81^save_1/Assign_82^save_1/Assign_83^save_1/Assign_84^save_1/Assign_85^save_1/Assign_86^save_1/Assign_87^save_1/Assign_88^save_1/Assign_89^save_1/Assign_9^save_1/Assign_90^save_1/Assign_91^save_1/Assign_92^save_1/Assign_93^save_1/Assign_94^save_1/Assign_95^save_1/Assign_96^save_1/Assign_97^save_1/Assign_98^save_1/Assign_99
1
save_1/restore_allNoOp^save_1/restore_shard
[
save_2/filename/inputConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
r
save_2/filenamePlaceholderWithDefaultsave_2/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_2/ConstPlaceholderWithDefaultsave_2/filename*
shape: *
dtype0*
_output_shapes
: 

save_2/StringJoin/inputs_1Const*
_output_shapes
: *
dtype0*<
value3B1 B+_temp_f6dca76bad934e9596a99ccdda4f68a7/part
{
save_2/StringJoin
StringJoinsave_2/Constsave_2/StringJoin/inputs_1*
_output_shapes
: *
N*
	separator 
S
save_2/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
^
save_2/ShardedFilename/shardConst*
value	B : *
_output_shapes
: *
dtype0

save_2/ShardedFilenameShardedFilenamesave_2/StringJoinsave_2/ShardedFilename/shardsave_2/num_shards*
_output_shapes
: 
Β
save_2/SaveV2/tensor_namesConst*
_output_shapes
:q*
dtype0*σ
valueιBζqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel
Κ
save_2/SaveV2/shape_and_slicesConst*χ
valueνBκqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:q*
dtype0
Κ
save_2/SaveV2SaveV2save_2/ShardedFilenamesave_2/SaveV2/tensor_namessave_2/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2
Variable_3
Variable_4beta1_powerbeta1_power_1beta2_powerbeta2_power_1main/pi/dense/biasmain/pi/dense/bias/Adammain/pi/dense/bias/Adam_1main/pi/dense/kernelmain/pi/dense/kernel/Adammain/pi/dense/kernel/Adam_1main/pi/dense_1/biasmain/pi/dense_1/bias/Adammain/pi/dense_1/bias/Adam_1main/pi/dense_1/kernelmain/pi/dense_1/kernel/Adammain/pi/dense_1/kernel/Adam_1main/pi/dense_2/biasmain/pi/dense_2/bias/Adammain/pi/dense_2/bias/Adam_1main/pi/dense_2/kernelmain/pi/dense_2/kernel/Adammain/pi/dense_2/kernel/Adam_1main/pi/dense_3/biasmain/pi/dense_3/bias/Adammain/pi/dense_3/bias/Adam_1main/pi/dense_3/kernelmain/pi/dense_3/kernel/Adammain/pi/dense_3/kernel/Adam_1main/q1/dense/biasmain/q1/dense/bias/Adammain/q1/dense/bias/Adam_1main/q1/dense/kernelmain/q1/dense/kernel/Adammain/q1/dense/kernel/Adam_1main/q1/dense_1/biasmain/q1/dense_1/bias/Adammain/q1/dense_1/bias/Adam_1main/q1/dense_1/kernelmain/q1/dense_1/kernel/Adammain/q1/dense_1/kernel/Adam_1main/q1/dense_2/biasmain/q1/dense_2/bias/Adammain/q1/dense_2/bias/Adam_1main/q1/dense_2/kernelmain/q1/dense_2/kernel/Adammain/q1/dense_2/kernel/Adam_1main/q2/dense/biasmain/q2/dense/bias/Adammain/q2/dense/bias/Adam_1main/q2/dense/kernelmain/q2/dense/kernel/Adammain/q2/dense/kernel/Adam_1main/q2/dense_1/biasmain/q2/dense_1/bias/Adammain/q2/dense_1/bias/Adam_1main/q2/dense_1/kernelmain/q2/dense_1/kernel/Adammain/q2/dense_1/kernel/Adam_1main/q2/dense_2/biasmain/q2/dense_2/bias/Adammain/q2/dense_2/bias/Adam_1main/q2/dense_2/kernelmain/q2/dense_2/kernel/Adammain/q2/dense_2/kernel/Adam_1main/v/dense/biasmain/v/dense/bias/Adammain/v/dense/bias/Adam_1main/v/dense/kernelmain/v/dense/kernel/Adammain/v/dense/kernel/Adam_1main/v/dense_1/biasmain/v/dense_1/bias/Adammain/v/dense_1/bias/Adam_1main/v/dense_1/kernelmain/v/dense_1/kernel/Adammain/v/dense_1/kernel/Adam_1main/v/dense_2/biasmain/v/dense_2/bias/Adammain/v/dense_2/bias/Adam_1main/v/dense_2/kernelmain/v/dense_2/kernel/Adammain/v/dense_2/kernel/Adam_1target/pi/dense/biastarget/pi/dense/kerneltarget/pi/dense_1/biastarget/pi/dense_1/kerneltarget/pi/dense_2/biastarget/pi/dense_2/kerneltarget/pi/dense_3/biastarget/pi/dense_3/kerneltarget/q1/dense/biastarget/q1/dense/kerneltarget/q1/dense_1/biastarget/q1/dense_1/kerneltarget/q1/dense_2/biastarget/q1/dense_2/kerneltarget/q2/dense/biastarget/q2/dense/kerneltarget/q2/dense_1/biastarget/q2/dense_1/kerneltarget/q2/dense_2/biastarget/q2/dense_2/kerneltarget/v/dense/biastarget/v/dense/kerneltarget/v/dense_1/biastarget/v/dense_1/kerneltarget/v/dense_2/biastarget/v/dense_2/kernel*
dtypesu
s2q

save_2/control_dependencyIdentitysave_2/ShardedFilename^save_2/SaveV2*
T0*
_output_shapes
: *)
_class
loc:@save_2/ShardedFilename
£
-save_2/MergeV2Checkpoints/checkpoint_prefixesPacksave_2/ShardedFilename^save_2/control_dependency*
T0*

axis *
_output_shapes
:*
N

save_2/MergeV2CheckpointsMergeV2Checkpoints-save_2/MergeV2Checkpoints/checkpoint_prefixessave_2/Const*
delete_old_dirs(

save_2/IdentityIdentitysave_2/Const^save_2/MergeV2Checkpoints^save_2/control_dependency*
_output_shapes
: *
T0
Ε
save_2/RestoreV2/tensor_namesConst*σ
valueιBζqBVariableB
Variable_1B
Variable_2B
Variable_3B
Variable_4Bbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bmain/pi/dense/biasBmain/pi/dense/bias/AdamBmain/pi/dense/bias/Adam_1Bmain/pi/dense/kernelBmain/pi/dense/kernel/AdamBmain/pi/dense/kernel/Adam_1Bmain/pi/dense_1/biasBmain/pi/dense_1/bias/AdamBmain/pi/dense_1/bias/Adam_1Bmain/pi/dense_1/kernelBmain/pi/dense_1/kernel/AdamBmain/pi/dense_1/kernel/Adam_1Bmain/pi/dense_2/biasBmain/pi/dense_2/bias/AdamBmain/pi/dense_2/bias/Adam_1Bmain/pi/dense_2/kernelBmain/pi/dense_2/kernel/AdamBmain/pi/dense_2/kernel/Adam_1Bmain/pi/dense_3/biasBmain/pi/dense_3/bias/AdamBmain/pi/dense_3/bias/Adam_1Bmain/pi/dense_3/kernelBmain/pi/dense_3/kernel/AdamBmain/pi/dense_3/kernel/Adam_1Bmain/q1/dense/biasBmain/q1/dense/bias/AdamBmain/q1/dense/bias/Adam_1Bmain/q1/dense/kernelBmain/q1/dense/kernel/AdamBmain/q1/dense/kernel/Adam_1Bmain/q1/dense_1/biasBmain/q1/dense_1/bias/AdamBmain/q1/dense_1/bias/Adam_1Bmain/q1/dense_1/kernelBmain/q1/dense_1/kernel/AdamBmain/q1/dense_1/kernel/Adam_1Bmain/q1/dense_2/biasBmain/q1/dense_2/bias/AdamBmain/q1/dense_2/bias/Adam_1Bmain/q1/dense_2/kernelBmain/q1/dense_2/kernel/AdamBmain/q1/dense_2/kernel/Adam_1Bmain/q2/dense/biasBmain/q2/dense/bias/AdamBmain/q2/dense/bias/Adam_1Bmain/q2/dense/kernelBmain/q2/dense/kernel/AdamBmain/q2/dense/kernel/Adam_1Bmain/q2/dense_1/biasBmain/q2/dense_1/bias/AdamBmain/q2/dense_1/bias/Adam_1Bmain/q2/dense_1/kernelBmain/q2/dense_1/kernel/AdamBmain/q2/dense_1/kernel/Adam_1Bmain/q2/dense_2/biasBmain/q2/dense_2/bias/AdamBmain/q2/dense_2/bias/Adam_1Bmain/q2/dense_2/kernelBmain/q2/dense_2/kernel/AdamBmain/q2/dense_2/kernel/Adam_1Bmain/v/dense/biasBmain/v/dense/bias/AdamBmain/v/dense/bias/Adam_1Bmain/v/dense/kernelBmain/v/dense/kernel/AdamBmain/v/dense/kernel/Adam_1Bmain/v/dense_1/biasBmain/v/dense_1/bias/AdamBmain/v/dense_1/bias/Adam_1Bmain/v/dense_1/kernelBmain/v/dense_1/kernel/AdamBmain/v/dense_1/kernel/Adam_1Bmain/v/dense_2/biasBmain/v/dense_2/bias/AdamBmain/v/dense_2/bias/Adam_1Bmain/v/dense_2/kernelBmain/v/dense_2/kernel/AdamBmain/v/dense_2/kernel/Adam_1Btarget/pi/dense/biasBtarget/pi/dense/kernelBtarget/pi/dense_1/biasBtarget/pi/dense_1/kernelBtarget/pi/dense_2/biasBtarget/pi/dense_2/kernelBtarget/pi/dense_3/biasBtarget/pi/dense_3/kernelBtarget/q1/dense/biasBtarget/q1/dense/kernelBtarget/q1/dense_1/biasBtarget/q1/dense_1/kernelBtarget/q1/dense_2/biasBtarget/q1/dense_2/kernelBtarget/q2/dense/biasBtarget/q2/dense/kernelBtarget/q2/dense_1/biasBtarget/q2/dense_1/kernelBtarget/q2/dense_2/biasBtarget/q2/dense_2/kernelBtarget/v/dense/biasBtarget/v/dense/kernelBtarget/v/dense_1/biasBtarget/v/dense_1/kernelBtarget/v/dense_2/biasBtarget/v/dense_2/kernel*
dtype0*
_output_shapes
:q
Ν
!save_2/RestoreV2/shape_and_slicesConst*
_output_shapes
:q*χ
valueνBκqB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Λ
save_2/RestoreV2	RestoreV2save_2/Constsave_2/RestoreV2/tensor_names!save_2/RestoreV2/shape_and_slices*Ϊ
_output_shapesΗ
Δ:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*
dtypesu
s2q
’
save_2/AssignAssignVariablesave_2/RestoreV2*
_class
loc:@Variable*
_output_shapes

:@*
T0*
validate_shape(*
use_locking(
ͺ
save_2/Assign_1Assign
Variable_1save_2/RestoreV2:1*
validate_shape(*
_output_shapes

:@@*
_class
loc:@Variable_1*
T0*
use_locking(
ͺ
save_2/Assign_2Assign
Variable_2save_2/RestoreV2:2*
_output_shapes

:@@*
validate_shape(*
_class
loc:@Variable_2*
use_locking(*
T0
ͺ
save_2/Assign_3Assign
Variable_3save_2/RestoreV2:3*
T0*
_class
loc:@Variable_3*
use_locking(*
_output_shapes

:@@*
validate_shape(
ͺ
save_2/Assign_4Assign
Variable_4save_2/RestoreV2:4*
_class
loc:@Variable_4*
use_locking(*
validate_shape(*
_output_shapes

:@*
T0
«
save_2/Assign_5Assignbeta1_powersave_2/RestoreV2:5*
validate_shape(*%
_class
loc:@main/pi/dense/bias*
T0*
_output_shapes
: *
use_locking(
­
save_2/Assign_6Assignbeta1_power_1save_2/RestoreV2:6*
_output_shapes
: *
validate_shape(*
use_locking(*
T0*%
_class
loc:@main/q1/dense/bias
«
save_2/Assign_7Assignbeta2_powersave_2/RestoreV2:7*
use_locking(*
_output_shapes
: *
T0*%
_class
loc:@main/pi/dense/bias*
validate_shape(
­
save_2/Assign_8Assignbeta2_power_1save_2/RestoreV2:8*
validate_shape(*
_output_shapes
: *
T0*%
_class
loc:@main/q1/dense/bias*
use_locking(
·
save_2/Assign_9Assignmain/pi/dense/biassave_2/RestoreV2:9*
validate_shape(*
T0*
use_locking(*
_output_shapes	
:*%
_class
loc:@main/pi/dense/bias
Ύ
save_2/Assign_10Assignmain/pi/dense/bias/Adamsave_2/RestoreV2:10*
validate_shape(*%
_class
loc:@main/pi/dense/bias*
_output_shapes	
:*
use_locking(*
T0
ΐ
save_2/Assign_11Assignmain/pi/dense/bias/Adam_1save_2/RestoreV2:11*%
_class
loc:@main/pi/dense/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:
Α
save_2/Assign_12Assignmain/pi/dense/kernelsave_2/RestoreV2:12*
_output_shapes
:	6*
use_locking(*
T0*
validate_shape(*'
_class
loc:@main/pi/dense/kernel
Ζ
save_2/Assign_13Assignmain/pi/dense/kernel/Adamsave_2/RestoreV2:13*
T0*
validate_shape(*
use_locking(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6
Θ
save_2/Assign_14Assignmain/pi/dense/kernel/Adam_1save_2/RestoreV2:14*
T0*
validate_shape(*'
_class
loc:@main/pi/dense/kernel*
_output_shapes
:	6*
use_locking(
½
save_2/Assign_15Assignmain/pi/dense_1/biassave_2/RestoreV2:15*
_output_shapes	
:¬*
T0*'
_class
loc:@main/pi/dense_1/bias*
use_locking(*
validate_shape(
Β
save_2/Assign_16Assignmain/pi/dense_1/bias/Adamsave_2/RestoreV2:16*
_output_shapes	
:¬*
use_locking(*'
_class
loc:@main/pi/dense_1/bias*
validate_shape(*
T0
Δ
save_2/Assign_17Assignmain/pi/dense_1/bias/Adam_1save_2/RestoreV2:17*'
_class
loc:@main/pi/dense_1/bias*
use_locking(*
T0*
_output_shapes	
:¬*
validate_shape(
Ζ
save_2/Assign_18Assignmain/pi/dense_1/kernelsave_2/RestoreV2:18*
T0*)
_class
loc:@main/pi/dense_1/kernel*
validate_shape(* 
_output_shapes
:
¬*
use_locking(
Λ
save_2/Assign_19Assignmain/pi/dense_1/kernel/Adamsave_2/RestoreV2:19*
T0*
use_locking(* 
_output_shapes
:
¬*
validate_shape(*)
_class
loc:@main/pi/dense_1/kernel
Ν
save_2/Assign_20Assignmain/pi/dense_1/kernel/Adam_1save_2/RestoreV2:20*)
_class
loc:@main/pi/dense_1/kernel* 
_output_shapes
:
¬*
use_locking(*
validate_shape(*
T0
Ό
save_2/Assign_21Assignmain/pi/dense_2/biassave_2/RestoreV2:21*'
_class
loc:@main/pi/dense_2/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes
:
Α
save_2/Assign_22Assignmain/pi/dense_2/bias/Adamsave_2/RestoreV2:22*'
_class
loc:@main/pi/dense_2/bias*
_output_shapes
:*
T0*
validate_shape(*
use_locking(
Γ
save_2/Assign_23Assignmain/pi/dense_2/bias/Adam_1save_2/RestoreV2:23*
_output_shapes
:*
T0*
validate_shape(*'
_class
loc:@main/pi/dense_2/bias*
use_locking(
Ε
save_2/Assign_24Assignmain/pi/dense_2/kernelsave_2/RestoreV2:24*
T0*
_output_shapes
:	¬*
use_locking(*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(
Κ
save_2/Assign_25Assignmain/pi/dense_2/kernel/Adamsave_2/RestoreV2:25*
use_locking(*
validate_shape(*
_output_shapes
:	¬*)
_class
loc:@main/pi/dense_2/kernel*
T0
Μ
save_2/Assign_26Assignmain/pi/dense_2/kernel/Adam_1save_2/RestoreV2:26*)
_class
loc:@main/pi/dense_2/kernel*
validate_shape(*
T0*
_output_shapes
:	¬*
use_locking(
Ό
save_2/Assign_27Assignmain/pi/dense_3/biassave_2/RestoreV2:27*
_output_shapes
:*
T0*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(*
use_locking(
Α
save_2/Assign_28Assignmain/pi/dense_3/bias/Adamsave_2/RestoreV2:28*
_output_shapes
:*
validate_shape(*
T0*'
_class
loc:@main/pi/dense_3/bias*
use_locking(
Γ
save_2/Assign_29Assignmain/pi/dense_3/bias/Adam_1save_2/RestoreV2:29*
_output_shapes
:*'
_class
loc:@main/pi/dense_3/bias*
validate_shape(*
use_locking(*
T0
Ε
save_2/Assign_30Assignmain/pi/dense_3/kernelsave_2/RestoreV2:30*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
T0*
use_locking(*
validate_shape(
Κ
save_2/Assign_31Assignmain/pi/dense_3/kernel/Adamsave_2/RestoreV2:31*)
_class
loc:@main/pi/dense_3/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(*
T0
Μ
save_2/Assign_32Assignmain/pi/dense_3/kernel/Adam_1save_2/RestoreV2:32*
validate_shape(*
use_locking(*)
_class
loc:@main/pi/dense_3/kernel*
T0*
_output_shapes
:	¬
Ή
save_2/Assign_33Assignmain/q1/dense/biassave_2/RestoreV2:33*
use_locking(*%
_class
loc:@main/q1/dense/bias*
T0*
validate_shape(*
_output_shapes	
:
Ύ
save_2/Assign_34Assignmain/q1/dense/bias/Adamsave_2/RestoreV2:34*
T0*
use_locking(*
validate_shape(*
_output_shapes	
:*%
_class
loc:@main/q1/dense/bias
ΐ
save_2/Assign_35Assignmain/q1/dense/bias/Adam_1save_2/RestoreV2:35*
validate_shape(*%
_class
loc:@main/q1/dense/bias*
T0*
_output_shapes	
:*
use_locking(
Α
save_2/Assign_36Assignmain/q1/dense/kernelsave_2/RestoreV2:36*
validate_shape(*'
_class
loc:@main/q1/dense/kernel*
use_locking(*
T0*
_output_shapes
:	B
Ζ
save_2/Assign_37Assignmain/q1/dense/kernel/Adamsave_2/RestoreV2:37*
validate_shape(*'
_class
loc:@main/q1/dense/kernel*
T0*
_output_shapes
:	B*
use_locking(
Θ
save_2/Assign_38Assignmain/q1/dense/kernel/Adam_1save_2/RestoreV2:38*'
_class
loc:@main/q1/dense/kernel*
_output_shapes
:	B*
use_locking(*
validate_shape(*
T0
½
save_2/Assign_39Assignmain/q1/dense_1/biassave_2/RestoreV2:39*
T0*
use_locking(*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias*
validate_shape(
Β
save_2/Assign_40Assignmain/q1/dense_1/bias/Adamsave_2/RestoreV2:40*
T0*
use_locking(*'
_class
loc:@main/q1/dense_1/bias*
validate_shape(*
_output_shapes	
:¬
Δ
save_2/Assign_41Assignmain/q1/dense_1/bias/Adam_1save_2/RestoreV2:41*
validate_shape(*
T0*
use_locking(*
_output_shapes	
:¬*'
_class
loc:@main/q1/dense_1/bias
Ζ
save_2/Assign_42Assignmain/q1/dense_1/kernelsave_2/RestoreV2:42* 
_output_shapes
:
¬*
validate_shape(*
use_locking(*)
_class
loc:@main/q1/dense_1/kernel*
T0
Λ
save_2/Assign_43Assignmain/q1/dense_1/kernel/Adamsave_2/RestoreV2:43* 
_output_shapes
:
¬*
T0*
validate_shape(*)
_class
loc:@main/q1/dense_1/kernel*
use_locking(
Ν
save_2/Assign_44Assignmain/q1/dense_1/kernel/Adam_1save_2/RestoreV2:44*)
_class
loc:@main/q1/dense_1/kernel*
T0*
validate_shape(*
use_locking(* 
_output_shapes
:
¬
Ό
save_2/Assign_45Assignmain/q1/dense_2/biassave_2/RestoreV2:45*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
validate_shape(*
T0*
use_locking(
Α
save_2/Assign_46Assignmain/q1/dense_2/bias/Adamsave_2/RestoreV2:46*
use_locking(*
T0*
validate_shape(*'
_class
loc:@main/q1/dense_2/bias*
_output_shapes
:
Γ
save_2/Assign_47Assignmain/q1/dense_2/bias/Adam_1save_2/RestoreV2:47*
use_locking(*
_output_shapes
:*'
_class
loc:@main/q1/dense_2/bias*
T0*
validate_shape(
Ε
save_2/Assign_48Assignmain/q1/dense_2/kernelsave_2/RestoreV2:48*
_output_shapes
:	¬*
validate_shape(*)
_class
loc:@main/q1/dense_2/kernel*
T0*
use_locking(
Κ
save_2/Assign_49Assignmain/q1/dense_2/kernel/Adamsave_2/RestoreV2:49*)
_class
loc:@main/q1/dense_2/kernel*
validate_shape(*
T0*
use_locking(*
_output_shapes
:	¬
Μ
save_2/Assign_50Assignmain/q1/dense_2/kernel/Adam_1save_2/RestoreV2:50*)
_class
loc:@main/q1/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
validate_shape(*
T0
Ή
save_2/Assign_51Assignmain/q2/dense/biassave_2/RestoreV2:51*
validate_shape(*
use_locking(*
_output_shapes	
:*
T0*%
_class
loc:@main/q2/dense/bias
Ύ
save_2/Assign_52Assignmain/q2/dense/bias/Adamsave_2/RestoreV2:52*
_output_shapes	
:*
use_locking(*
T0*%
_class
loc:@main/q2/dense/bias*
validate_shape(
ΐ
save_2/Assign_53Assignmain/q2/dense/bias/Adam_1save_2/RestoreV2:53*
use_locking(*
_output_shapes	
:*%
_class
loc:@main/q2/dense/bias*
T0*
validate_shape(
Α
save_2/Assign_54Assignmain/q2/dense/kernelsave_2/RestoreV2:54*
T0*
validate_shape(*
_output_shapes
:	B*'
_class
loc:@main/q2/dense/kernel*
use_locking(
Ζ
save_2/Assign_55Assignmain/q2/dense/kernel/Adamsave_2/RestoreV2:55*'
_class
loc:@main/q2/dense/kernel*
use_locking(*
_output_shapes
:	B*
validate_shape(*
T0
Θ
save_2/Assign_56Assignmain/q2/dense/kernel/Adam_1save_2/RestoreV2:56*'
_class
loc:@main/q2/dense/kernel*
use_locking(*
validate_shape(*
_output_shapes
:	B*
T0
½
save_2/Assign_57Assignmain/q2/dense_1/biassave_2/RestoreV2:57*'
_class
loc:@main/q2/dense_1/bias*
_output_shapes	
:¬*
validate_shape(*
use_locking(*
T0
Β
save_2/Assign_58Assignmain/q2/dense_1/bias/Adamsave_2/RestoreV2:58*'
_class
loc:@main/q2/dense_1/bias*
validate_shape(*
use_locking(*
_output_shapes	
:¬*
T0
Δ
save_2/Assign_59Assignmain/q2/dense_1/bias/Adam_1save_2/RestoreV2:59*'
_class
loc:@main/q2/dense_1/bias*
T0*
validate_shape(*
use_locking(*
_output_shapes	
:¬
Ζ
save_2/Assign_60Assignmain/q2/dense_1/kernelsave_2/RestoreV2:60*
validate_shape(*
use_locking(*)
_class
loc:@main/q2/dense_1/kernel* 
_output_shapes
:
¬*
T0
Λ
save_2/Assign_61Assignmain/q2/dense_1/kernel/Adamsave_2/RestoreV2:61* 
_output_shapes
:
¬*)
_class
loc:@main/q2/dense_1/kernel*
T0*
validate_shape(*
use_locking(
Ν
save_2/Assign_62Assignmain/q2/dense_1/kernel/Adam_1save_2/RestoreV2:62*)
_class
loc:@main/q2/dense_1/kernel*
T0*
use_locking(*
validate_shape(* 
_output_shapes
:
¬
Ό
save_2/Assign_63Assignmain/q2/dense_2/biassave_2/RestoreV2:63*
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias*
T0*
use_locking(*
validate_shape(
Α
save_2/Assign_64Assignmain/q2/dense_2/bias/Adamsave_2/RestoreV2:64*
validate_shape(*
use_locking(*
T0*
_output_shapes
:*'
_class
loc:@main/q2/dense_2/bias
Γ
save_2/Assign_65Assignmain/q2/dense_2/bias/Adam_1save_2/RestoreV2:65*'
_class
loc:@main/q2/dense_2/bias*
_output_shapes
:*
use_locking(*
validate_shape(*
T0
Ε
save_2/Assign_66Assignmain/q2/dense_2/kernelsave_2/RestoreV2:66*)
_class
loc:@main/q2/dense_2/kernel*
validate_shape(*
_output_shapes
:	¬*
use_locking(*
T0
Κ
save_2/Assign_67Assignmain/q2/dense_2/kernel/Adamsave_2/RestoreV2:67*
use_locking(*)
_class
loc:@main/q2/dense_2/kernel*
_output_shapes
:	¬*
T0*
validate_shape(
Μ
save_2/Assign_68Assignmain/q2/dense_2/kernel/Adam_1save_2/RestoreV2:68*
T0*
validate_shape(*)
_class
loc:@main/q2/dense_2/kernel*
use_locking(*
_output_shapes
:	¬
·
save_2/Assign_69Assignmain/v/dense/biassave_2/RestoreV2:69*$
_class
loc:@main/v/dense/bias*
use_locking(*
T0*
_output_shapes	
:*
validate_shape(
Ό
save_2/Assign_70Assignmain/v/dense/bias/Adamsave_2/RestoreV2:70*
validate_shape(*
_output_shapes	
:*$
_class
loc:@main/v/dense/bias*
T0*
use_locking(
Ύ
save_2/Assign_71Assignmain/v/dense/bias/Adam_1save_2/RestoreV2:71*$
_class
loc:@main/v/dense/bias*
validate_shape(*
use_locking(*
_output_shapes	
:*
T0
Ώ
save_2/Assign_72Assignmain/v/dense/kernelsave_2/RestoreV2:72*
validate_shape(*&
_class
loc:@main/v/dense/kernel*
use_locking(*
T0*
_output_shapes
:	6
Δ
save_2/Assign_73Assignmain/v/dense/kernel/Adamsave_2/RestoreV2:73*
validate_shape(*&
_class
loc:@main/v/dense/kernel*
use_locking(*
T0*
_output_shapes
:	6
Ζ
save_2/Assign_74Assignmain/v/dense/kernel/Adam_1save_2/RestoreV2:74*
validate_shape(*
_output_shapes
:	6*&
_class
loc:@main/v/dense/kernel*
use_locking(*
T0
»
save_2/Assign_75Assignmain/v/dense_1/biassave_2/RestoreV2:75*
use_locking(*
T0*
validate_shape(*&
_class
loc:@main/v/dense_1/bias*
_output_shapes	
:¬
ΐ
save_2/Assign_76Assignmain/v/dense_1/bias/Adamsave_2/RestoreV2:76*
use_locking(*
T0*
_output_shapes	
:¬*
validate_shape(*&
_class
loc:@main/v/dense_1/bias
Β
save_2/Assign_77Assignmain/v/dense_1/bias/Adam_1save_2/RestoreV2:77*
use_locking(*
_output_shapes	
:¬*
validate_shape(*&
_class
loc:@main/v/dense_1/bias*
T0
Δ
save_2/Assign_78Assignmain/v/dense_1/kernelsave_2/RestoreV2:78*
T0*
use_locking(* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
validate_shape(
Ι
save_2/Assign_79Assignmain/v/dense_1/kernel/Adamsave_2/RestoreV2:79*
use_locking(* 
_output_shapes
:
¬*(
_class
loc:@main/v/dense_1/kernel*
T0*
validate_shape(
Λ
save_2/Assign_80Assignmain/v/dense_1/kernel/Adam_1save_2/RestoreV2:80*(
_class
loc:@main/v/dense_1/kernel*
use_locking(*
validate_shape(* 
_output_shapes
:
¬*
T0
Ί
save_2/Assign_81Assignmain/v/dense_2/biassave_2/RestoreV2:81*
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
T0*
validate_shape(
Ώ
save_2/Assign_82Assignmain/v/dense_2/bias/Adamsave_2/RestoreV2:82*&
_class
loc:@main/v/dense_2/bias*
use_locking(*
T0*
_output_shapes
:*
validate_shape(
Α
save_2/Assign_83Assignmain/v/dense_2/bias/Adam_1save_2/RestoreV2:83*
validate_shape(*
use_locking(*
T0*
_output_shapes
:*&
_class
loc:@main/v/dense_2/bias
Γ
save_2/Assign_84Assignmain/v/dense_2/kernelsave_2/RestoreV2:84*
_output_shapes
:	¬*
use_locking(*
validate_shape(*
T0*(
_class
loc:@main/v/dense_2/kernel
Θ
save_2/Assign_85Assignmain/v/dense_2/kernel/Adamsave_2/RestoreV2:85*
validate_shape(*(
_class
loc:@main/v/dense_2/kernel*
use_locking(*
_output_shapes
:	¬*
T0
Κ
save_2/Assign_86Assignmain/v/dense_2/kernel/Adam_1save_2/RestoreV2:86*
_output_shapes
:	¬*(
_class
loc:@main/v/dense_2/kernel*
validate_shape(*
use_locking(*
T0
½
save_2/Assign_87Assigntarget/pi/dense/biassave_2/RestoreV2:87*'
_class
loc:@target/pi/dense/bias*
_output_shapes	
:*
T0*
use_locking(*
validate_shape(
Ε
save_2/Assign_88Assigntarget/pi/dense/kernelsave_2/RestoreV2:88*
use_locking(*
T0*)
_class
loc:@target/pi/dense/kernel*
_output_shapes
:	6*
validate_shape(
Α
save_2/Assign_89Assigntarget/pi/dense_1/biassave_2/RestoreV2:89*)
_class
loc:@target/pi/dense_1/bias*
_output_shapes	
:¬*
use_locking(*
validate_shape(*
T0
Κ
save_2/Assign_90Assigntarget/pi/dense_1/kernelsave_2/RestoreV2:90*
use_locking(*
validate_shape(*
T0* 
_output_shapes
:
¬*+
_class!
loc:@target/pi/dense_1/kernel
ΐ
save_2/Assign_91Assigntarget/pi/dense_2/biassave_2/RestoreV2:91*
_output_shapes
:*
T0*
validate_shape(*
use_locking(*)
_class
loc:@target/pi/dense_2/bias
Ι
save_2/Assign_92Assigntarget/pi/dense_2/kernelsave_2/RestoreV2:92*
validate_shape(*
use_locking(*+
_class!
loc:@target/pi/dense_2/kernel*
_output_shapes
:	¬*
T0
ΐ
save_2/Assign_93Assigntarget/pi/dense_3/biassave_2/RestoreV2:93*
use_locking(*
_output_shapes
:*)
_class
loc:@target/pi/dense_3/bias*
T0*
validate_shape(
Ι
save_2/Assign_94Assigntarget/pi/dense_3/kernelsave_2/RestoreV2:94*+
_class!
loc:@target/pi/dense_3/kernel*
T0*
use_locking(*
validate_shape(*
_output_shapes
:	¬
½
save_2/Assign_95Assigntarget/q1/dense/biassave_2/RestoreV2:95*
validate_shape(*
_output_shapes	
:*'
_class
loc:@target/q1/dense/bias*
T0*
use_locking(
Ε
save_2/Assign_96Assigntarget/q1/dense/kernelsave_2/RestoreV2:96*
validate_shape(*
_output_shapes
:	B*
T0*)
_class
loc:@target/q1/dense/kernel*
use_locking(
Α
save_2/Assign_97Assigntarget/q1/dense_1/biassave_2/RestoreV2:97*
use_locking(*
T0*
validate_shape(*
_output_shapes	
:¬*)
_class
loc:@target/q1/dense_1/bias
Κ
save_2/Assign_98Assigntarget/q1/dense_1/kernelsave_2/RestoreV2:98* 
_output_shapes
:
¬*+
_class!
loc:@target/q1/dense_1/kernel*
T0*
use_locking(*
validate_shape(
ΐ
save_2/Assign_99Assigntarget/q1/dense_2/biassave_2/RestoreV2:99*)
_class
loc:@target/q1/dense_2/bias*
validate_shape(*
use_locking(*
_output_shapes
:*
T0
Λ
save_2/Assign_100Assigntarget/q1/dense_2/kernelsave_2/RestoreV2:100*
validate_shape(*
_output_shapes
:	¬*+
_class!
loc:@target/q1/dense_2/kernel*
use_locking(*
T0
Ώ
save_2/Assign_101Assigntarget/q2/dense/biassave_2/RestoreV2:101*
_output_shapes	
:*
validate_shape(*'
_class
loc:@target/q2/dense/bias*
T0*
use_locking(
Η
save_2/Assign_102Assigntarget/q2/dense/kernelsave_2/RestoreV2:102*
use_locking(*
_output_shapes
:	B*
T0*)
_class
loc:@target/q2/dense/kernel*
validate_shape(
Γ
save_2/Assign_103Assigntarget/q2/dense_1/biassave_2/RestoreV2:103*
T0*
_output_shapes	
:¬*)
_class
loc:@target/q2/dense_1/bias*
use_locking(*
validate_shape(
Μ
save_2/Assign_104Assigntarget/q2/dense_1/kernelsave_2/RestoreV2:104*
validate_shape(*
use_locking(*+
_class!
loc:@target/q2/dense_1/kernel*
T0* 
_output_shapes
:
¬
Β
save_2/Assign_105Assigntarget/q2/dense_2/biassave_2/RestoreV2:105*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*)
_class
loc:@target/q2/dense_2/bias
Λ
save_2/Assign_106Assigntarget/q2/dense_2/kernelsave_2/RestoreV2:106*
_output_shapes
:	¬*
use_locking(*
validate_shape(*+
_class!
loc:@target/q2/dense_2/kernel*
T0
½
save_2/Assign_107Assigntarget/v/dense/biassave_2/RestoreV2:107*
_output_shapes	
:*
T0*
validate_shape(*&
_class
loc:@target/v/dense/bias*
use_locking(
Ε
save_2/Assign_108Assigntarget/v/dense/kernelsave_2/RestoreV2:108*
validate_shape(*
use_locking(*(
_class
loc:@target/v/dense/kernel*
_output_shapes
:	6*
T0
Α
save_2/Assign_109Assigntarget/v/dense_1/biassave_2/RestoreV2:109*(
_class
loc:@target/v/dense_1/bias*
T0*
use_locking(*
validate_shape(*
_output_shapes	
:¬
Κ
save_2/Assign_110Assigntarget/v/dense_1/kernelsave_2/RestoreV2:110*
validate_shape(*
T0*
use_locking(* 
_output_shapes
:
¬**
_class 
loc:@target/v/dense_1/kernel
ΐ
save_2/Assign_111Assigntarget/v/dense_2/biassave_2/RestoreV2:111*
_output_shapes
:*
T0*(
_class
loc:@target/v/dense_2/bias*
validate_shape(*
use_locking(
Ι
save_2/Assign_112Assigntarget/v/dense_2/kernelsave_2/RestoreV2:112**
_class 
loc:@target/v/dense_2/kernel*
_output_shapes
:	¬*
validate_shape(*
use_locking(*
T0

save_2/restore_shardNoOp^save_2/Assign^save_2/Assign_1^save_2/Assign_10^save_2/Assign_100^save_2/Assign_101^save_2/Assign_102^save_2/Assign_103^save_2/Assign_104^save_2/Assign_105^save_2/Assign_106^save_2/Assign_107^save_2/Assign_108^save_2/Assign_109^save_2/Assign_11^save_2/Assign_110^save_2/Assign_111^save_2/Assign_112^save_2/Assign_12^save_2/Assign_13^save_2/Assign_14^save_2/Assign_15^save_2/Assign_16^save_2/Assign_17^save_2/Assign_18^save_2/Assign_19^save_2/Assign_2^save_2/Assign_20^save_2/Assign_21^save_2/Assign_22^save_2/Assign_23^save_2/Assign_24^save_2/Assign_25^save_2/Assign_26^save_2/Assign_27^save_2/Assign_28^save_2/Assign_29^save_2/Assign_3^save_2/Assign_30^save_2/Assign_31^save_2/Assign_32^save_2/Assign_33^save_2/Assign_34^save_2/Assign_35^save_2/Assign_36^save_2/Assign_37^save_2/Assign_38^save_2/Assign_39^save_2/Assign_4^save_2/Assign_40^save_2/Assign_41^save_2/Assign_42^save_2/Assign_43^save_2/Assign_44^save_2/Assign_45^save_2/Assign_46^save_2/Assign_47^save_2/Assign_48^save_2/Assign_49^save_2/Assign_5^save_2/Assign_50^save_2/Assign_51^save_2/Assign_52^save_2/Assign_53^save_2/Assign_54^save_2/Assign_55^save_2/Assign_56^save_2/Assign_57^save_2/Assign_58^save_2/Assign_59^save_2/Assign_6^save_2/Assign_60^save_2/Assign_61^save_2/Assign_62^save_2/Assign_63^save_2/Assign_64^save_2/Assign_65^save_2/Assign_66^save_2/Assign_67^save_2/Assign_68^save_2/Assign_69^save_2/Assign_7^save_2/Assign_70^save_2/Assign_71^save_2/Assign_72^save_2/Assign_73^save_2/Assign_74^save_2/Assign_75^save_2/Assign_76^save_2/Assign_77^save_2/Assign_78^save_2/Assign_79^save_2/Assign_8^save_2/Assign_80^save_2/Assign_81^save_2/Assign_82^save_2/Assign_83^save_2/Assign_84^save_2/Assign_85^save_2/Assign_86^save_2/Assign_87^save_2/Assign_88^save_2/Assign_89^save_2/Assign_9^save_2/Assign_90^save_2/Assign_91^save_2/Assign_92^save_2/Assign_93^save_2/Assign_94^save_2/Assign_95^save_2/Assign_96^save_2/Assign_97^save_2/Assign_98^save_2/Assign_99
1
save_2/restore_allNoOp^save_2/restore_shard "B
save_2/Const:0save_2/Identity:0save_2/restore_all (5 @F8";
trainable_variablesώ:ϋ:
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
target/v/dense_2/bias:0target/v/dense_2/bias/Assigntarget/v/dense_2/bias/read:02)target/v/dense_2/bias/Initializer/zeros:08"ΐ{
	variables²{―{
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
Adam_1*ΰ
serving_defaultΜ
+
a&
Placeholder_2:0?????????
+
x&
Placeholder_1:0?????????6*
q1$
main/q1/Squeeze:0?????????'
mu!

main/mul:0?????????(
v#
main/v/Squeeze:0?????????)
pi#
main/mul_1:0?????????*
q2$
main/q2/Squeeze:0?????????tensorflow/serving/predict
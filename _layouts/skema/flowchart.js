st=>start: Start|past
e=>end: End|past
op1=>inputoutput: Input|future
op2=>inputoutput: Output|future
sub1=>operation: Sub Input|current
sub2=>operation: Sub Output|current
uji1=>condition: Uji Input|rejected
uji2=>condition: Uji Output|approved
cek1=>subroutine: Cek Input|invalid
cek2=>subroutine: Cek Output|invalid

st->op1(right)->sub1
sub1(right)->uji1(yes, right)->sub2
uji1(no)->cek1(left)->sub1
sub2->uji2(yes, right)->op2
uji2(no)->cek2(left)->cek1
op2->e

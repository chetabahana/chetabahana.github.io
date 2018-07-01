st=>start: Start|past
e=>end: End|past
op1=>operation: Input|future
op2=>operation: Output|future
sub1=>subroutine: Sub Input|current
sub2=>subroutine: Sub Output|current
uji1=>condition: Uji Input|rejected
uji2=>condition: Uji Output|approved
cek1=>inputoutput: Cek Input|invalid
cek2=>inputoutput: Cek Output|invalid

st->op1(right)->sub1
sub1(right)->uji1(yes, right)->sub2
uji1(no)->cek1(left)->sub1
sub2->uji2(yes, right)->op2
uji2(no)->cek2(left)->cek1
op2->e

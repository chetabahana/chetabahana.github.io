st=>start: Start|past
e=>end: End|past
op1=>operation: Input|future
op2=>operation: Output|future
sub1=>subroutine: Sub Input|current
sub2=>subroutine: Sub Output|current
uji1=>condition: Uji Input|rejected
uji2=>condition: Uji Output|approved
io1=>inputoutput: Fix Input|invalid
io2=>inputoutput: Fix Output|invalid

st->op1(right)->sub1
sub1(right)->uji1(yes, right)->sub2
uji1(no)->io1(left)->sub1
sub2->uji2(yes, right)->op2
uji2(no)->io2(left)->io1
op2->e

st=>start: Start|past
e=>end: End|past
op1=>operation: Input|future
op2=>operation: Output|future
io1=>inputoutput: Fix Input|current
io2=>inputoutput: Fix Output|current
uji1=>condition: Uji Input|rejected
uji2=>condition: Uji Output|approved
sub1=>subroutine: Sub Input|invalid
sub2=>subroutine: Sub Output|invalid

st->op1(right)->io1
io1(right)->uji1(yes, right)->io2
uji1(no)->sub1(left)->io1
io2->uji2(yes, right)->op2
uji2(no)->sub2(left)->sub1
op2->e

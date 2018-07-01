st=>start: Start|past
e=>end: End|past
io1=>inputoutput: Input|future
io2=>inputoutput: Output|future
op1=>operation: Trim Input|current
op2=>operation: Trim Output|current
uji1=>condition: Uji Input|rejected
uji2=>condition: Uji Output|approved
sub1=>subroutine: Sub Input|invalid
sub2=>subroutine: Sub Output|invalid

st->io1(right)->op1
op1(right)->uji1(yes, right)->op2
uji1(no)->sub1(left)->op1
op2->uji2(yes, right)->io2
uji2(no)->sub2(left)->sub1
io2->e

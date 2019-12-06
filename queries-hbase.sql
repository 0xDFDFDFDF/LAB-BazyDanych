create 'YOURNAME', 'cf1'
describe 'YOURNAME'
exists 'YOURNAME'

disable 'YOURNAME'
drop 'YOURNAME'
exists 'YOURNAME'	

create 'YOURNAME', 'summary', 'reviewer', 'details'	

describe 'YOURNAME'	

disable 'YOURNAME'

alter 'YOURNAME', {NAME => 'summary', IN_MEMORY => 'true'}
alter 'YOURNAME', {NAME => 'summary', VERSIONS => 2}, {NAME => 'reviewer', VERSIONS => 2}

describe 'YOURNAME'
enable 'YOURNAME'	

put 'YOURNAME', '101', 'summary:product', 'hat'
get 'YOURNAME', '101'

put 'YOURNAME', '101', 'summary:rating', '5'
put 'YOURNAME', '101', 'reviewer:name','Chris'
put 'YOURNAME', '101', 'details:comment', 'Great value'
get 'YOURNAME', '101'

count 'YOURNAME'	

put 'YOURNAME', '112', 'summary:product', 'vest'
put 'YOURNAME', '112', 'summary:rating', '5'
put 'YOURNAME', '112', 'reviewer:name', 'Tina'
put 'YOURNAME', '133', 'summary:product', 'vest'
put 'YOURNAME', '133', 'summary:rating', '4'
put 'YOURNAME', '133', 'reviewer:name', 'Helen'
put 'YOURNAME', '133', 'reviewer:location', 'USA'
put 'YOURNAME', '133', 'details:tip', 'Sizes run small. Order 1 size up.'

scan 'YOURNAME'

scan 'YOURNAME', {COLUMNS => ['summary', 'reviewer:name'], STARTROW => '120', STOPROW => '150'}	

put 'YOURNAME', '112', 'summary:rating', '4'	

scan 'YOURNAME', {VERSIONS => 2}

get 'YOURNAME', '112', {COLUMN => 'summary:rating', TIMESTAMP => 1421333110925}	

delete 'YOURNAME', '112', 'reviewer:name'	

deleteall 'YOURNAME', '112'
scan 'YOURNAME'	

disable 'YOURNAME'
drop 'YOURNAME'
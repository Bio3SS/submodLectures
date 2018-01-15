use strict;
use 5.10.0;

$/ = "";

while (<>){
	## Call everything NEWPOLL until we've updated it
	## There's a make rule for this change
	next unless s/^\s*NEWPOLL\b\s*//;
	chomp;

	## Optionally have a pipe separating the lecture question from the everywhere question
	s/.*[|]//;
	my ($ques, $choices) = /(.*?[.?])(.*)/;
	# say "Ques: $ques";
	# say "Choice: $choices";

	my @choices = split /;\s*/, $choices;
	# @choices = map {s/.*/"$&"/} @choices;
	print "Poll, ";
	if (@choices>1){
		print "Multiple choice, ";
	} else {
		print "Open-ended, ";
	}
	# print '"' . $ques . '", ';
	print $ques . ', ';
	say join ", ", @choices;
}

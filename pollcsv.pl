use strict;
use 5.10.0;

$/ = "";

while (<>){
	next unless s/^\s*NEWPOLL\s*//;
	chomp;

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
	print '"' . $ques . '", ';
	say join ", ", @choices;
}

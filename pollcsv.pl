use strict;
use 5.10.0;

$/ = "";

while (<>){
	## Call everything NEWPOLL until we've updated it
	## Change back to NEWPOLL each year using make %.pollnew
	next unless s/^\s*NEWPOLL\b\s*//;
	chomp;

	## Optionally have a pipe separating the lecture question from the everywhere question
	## 2018 Mar 01 (Thu) Experimenting with ? divider as well. Why not?
	## ? Only works if there are two of them. 
	## Don't have two ?s and also a |
	s/.*[|]//s;
	s/.*[?]\s*(.*[?])/$1/s;
	s/\s*\n\s*/ /g;
	my ($ques, $choices) = /(.*?[.?:])(.*)/;
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

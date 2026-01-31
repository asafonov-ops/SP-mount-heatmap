#!/usr/bin/perl

use Time::Local;
# my $time = timelocal($sec,$min,$hours,$day,$month,$year);
my $rt=$ARGV[0];
while (<STDIN>) {
# if ($_ =~ /(_hpss|_tsm)/g) {
if ($_ =~ /$rt/g) {
	# print $_;
	# 2024-02-19 11:01:10.000000,2024-02-19 11:08:22.000000,OC0492,DRIVELT15-(/dev/rmt29)
	#
	# my ($date,$volser,$frame,$drive,$loglib,$eaddr,$mediawrite,$mediaread,$hostwrite,$hostread,$drive_residency)=split(",",$_);
my ($datem,$dated,$volser,$drive)=split(",",$_);
# print $date," ",$eaddr," ",$drive_residency,"\n";
# 2023 10 15 18:52
	if ($datem =~ m/(\d\d\d\d)-(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d)\.(000000)/g)   {
		$year=$1;
		$month=$2;
		$day=$3;
		$hour=$4;
		$min=$5;
		$sec=$6;
		# print $year, " ",$month," ",$day," ",$hour,":",$min,":",$sec,"\n";
		$timem = timelocal($sec,$min,$hour,$day,$month-1,$year);
		# 		print ($time-($drive_residency*60)),":",$time,":",$volser,":","DRIVE",$loglib,"_",$eaddr,"\n";
		# print $timem+(3600*4),"\n";
	}
	if ($dated =~ m/(\d\d\d\d)-(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d)\.(000000)/g)   {
		$year=$1;
		$month=$2;
		$day=$3;
		$hour=$4;
		$min=$5;
		$sec=$6;
		# print $year, " ",$month," ",$day," ",$hour,":",$min,":",$sec,"\n";
		$timed = timelocal($sec,$min,$hour,$day,$month-1,$year);
		# print $timed+(3600*4),"\n";
	}
		print $timem,":",$timed,":",$volser,":",$drive;
}
}

# SP-mount-heatmap
Perl/R code to generate tape drive utilization heatmap 

To install R:

sudo apt install r-base-core
R modules installation:
install.packages("ggplot2")
install.packages("reshape2")
install.packages("plyr")
install.packages("scales")

- Extract Tape Mount entries from Storage Protect SUMMARY table in CSV format:
  damadmc -id=... -pa=... -dataonly-yes -comma "select * from summary where activity='TAPE MOUNT'" > summary_mount.csv
- Prepare data for heatmap generation
  cat summary.csv | awk -F',' '{ print $1","$2","$21","$22}' | ./parse_SP_summary_csv.pl | awk '{ print $1 }' > normalized.csv
  cat normalized.csv | awk -F ':' '{ print $4 }' | sort -u > drives.unique
  heatmap_minute.pl normalized.csv > heatmap.csv
  - Generate heatmap in PDF format
  Rscript ./heatmap_mc.R  heatmap.csv heatmap.pdf

top -bn1 | grep "Cpu(s)" | awk '{print "Total CPU usage:", 100 - $8"%"}'
echo "\nTotal memory usage:"
free -m | awk 'NR==2 {free=$4; used=$3; total=$2; usage=used / total * 100;printf "Used: %d MB | Free: %d MB | Total: %d MB | Usage: %.2f%%\n", used, free, total, usage}'
echo "\nTotal disk usage:"
df -BG --total | grep "total" | awk '{total=$2; used=$3; available=$4; use=$5;print "Free: " available "GB | Used: " used "GB | Total: " total "GB | Used%: " use}'
echo "\nTop 5 processes by CPU usage:"
ps -e -o pid,comm,%cpu --sort=-%cpu | head -n 6
echo "\nTop 5 processes by memory usage:"
ps -e -o pid,comm,%mem --sort=-%mem | head -n 6
every :day, at: "2:00am" do
  rake "delete_old_exam"
end

every "0 0 28-31 * * [ $(date -d +1day +\\%d) -eq 1 ] &&" do
  rake "delete_old_exam"
end

desc "Remove old exam not start"
task delete_old_exam: :environment do
  Exam.old_exam.destroy_all
end

use QuanLySinhVien;

#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM Subject
WHERE credit =
      (SELECT MAX(credit) FROM Subject)
;

# #Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT subject.*
FROM subject JOIN mark on subject.subID = mark.subID
WHERE mark >= ALL
      (SELECT mark FROM mark)
;

 #Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT student.*, AVG(mark) AS `Diem TB`
FROM student JOIN mark ON student.studentId = mark.studentId
GROUP BY student.studentId
ORDER BY `Diem TB` DESC;
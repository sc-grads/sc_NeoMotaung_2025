namespace LINQ2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            UniManager um = new UniManager();
            //um.MaleStudents();

            um.studentUniPair();
        }

        public static void oddNumbers(int[] nums)
        {
            Console.WriteLine("Even numbers: ");
            IEnumerable<int> evenNumbers = from num in nums where num % 2 == 0
                                           select num;
            foreach (var n in evenNumbers)
            {
                Console.WriteLine(n);
            }
        }
    }

    class UniManager
    {
        public List<University> Universities { get; set; }
        public List<Student> Students { get; set; }
        public UniManager()
        {
            Universities = new List<University>();
            Students = new List<Student>();

            Universities.Add(new University { Id = 1, Name = "Harvard" });
            Universities.Add(new University { Id = 2, Name = "MIT" });

            Students.Add(new Student { Id = 1, Name = "Alice", Gender = "Female", Age = 22, UniversityId = 1 });
            Students.Add(new Student { Id = 2, Name = "Bob", Gender = "Male", Age = 24, UniversityId = 2 });
            Students.Add(new Student { Id = 3, Name = "Charlie", Gender = "Male", Age = 23, UniversityId = 1 });
            Students.Add(new Student { Id = 4, Name = "Diana", Gender = "Female", Age = 21, UniversityId = 2 });
            Students.Add(new Student { Id = 5, Name = "Dean", Gender = "Trans-gender", Age = 25, UniversityId = 2 });
        }

        public void MaleStudents()
        {
            IEnumerable<Student> maleStudents = from student in Students where student.Gender == "Male" select student;
            Console.WriteLine("The Male students are: ");
            foreach (var student in maleStudents)
            {
                student.Print();
            }
        }

        public void FemaleStudents()
        {
            IEnumerable<Student> maleStudents = from student in Students where student.Gender == "Female" select student;
            Console.WriteLine("The Female students are: ");
            foreach (var student in maleStudents)
            {
                student.Print();
            }
        }

        public void sortedStudents()
        {
            IEnumerable<Student> sortedStudents = from student in Students orderby student.Age select student;
            Console.WriteLine("The students in order of age: ");
            foreach (var student in sortedStudents)
            {
                student.Print();
            }
        }

        public void studentsFromHarvard()
        {
            var studentsFromHarvard = from student in Students
                                      join university in Universities on student.UniversityId equals university.Id
                                      where university.Name == "Harvard"
                                      select student;
            Console.WriteLine("The students from Harvard are: ");
            foreach (var student in studentsFromHarvard)
            {
                student.Print();
            }
        }

        public void studentsFromThatUni(int UniID)
        {
            var studentsFromUni = from student in Students
                                  join university in Universities on student.UniversityId equals university.Id
                                  where university.Id == UniID
                                  select student;
            Console.WriteLine("The students from uni {0} are: ", UniID);
            foreach (var student in studentsFromUni)
            {
                student.Print();
            }
        }

        public void studentUniPair()
        {
            var newCollection = from student in Students join university in Universities on student.UniversityId equals university.Id orderby student.Name select new { StudentName = student.Name, UniversityName = university.Name };
            Console.WriteLine("Student-Uni Pair");
            foreach (var item in newCollection)
            {
                Console.WriteLine("Student {0} from University {1}", item.StudentName, item.UniversityName);
            }
        }

    }

    class University
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public void Print()
        {
            Console.WriteLine("University {0} with ID {1}", Name, Id);
        }
    }

    class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public int Age { get; set; }
        public int UniversityId { get; set; }
        public void Print()
        {
            Console.WriteLine("Student {0} with ID {1}, Gender {2} and Age {3} from University with ID {4}", Name, Id, Gender, Age, UniversityId);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LINQToSQL
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        LinqToSQLDataClassesDataContext dataContext;
        
        public MainWindow()
        {
            InitializeComponent();

            string connectionString = ConfigurationManager.ConnectionStrings["LINQToSQL.Properties.Settings.PanjutorialsDBConnectionString"].ConnectionString;
            dataContext = new LinqToSQLDataClassesDataContext(connectionString);

            //insertUniversities();
            //insertStudents();
            //insertLectures();
            //insertStudentLectureAssociates();
            // getJohnsUni();
            //getJohnLectures();
            //getStudentsfromYale();
            //updateJohn();
            deleteJane();
        }

        public void insertUniversities()
        {
            dataContext.ExecuteCommand("DELETE FROM University");

            University yale = new University();
            yale.Name = "Yale";
            dataContext.Universities.InsertOnSubmit(yale);

            University harvard = new University();
            harvard.Name = "Harvard";
            dataContext.Universities.InsertOnSubmit(harvard);

            dataContext.SubmitChanges();

            dataGrid.ItemsSource = dataContext.Universities;
        }

        public void insertStudents()
        {
            University yale = dataContext.Universities.First(u => u.Name == "Yale");
            University harvard = dataContext.Universities.First(u => u.Name == "Harvard");

            List<Student> students = new List<Student>();

            students.Add(new Student { Name = "John", Gender = "Male", University = yale });
            students.Add(new Student { Name = "Jane", Gender = "Female", University = harvard });
            students.Add(new Student { Name = "Joan", Gender = "Female", UniversityId = yale.Id });

            dataContext.Students.InsertAllOnSubmit(students);
            dataContext.SubmitChanges();

            dataGrid.ItemsSource = dataContext.Students;
        }

        public void insertLectures()
        {
            dataContext.Lectures.InsertOnSubmit(new Lecture { Name = "Mathematics" });
            dataContext.Lectures.InsertOnSubmit(new Lecture { Name = "Physics" });

            dataContext.SubmitChanges();
            dataGrid.ItemsSource = dataContext.Lectures;
        }

        public void insertStudentLectureAssociates()
        {
            Student john = dataContext.Students.First(s => s.Name == "John");
            Student jane = dataContext.Students.First(s => s.Name == "Jane");
            Student joan = dataContext.Students.First(s => s.Name == "Joan");

            Lecture mathematics = dataContext.Lectures.First(l => l.Name == "Mathematics");
            Lecture physics = dataContext.Lectures.First(l => l.Name == "Physics");

            dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = john, Lecture = mathematics });
            dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = jane, Lecture = physics });

            StudentLecture phJoan = new StudentLecture();
            phJoan.Student = joan;
            phJoan.LectureId = physics.Id;

            dataContext.StudentLectures.InsertOnSubmit(phJoan);
            dataContext.SubmitChanges();

            dataGrid.ItemsSource = dataContext.StudentLectures;
        }

        public void getJohnsUni()
        {
            Student john = dataContext.Students.First(s => s.Name == "John");
            University johnsUni = john.University;

            List<University> unis = new List<University>();
            unis.Add(johnsUni);

            dataGrid.ItemsSource = unis;
        }

        public void getJohnLectures()
        {
            Student john = dataContext.Students.First(s => s.Name == "John");

            var johnsLectures = from sl in john.StudentLectures select sl.Lecture;

            dataGrid.ItemsSource = johnsLectures;
        }

        public void getStudentsfromYale()
        {
            var studentsYale = from student in dataContext.Students where student.University.Name == "Yale" select student;
            dataGrid.ItemsSource = studentsYale;
        }

        public void updateJohn()
        {
            Student john = dataContext.Students.FirstOrDefault(s => s.Name == "John");
            john.Name = "James";

            dataContext.SubmitChanges();
            dataGrid.ItemsSource = dataContext.Students;
        }

        public void deleteJane()
        {
            Student jane = dataContext.Students.FirstOrDefault(s => s.Name == "Jane");
            dataContext.Students.DeleteOnSubmit(jane);
            dataContext.SubmitChanges();

            //If deletions arent working.

            //string connectionString = ConfigurationManager.ConnectionStrings["LINQToSQL.Properties.Settings.PanjutorialsDBConnectionString"].ConnectionString;
            //LinqToSQLDataClassesDataContext dc = new LinqToSQLDataClassesDataContext(connectionString);
            //dataGrid.ItemsSource = dc.Students;

            dataGrid.ItemsSource = dataContext.Students;
        }
    }
}

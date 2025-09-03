using System.Xml.Linq;

namespace LINQwithXML
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string studentXML = @"<Students>
                                        <Student>
                                            <Name>John Doe</Name>
                                            <Age>20</Age>
                                            <Grade>A</Grade>
                                        </Student>
                                        <Student>
                                            <Name>Jane Smith</Name>
                                            <Age>22</Age>
                                            <Grade>B</Grade>
                                        </Student>
                                        <Student>
                                            <Name>Sam Brown</Name>
                                            <Age>21</Age>
                                            <Grade>A</Grade>
                                        </Student>
                                    </Students>";
            XDocument studentxdoc = new XDocument();
            studentxdoc = XDocument.Parse(studentXML);

            var students = from student in studentxdoc.Descendants("Student")
                           select new
                           {
                               Name = student.Element("Name").Value,
                               Age = student.Element("Age").Value,
                               Grade = student.Element("Grade").Value
                           };

            var sortedStudents = from student in students
                                 orderby student.Name
                                 select student;

            foreach (var student in students)
            {
                Console.WriteLine("Name: {0}, Age: {1}, Grade: {2}", student.Name, student.Age, student.Grade);
            }
        }
    }
}

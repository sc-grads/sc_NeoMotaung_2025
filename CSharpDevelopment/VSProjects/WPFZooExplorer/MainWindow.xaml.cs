using System;
using System.Collections.Generic;
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
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WPFZooExplorer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        SqlConnection sqlConnection;
        public MainWindow()
        {
            InitializeComponent();

            string connectionString = ConfigurationManager.ConnectionStrings["WPFZooExplorer.Properties.Settings.PanjutorialsDBConnectionString"].ConnectionString;
            sqlConnection = new SqlConnection(connectionString);
            ShowZoos();
            ShowAllAnimals();
        }

        private void ShowZoos()
        {
            string query = "select * from Zoo";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, sqlConnection);

            using (sqlDataAdapter)
            {
                DataTable zooTable = new DataTable();
                sqlDataAdapter.Fill(zooTable);

                ListZoos.DisplayMemberPath = "Location";
                ListZoos.SelectedValuePath = "Id";
                ListZoos.ItemsSource = zooTable.DefaultView;
            }
        }

        private void ShowAnimals()
        {
            try
            {
                string query = "select * from Animal a inner join ZooAnimal za on a.Id = za.AnimalId where za.ZooId = @ZooId";
                SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);

                using (sqlDataAdapter)
                {
                    sqlCommand.Parameters.AddWithValue("@ZooId", ListZoos.SelectedValue);

                    DataTable animalTable = new DataTable();
                    sqlDataAdapter.Fill(animalTable);

                    ListAssociatedAnimals.DisplayMemberPath = "Name";
                    ListAssociatedAnimals.SelectedValuePath = "Id";
                    ListAssociatedAnimals.ItemsSource = animalTable.DefaultView;
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
        }

        private void ShowAllAnimals()
        {
            string query = "select * from Animal";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, sqlConnection);

            using (sqlDataAdapter)
            {
                DataTable animalTable = new DataTable();
                sqlDataAdapter.Fill(animalTable);

                ListAllAnimals.DisplayMemberPath = "Name";
                ListAllAnimals.SelectedValuePath = "Id";
                ListAllAnimals.ItemsSource = animalTable.DefaultView;
            }
        }

        private void ListZoos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //ListZoos.SelectedItem.ToString();
            ShowAnimals();
        }

        private void DeleteZoo_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string query = "delete from Zoo where Id = @ZooId";
                SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
                sqlConnection.Open();
                sqlCommand.Parameters.AddWithValue("@ZooId", ListZoos.SelectedValue);
                sqlCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                sqlConnection.Close();
                ShowZoos();
            }
        }
    }
}

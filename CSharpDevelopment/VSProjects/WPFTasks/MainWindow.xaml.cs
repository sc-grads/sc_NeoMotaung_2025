using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
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

namespace WPFTasks
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 

    

    public partial class MainWindow : Window
    {

        public static readonly DependencyProperty HtmlProperty =
        DependencyProperty.RegisterAttached("Html", typeof(string), typeof(MainWindow),
            new FrameworkPropertyMetadata(OnHtmlChanged));
        public MainWindow()
        {
            InitializeComponent();
        }

        private void myButton_Click(object sender, RoutedEventArgs e)
        {
            //Download large file on main thread
            //Pauses/freezes UI
            /*Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId}");
            HttpClient webClient = new HttpClient();
            string html = webClient.GetStringAsync("http://ipv4.download.thinkbroadband.com/200MB.zip").Result;
            myButton.Content = "Done";*/

            Task.Run(() =>
            {
                Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId}");
                HttpClient webClient = new HttpClient();
                string html = webClient.GetStringAsync("http://ipv4.download.thinkbroadband.com/200MB.zip").Result;



                //Causes an error as the main thread handles the UI
                //Hence we cannot access UI elements from a different thread
                //myButton.Content = "Done";

                //Invokes permission of the main thread to update the UI element
                myButton.Dispatcher.Invoke(() =>
                {
                    Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId}");
                    myButton.Content = "Done";
                });
            });
        }

        private async void myButton_Click2(object sender, RoutedEventArgs e)
        {
            //Download large file on main thread
            //Pauses/freezes UI
            /*Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId}");
            HttpClient webClient = new HttpClient();
            string html = webClient.GetStringAsync("http://ipv4.download.thinkbroadband.com/200MB.zip").Result;
            myButton.Content = "Done";*/

            string myHtml = "bla";

            Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId} before await");
            Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId}");
            await Task.Run(() =>
            {
                Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId} during await");
                HttpClient webClient = new HttpClient();
                string html = webClient.GetStringAsync("http://google.com").Result;
                myHtml = html;
            });
            Debug.WriteLine($"Thread Num: {Thread.CurrentThread.ManagedThreadId} after await");
            myButton.Content = "Done Downloading";
            myWebBrowser.SetValue(HtmlProperty, myHtml);
        }

        static void OnHtmlChanged(DependencyObject dependencyObject, DependencyPropertyChangedEventArgs e)
        {
            WebBrowser webBrowser = dependencyObject as WebBrowser;
            if (webBrowser != null)
            {
                webBrowser.NavigateToString(e.NewValue as string);
            }
        }
    }
}

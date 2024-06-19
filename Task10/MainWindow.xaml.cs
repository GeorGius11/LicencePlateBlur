using System;
using System.Diagnostics;
using System.IO;
using System.Windows;
using System.Windows.Input;
using Task10.Helpers;

namespace Task10
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            StartupSettings.InstallTesseract();
            InitializeComponent();
        }

        private void Collapse_Click(object sender, RoutedEventArgs e) => WindowState = WindowState.Minimized;

        private void Close_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Directory.Delete("Frames", true);
            }
            catch (Exception)
            {
            }

            Application.Current.Shutdown();
        }


        private void FullSize_Click(object sender, RoutedEventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                WindowState = WindowState.Normal;
                Debug.WriteLine(WindowState.ToString());
            }
            else
            {
                WindowState = WindowState.Maximized;
            }
        }

        private void Grid_MouseDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                var point = PointToScreen(e.MouseDevice.GetPosition(this));

                if (point.X <= RestoreBounds.Width / 2)
                {
                    Left = 0;
                }
                else if (point.X >= RestoreBounds.Width)
                {
                    Left = point.X - (RestoreBounds.Width - (this.ActualWidth - point.X));
                }
                else
                {
                    Left = point.X - (RestoreBounds.Width / 2);
                }

                Top = point.Y - (((FrameworkElement)sender).ActualHeight / 2);
                
                WindowState = WindowState.Normal;
            }

            if (e.ChangedButton == MouseButton.Left)
            {
               DragMove();
            }
        }
    }
}
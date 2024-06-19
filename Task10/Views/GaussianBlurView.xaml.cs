using System;
using System.Windows.Controls;
using Task10.ViewModels;

namespace Task10.Views
{
    /// <summary>
    /// Interaction logic for GaussianBlurView.xaml
    /// </summary>
    public partial class GaussianBlurView : UserControl
    {
        public GaussianBlurView()
        {
            InitializeComponent();
            DataContext = new GaussianBlurViewModel();
        }

        private void BlurSlider_LostMouseCapture(object sender, System.Windows.Input.MouseEventArgs e)
        {
            (DataContext as GaussianBlurViewModel).UpdateImage();
        }
    }
}

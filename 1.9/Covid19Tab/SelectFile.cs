using System.Windows.Forms;

namespace Covid19Tab
{
    public class SelectFile
    {
        public void selectFile()
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog
            {
                InitialDirectory = @"C:\Covid19Tab\1.9\Covid19Tab\baseDBF",
                Title = "Selecione um arquivo de formato CSV",

                CheckFileExists = true,
                CheckPathExists = true,

                DefaultExt = "csv",
                Filter = "arquivo csv (*.csv)|*.csv",
                FilterIndex = 2,
                RestoreDirectory = true,

                ReadOnlyChecked = true,
                ShowReadOnly = true
            };

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                Program.cPlace = openFileDialog1.FileName;                
            }
        }
    }    
}

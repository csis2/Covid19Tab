using System.IO;
using System.Threading.Tasks;

namespace Covid19Tab
{
    public class ProcedureToMP3
    // Executa um procedimento extra no caso do arquivo selecionado pelo usuário ser do tipo MP3.
    // Esse script exclui o caracter (") presente nos registros do arquivo 'temp_covid19alfa.txt'.
    {
        public void procedureToMP3()
        {
            {
                Task task4 = Task.Run(() =>
                {
                    string fileName = @"C:\Covid19Tab\1.4\Covid19Tab\tmp\temp_covid19alfa.txt";
                    File.WriteAllText(fileName, File.ReadAllText(fileName).Replace("\"", string.Empty));
                });
                task4.Wait();
            }
        }
    }
}

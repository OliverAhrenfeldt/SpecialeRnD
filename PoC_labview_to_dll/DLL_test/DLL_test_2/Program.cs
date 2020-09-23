using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;

namespace DLL_test_2
{
    class Program
    {
        // Use DllImport to import the Win32 MessageBox function.
        [DllImport("DLL_test.dll", CharSet = CharSet.Unicode)]
        public static extern double VI(double value);

        static void Main(string[] args)
        {
            double _output;
            double _startValue = 0;
            while (true)
            {
                _output = VI(_startValue);
                Console.WriteLine(_output);
                Console.WriteLine(DateTime.Now.ToLongTimeString());
                _startValue++;
            }
            // LabVIEW

            // C#
            _output = Increment(5);
            Console.WriteLine(_output);
            Console.ReadKey();
        }

        static double Increment(double input)
        {
            return input + 1;
        }
    }
}

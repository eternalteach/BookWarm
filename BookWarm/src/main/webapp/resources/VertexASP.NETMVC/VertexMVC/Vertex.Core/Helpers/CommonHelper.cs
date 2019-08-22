using System;
using System.Security.Cryptography;

namespace Vertex.Core.Helpers
{
    public static class CommonHelper
    {
        /// <summary>
        /// Returns a random number within the range <paramref name="min"/> to <paramref name="max"/> - 1.
        /// </summary>
        /// <param name="min">Minimum number</param>
        /// <param name="max">Maximum number (exclusive!).</param>
        /// <returns>Random integer number.</returns>
        public static int GenerateRandomInteger(int min = 0, int max = 2147483647)
        {
            var randomNumberBuffer = new byte[10];
            new RNGCryptoServiceProvider().GetBytes(randomNumberBuffer);
            return new Random(BitConverter.ToInt32(randomNumberBuffer, 0)).Next(min, max);
        }
    }
}
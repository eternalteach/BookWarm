using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Vertex.Core.Extensions
{
    public static class StringExtensions
    {
        public const string CarriageReturnLineFeed = "\r\n";
        public const string Empty = "";
        public const char CarriageReturn = '\r';
        public const char LineFeed = '\n';
        public const char Tab = '\t';

        private delegate void ActionLine(TextWriter textWriter, string line);


        public static string ToSentence(this string text)
        {
            if (string.IsNullOrEmpty(text))
                return string.Empty;

            return new string(text.SelectMany((c, i) => i > 0 && char.IsUpper(c) ? new[] { ' ', c } : new[] { c }).ToArray());
        }


        public static string ToUrlSlug(this string text)
        {
            if (String.IsNullOrEmpty(text))
                return null;

            text = text.Replace("ş", "s");
            text = text.Replace("Ş", "s");
            text = text.Replace("İ", "i");
            text = text.Replace("I", "i");
            text = text.Replace("ı", "i");
            text = text.Replace("ö", "o");
            text = text.Replace("Ö", "o");
            text = text.Replace("ü", "u");
            text = text.Replace("Ü", "u");
            text = text.Replace("Ç", "c");
            text = text.Replace("ç", "c");
            text = text.Replace("ğ", "g");
            text = text.Replace("Ğ", "g");
            text = text.Replace(" ", "-");
            text = text.Replace("---", "-");
            text = text.Replace("?", "");
            text = text.Replace("/", "");
            text = text.Replace(".", "");
            text = text.Replace("'", "");
            text = text.Replace("#", "");
            text = text.Replace("%", "");
            text = text.Replace("&", "");
            text = text.Replace("*", "");
            text = text.Replace("!", "");
            text = text.Replace("@", "");
            text = text.Replace("+", "");
            text = text.ToLower();
            text = text.Trim();

            // tüm harfleri küçült
            string encodedUrl = (text ?? "").ToLower();

            // & ile " " yer değiştirme
            encodedUrl = Regex.Replace(encodedUrl, @"\&+", "and");

            // " " karakterlerini silme
            encodedUrl = encodedUrl.Replace("'", "");

            // geçersiz karakterleri sil
            encodedUrl = Regex.Replace(encodedUrl, @"[^a-z0-9]", "-");

            // tekrar edenleri sil
            encodedUrl = Regex.Replace(encodedUrl, @"-+", "-");

            // karakterlerin arasına tire koy
            encodedUrl = encodedUrl.Trim('-');

            return encodedUrl;
        }

        #region Char extensions

        [DebuggerStepThrough]
        public static int ToInt(this char value)
        {
            if (value >= '0' && value <= '9')
            {
                return value - '0';
            }
            else if (value >= 'a' && value <= 'f')
            {
                return (value - 'a') + 10;
            }
            else if (value >= 'A' && value <= 'F')
            {
                return (value - 'A') + 10;
            }

            return -1;
        }

        public static char TryRemoveDiacritic(this char c)
        {
            var normalized = c.ToString().Normalize(NormalizationForm.FormD);
            if (normalized.Length > 1)
            {
                return normalized[0];
            }

            return c;
        }

        #endregion Char extensions

        #region String extensions

        [DebuggerStepThrough]
        public static T ToEnum<T>(this string value, T defaultValue)
        {
            if (!value.HasValue())
            {
                return defaultValue;
            }
            try
            {
                return (T)Enum.Parse(typeof(T), value, true);
            }
            catch (ArgumentException)
            {
                return defaultValue;
            }
        }

        [DebuggerStepThrough]
        public static string ToSafe(this string value, string defaultValue = null)
        {
            if (!String.IsNullOrEmpty(value))
            {
                return value;
            }

            return (defaultValue ?? string.Empty);
        }

        [DebuggerStepThrough]
        public static string EmptyNull(this string value)
        {
            return (value ?? string.Empty).Trim();
        }

        [DebuggerStepThrough]
        public static string NullEmpty(this string value)
        {
            return (string.IsNullOrEmpty(value)) ? null : value;
        }

        /// <summary>
        /// Formats a string to an invariant culture
        /// </summary>
        /// <param name="format">The format string.</param>
        /// <param name="objects">The objects.</param>
        /// <returns></returns>
        [DebuggerStepThrough]
        public static string FormatInvariant(this string format, params object[] objects)
        {
            return string.Format(CultureInfo.InvariantCulture, format, objects);
        }

        /// <summary>
        /// Formats a string to the current culture.
        /// </summary>
        /// <param name="format">The format string.</param>
        /// <param name="objects">The objects.</param>
        /// <returns></returns>
        [DebuggerStepThrough]
        public static string FormatCurrent(this string format, params object[] objects)
        {
            return string.Format(CultureInfo.CurrentCulture, format, objects);
        }

        /// <summary>
        /// Formats a string to the current UI culture.
        /// </summary>
        /// <param name="format">The format string.</param>
        /// <param name="objects">The objects.</param>
        /// <returns></returns>
        [DebuggerStepThrough]
        public static string FormatCurrentUI(this string format, params object[] objects)
        {
            return string.Format(CultureInfo.CurrentUICulture, format, objects);
        }

        [DebuggerStepThrough]
        public static string FormatWith(this string format, params object[] args)
        {
            return FormatWith(format, CultureInfo.CurrentCulture, args);
        }

        [DebuggerStepThrough]
        public static string FormatWith(this string format, IFormatProvider provider, params object[] args)
        {
            return string.Format(provider, format, args);
        }

        /// <summary>
        /// Determines whether this instance and another specified System.String object have the same value.
        /// </summary>
        /// <param name="value">The string to check equality.</param>
        /// <param name="comparing">The comparing with string.</param>
        /// <returns>
        /// <c>true</c> if the value of the comparing parameter is the same as this string; otherwise, <c>false</c>.
        /// </returns>
        [DebuggerStepThrough]
        public static bool IsCaseSensitiveEqual(this string value, string comparing)
        {
            return string.CompareOrdinal(value, comparing) == 0;
        }

        /// <summary>
        /// Determines whether this instance and another specified System.String object have the same value.
        /// </summary>
        /// <param name="value">The string to check equality.</param>
        /// <param name="comparing">The comparing with string.</param>
        /// <returns>
        /// <c>true</c> if the value of the comparing parameter is the same as this string; otherwise, <c>false</c>.
        /// </returns>
        [DebuggerStepThrough]
        public static bool IsCaseInsensitiveEqual(this string value, string comparing)
        {
            return string.Compare(value, comparing, StringComparison.OrdinalIgnoreCase) == 0;
        }

        /// <summary>
        /// Determines whether the string is null, empty or all whitespace.
        /// </summary>
        [DebuggerStepThrough]
        public static bool IsEmpty(this string value)
        {
            return string.IsNullOrWhiteSpace(value);
        }

        /// <summary>
        /// Determines whether the string is all white space. Empty string will return false.
        /// </summary>
        /// <param name="value">The string to test whether it is all white space.</param>
        /// <returns>
        /// 	<c>true</c> if the string is all white space; otherwise, <c>false</c>.
        /// </returns>
        [DebuggerStepThrough]
        public static bool IsWhiteSpace(this string value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            if (value.Length == 0)
                return false;

            for (int i = 0; i < value.Length; i++)
            {
                if (!char.IsWhiteSpace(value[i]))
                    return false;
            }

            return true;
        }

        [DebuggerStepThrough]
        public static bool HasValue(this string value)
        {
            return !string.IsNullOrWhiteSpace(value);
        }

        /// <summary>
        /// Mask by replacing characters with asterisks.
        /// </summary>
        /// <param name="value">The string</param>
        /// <param name="length">Number of characters to leave untouched.</param>
        /// <returns>The mask string</returns>
        [DebuggerStepThrough]
        public static string Mask(this string value, int length)
        {
            if (value.HasValue())
                return value.Substring(0, length) + new String('*', value.Length - length);

            return value;
        }

        private static bool IsWebUrlInternal(string value, bool schemeIsOptional)
        {
            if (String.IsNullOrEmpty(value))
                return false;

            value = value.Trim().ToLowerInvariant();

            if (schemeIsOptional && value.StartsWith("//"))
            {
                value = "http:" + value;
            }

            return Uri.IsWellFormedUriString(value, UriKind.Absolute) &&
                (value.StartsWith("http://") || value.StartsWith("https://") || value.StartsWith("ftp://"));
        }

        [DebuggerStepThrough]
        public static bool IsWebUrl(this string value)
        {
            return IsWebUrlInternal(value, false);
        }

        [DebuggerStepThrough]
        public static bool IsWebUrl(this string value, bool schemeIsOptional)
        {
            return IsWebUrlInternal(value, schemeIsOptional);
        }

        /// <summary>
        /// Ensures that a string only contains numeric values
        /// </summary>
        /// <param name="str">Input string</param>
        /// <returns>Input string with only numeric values, empty string if input is null or empty</returns>
        [DebuggerStepThrough]
        public static string EnsureNumericOnly(this string str)
        {
            if (String.IsNullOrEmpty(str))
                return string.Empty;

            return new String(str.Where(c => Char.IsDigit(c)).ToArray());
        }

        [DebuggerStepThrough]
        public static string Truncate(this string value, int maxLength, string suffix = "")
        {
            if (suffix == null)
                throw new ArgumentNullException(nameof(suffix));

            int subStringLength = maxLength - suffix.Length;

            if (subStringLength <= 0)
                throw new Exception("Length of suffix string is greater or equal to maximumLength");

            if (value != null && value.Length > maxLength)
            {
                var truncatedString = value.Substring(0, subStringLength);
                // in case the last character is a space
                truncatedString = truncatedString.Trim();
                truncatedString += suffix;

                return truncatedString;
            }
            else
            {
                return value;
            }
        }

        /// <summary>
        /// Removes all redundant whitespace (empty lines, double space etc.).
        /// Use ~! literal to keep whitespace wherever necessary.
        /// </summary>
        /// <param name="input">Input</param>
        /// <returns>The compacted string</returns>
        public static string Compact(this string input, bool removeEmptyLines = false)
        {
            var sb = new StringBuilder();
            var lines = GetLines(input.Trim(), true, removeEmptyLines).ToArray();

            foreach (var line in lines)
            {
                var len = line.Length;
                var sbLine = new StringBuilder(len);
                var isChar = false;
                var isLiteral = false; // When we detect the ~! literal
                int i = 0;
                var eof = false;

                for (i = 0; i < len; i++)
                {
                    var c = line[i];

                    eof = i == len - 1;

                    if (Char.IsWhiteSpace(c))
                    {
                        // Space, Tab etc.
                        if (isChar)
                        {
                            // If last char not empty, append the space.
                            sbLine.Append(' ');
                        }

                        isLiteral = false;
                        isChar = false;
                    }
                    else
                    {
                        // Char or Literal (~!)

                        isLiteral = c == '~' && !eof && line[i + 1] == '!';
                        isChar = true;

                        if (isLiteral)
                        {
                            sbLine.Append(' ');
                            i++; // skip next "!" char
                        }
                        else
                        {
                            sbLine.Append(c);
                        }
                    }
                }

                // Append the compacted and trimmed line
                sb.AppendLine(sbLine.ToString().Trim().Trim(','));
            }

            return sb.ToString().Trim();
        }

        /// <summary>
        /// Splits the input string by carriage return.
        /// </summary>
        /// <param name="input">The string to split</param>
        /// <returns>A sequence with string items per line</returns>
        public static IEnumerable<string> GetLines(this string input, bool trimLines = false, bool removeEmptyLines = false)
        {
            if (input.IsEmpty())
            {
                yield break;
            }

            using (var sr = new StringReader(input))
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    if (trimLines)
                    {
                        line = line.Trim();
                    }

                    if (removeEmptyLines && IsEmpty(line))
                    {
                        continue;
                    }

                    yield return line;
                }
            }
        }

        /// <summary>
        /// Ensure that a string starts with a string.
        /// </summary>
        /// <param name="value">The target string</param>
        /// <param name="startsWith">The string the target string should start with</param>
        /// <returns>The resulting string</returns>
        [DebuggerStepThrough]
        public static string EnsureStartsWith(this string value, string startsWith)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            if (startsWith == null)
                throw new ArgumentNullException(nameof(startsWith));

            return value.StartsWith(startsWith) ? value : (startsWith + value);
        }

        /// <summary>
        /// Ensures the target string ends with the specified string.
        /// </summary>
        /// <param name="endWith">The target.</param>
        /// <param name="value">The value.</param>
        /// <returns>The target string with the value string at the end.</returns>
        [DebuggerStepThrough]
        public static string EnsureEndsWith(this string value, string endWith)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            if (endWith == null)
                throw new ArgumentNullException(nameof(endWith));

            if (value.Length >= endWith.Length)
            {
                if (string.Compare(value, value.Length - endWith.Length, endWith, 0, endWith.Length, StringComparison.OrdinalIgnoreCase) == 0)
                    return value;

                string trimmedString = value.TrimEnd(null);

                if (string.Compare(trimmedString, trimmedString.Length - endWith.Length, endWith, 0, endWith.Length, StringComparison.OrdinalIgnoreCase) == 0)
                    return value;
            }

            return value + endWith;
        }

        [DebuggerStepThrough]
        public static string UrlEncode(this string value)
        {
            return HttpUtility.UrlEncode(value);
        }

        [DebuggerStepThrough]
        public static string UrlDecode(this string value)
        {
            return HttpUtility.UrlDecode(value);
        }

        [DebuggerStepThrough]
        public static string AttributeEncode(this string value)
        {
            return HttpUtility.HtmlAttributeEncode(value);
        }

        [DebuggerStepThrough]
        public static string HtmlEncode(this string value)
        {
            return HttpUtility.HtmlEncode(value);
        }

        [DebuggerStepThrough]
        public static string HtmlDecode(this string value)
        {
            return HttpUtility.HtmlDecode(value);
        }

        /// <summary>
        /// Replaces pascal casing with spaces. For example "CustomerId" would become "Customer Id".
        /// Strings that already contain spaces are ignored.
        /// </summary>
        /// <param name="value">String to split</param>
        /// <returns>The string after being split</returns>
        [DebuggerStepThrough]
        public static string SplitPascalCase(this string value)
        {
            var sb = new StringBuilder();
            char[] ca = value.ToCharArray();
            sb.Append(ca[0]);

            for (int i = 1; i < ca.Length - 1; i++)
            {
                char c = ca[i];
                if (char.IsUpper(c) && (char.IsLower(ca[i + 1]) || char.IsLower(ca[i - 1])))
                {
                    sb.Append(" ");
                }
                sb.Append(c);
            }

            if (ca.Length > 1)
            {
                sb.Append(ca[ca.Length - 1]);
            }

            return sb.ToString();
        }

        /// <summary>
        /// Splits a string into a string array
        /// </summary>
        /// <param name="value">String value to split</param>
        /// <param name="separator">If <c>null</c> then value is searched for a common delimiter like pipe, semicolon or comma</param>
        /// <returns>String array</returns>
        [DebuggerStepThrough]
        public static string[] SplitSafe(this string value, string separator)
        {
            if (string.IsNullOrEmpty(value))
                return new string[0];

            // do not use separator.IsEmpty() here because whitespace like " " is a valid separator.
            // an empty separator "" returns array with value.
            if (separator == null)
            {
                separator = "|";

                if (value.IndexOf(separator) < 0)
                {
                    if (value.IndexOf(';') > -1)
                    {
                        separator = ";";
                    }
                    else if (value.IndexOf(',') > -1)
                    {
                        separator = ",";
                    }
                    else if (value.IndexOf(Environment.NewLine) > -1)
                    {
                        separator = Environment.NewLine;
                    }
                }
            }

            return value.Split(new string[] { separator }, StringSplitOptions.RemoveEmptyEntries);
        }

        /// <summary>Splits a string into two strings</summary>
        /// <returns>true: success, false: failure</returns>
        [DebuggerStepThrough]
        [SuppressMessage("ReSharper", "StringIndexOfIsCultureSpecific.1")]
        public static bool SplitToPair(this string value, out string leftPart, out string rightPart, string delimiter, bool splitAfterLast = false)
        {
            leftPart = value;
            rightPart = "";

            if (string.IsNullOrEmpty(value) || string.IsNullOrEmpty(delimiter))
            {
                return false;
            }

            var idx = splitAfterLast
                ? value.LastIndexOf(delimiter)
                : value.IndexOf(delimiter);

            if (idx == -1)
            {
                return false;
            }

            leftPart = value.Substring(0, idx);
            rightPart = value.Substring(idx + delimiter.Length);

            return true;
        }
          

        /// <summary>Smart way to create a HTML attribute with a leading space.</summary>
        /// <param name="value">Name of the attribute.</param>
        /// <param name="name"></param>
        /// <param name="htmlEncode"></param>
        [SuppressMessage("ReSharper", "StringCompareIsCultureSpecific.3")]
        public static string ToAttribute(this string value, string name, bool htmlEncode = true)
        {
            if (name.IsEmpty())
                return "";

            if (value == "" && name != "value" && !name.StartsWith("data"))
                return "";

            if (name == "maxlength" && (value == "" || value == "0"))
                return "";

            if (name == "checked" || name == "disabled" || name == "multiple")
            {
                if (value == "" || string.Compare(value, "false", true) == 0)
                    return "";
                value = (string.Compare(value, "true", true) == 0 ? name : value);
            }

            if (name.StartsWith("data"))
                name = name.Insert(4, "-");

            return string.Format(" {0}=\"{1}\"", name, htmlEncode ? HttpUtility.HtmlEncode(value) : value);
        }

        /// <summary>
        /// Appends grow and uses delimiter if the string is not empty.
        /// </summary>
        [DebuggerStepThrough]
        public static string Grow(this string value, string grow, string delimiter)
        {
            if (string.IsNullOrEmpty(value))
                return (string.IsNullOrEmpty(grow) ? "" : grow);

            if (string.IsNullOrEmpty(grow))
                return (string.IsNullOrEmpty(value) ? "" : value);

            return string.Concat(value, delimiter, grow);
        }

        /// <summary>
        /// Returns n/a if string is empty else self.
        /// </summary>
        [DebuggerStepThrough]
        public static string NaIfEmpty(this string value)
        {
            return (string.IsNullOrWhiteSpace(value) ? "n/a" : value);
        }

        /// <summary>
        /// Replaces substring with position x1 to x2 by replaceBy.
        /// </summary>
        [DebuggerStepThrough]
        public static string Replace(this string value, int x1, int x2, string replaceBy = null)
        {
            if (!string.IsNullOrWhiteSpace(value) && x1 > 0 && x2 > x1 && x2 < value.Length)
            {
                return value.Substring(0, x1) + (replaceBy.EmptyNull()) + value.Substring(x2 + 1);
            }

            return value;
        }

        [DebuggerStepThrough]
        public static string TrimSafe(this string value)
        {
            return (value.HasValue() ? value.Trim() : value);
        }

        [DebuggerStepThrough]
        public static bool IsMatch(this string input, string pattern, RegexOptions options = RegexOptions.IgnoreCase | RegexOptions.Multiline)
        {
            return Regex.IsMatch(input, pattern, options);
        }

        [DebuggerStepThrough]
        public static bool IsMatch(this string input, string pattern, out Match match, RegexOptions options = RegexOptions.IgnoreCase | RegexOptions.Multiline)
        {
            match = Regex.Match(input, pattern, options);
            return match.Success;
        }

        public static string RegexRemove(this string input, string pattern, RegexOptions options = RegexOptions.IgnoreCase | RegexOptions.Multiline)
        {
            return Regex.Replace(input, pattern, string.Empty, options);
        }

        public static string RegexReplace(this string input, string pattern, string replacement, RegexOptions options = RegexOptions.IgnoreCase | RegexOptions.Multiline)
        {
            return Regex.Replace(input, pattern, replacement, options);
        }

        [DebuggerStepThrough]
        public static string ToValidFileName(this string input, string replacement = "-")
        {
            return input.ToValidPathInternal(false, replacement);
        }

        [DebuggerStepThrough]
        public static string ToValidPath(this string input, string replacement = "-")
        {
            return input.ToValidPathInternal(true, replacement);
        }

        private static string ToValidPathInternal(this string input, bool isPath, string replacement)
        {
            var invalidChars = new HashSet<char>(isPath ? Path.GetInvalidPathChars() : Path.GetInvalidFileNameChars());

            replacement = replacement ?? "-";

            var sb = new StringBuilder();
            foreach (var c in input.ToSafe())
            {
                if (invalidChars.Contains(c))
                {
                    sb.Append(replacement);
                }
                else
                {
                    sb.Append(c);
                }
            }

            return sb.ToString();
        }

        [DebuggerStepThrough]
        public static int[] ToIntArray(this string s)
        {
            return Array.ConvertAll(s.SplitSafe(","), v => int.Parse(v.Trim()));
        }

        [DebuggerStepThrough]
        public static bool ToIntArrayContains(this string s, int value, bool defaultValue)
        {
            if (s == null)
                return defaultValue;
            var arr = s.ToIntArray();
            if (arr == null || arr.Count() <= 0)
                return defaultValue;

            return arr.Contains(value);
        }

        [DebuggerStepThrough]
        public static string RemoveInvalidXmlChars(this string s)
        {
            if (s.IsEmpty())
                return s;

            return Regex.Replace(s, @"[^\u0009\u000A\u000D\u0020-\uD7FF\uE000-\uFFFD]", "", RegexOptions.Compiled);
        }

        [DebuggerStepThrough]
        public static string ReplaceCsvChars(this string s)
        {
            if (s.IsEmpty())
            {
                return "";
            }

            s = s.Replace(';', ',');
            s = s.Replace('\r', ' ');
            s = s.Replace('\n', ' ');
            return s.Replace("'", "");
        }

        [DebuggerStepThrough]
        public static string HighlightKeywords(this string input, string keywords, string preMatch = "<strong>", string postMatch = "</strong>")
        {
            if (string.IsNullOrWhiteSpace(input) || string.IsNullOrWhiteSpace(keywords))
            {
                return input;
            }

            var pattern = String.Join("|", keywords.Trim().Split(' ', '-')
                .Select(x => x.Trim())
                .Where(x => !string.IsNullOrWhiteSpace(x))
                .Select(x => Regex.Escape(x))
                .Distinct());

            if (!string.IsNullOrWhiteSpace(pattern))
            {
                var rg = new Regex(pattern, RegexOptions.IgnoreCase);
                input = rg.Replace(input, m => preMatch + m.Value.EmptyNull().HtmlEncode() + postMatch);
            }

            return input;
        }

        #endregion String extensions
    }
}
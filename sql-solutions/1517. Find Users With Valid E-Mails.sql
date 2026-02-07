/* Write your PL/SQL query statement below */

select user_id,name,mail from Users where regexp_like(mail,'^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$');

-- Start with letter 
-- Then Letters / Numbers / . / - / _
-- Match domain 

/*

1️⃣ ^ → Start of string

Ensures matching begins from the very first character

Prevents extra characters before the email

❌ 123john@leetcode.com
✅ john@leetcode.com

2️⃣ [A-Za-z] → First character must be a letter

Allows:

Uppercase letters A–Z

Lowercase letters a–z

Enforces the rule:
“Prefix name must start with a letter”

❌ _john@leetcode.com
❌ 1john@leetcode.com
✅ john@leetcode.com

3️⃣ [A-Za-z0-9_.-]* → Remaining prefix characters

A–Z → letters

0–9 → digits

_ → underscore

. → period

- → dash

* → zero or more occurrences

✔ This means:

Prefix can be just one letter

Or many valid characters

Examples:

a@leetcode.com

a_b-1.c@leetcode.com

4️⃣ @leetcode → Literal text

Matches exactly the string @leetcode

No variations allowed

❌ @leet.code
❌ @leetcode123

5️⃣ \. → Literal dot

. alone means any character in regex

\. forces it to mean a real dot (.)

✔ Required for correct domain matching

6️⃣ com → Literal text

Matches exactly com

❌ @leetcode.company
❌ @leetcode.comm

7️⃣ $ → End of string

Ensures nothing comes after the email

Prevents trailing junk

❌ john@leetcode.com.in
❌ john@leetcode.com123

🔚 Final behavior summary

This regex matches only emails that:
✔ Start with a letter
✔ Use only allowed prefix characters
✔ End exactly with @leetcode.com
✔ Have no extra characters before or after

*/

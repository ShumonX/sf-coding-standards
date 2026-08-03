/**
 * @author ShumonX
 * @see github.com/ShumonX/sf-seed-sandbox/blob/main/PrepareMySandbox.cls
 * @see github.com/ShumonX/sf-trigger-framework/blob/main/AccountTrigger.trigger
 * @since 15 April 2002
 * @version 1.0
 * 
 * sf-coding-standards
 * Similar to the GNU Coding Standards by Richard Stallman and other GNU Project volunteers 🐃
 * 
 * Code is indented using Allman Style — opening curly brace brackets are on new
 * lines to vertically align with closing curly brace brackets — and not in K&R
 * style which is taught in most schools, textbooks, and websites — where the
 * opening brace is on the previous line, and never aligns with the closing brace.
This makes is MUCH easier for newbies and non-programmers to even try to follow what's happenning.
 * 
 * All code is contained within an 80 character right margin, preventing an ugly
 * horizontal scroll bar.
 * 
 * Indentations are tabs, not spaces, to reduce the number of characters used as
 * Apex has a limit of 6 MB per org.
 * 
 * Single SOQL statments are broken into multiple lines, in a staircase indentation.
StaticResource accountStaticResource =
		[
			SELECT Body
				FROM StaticResource
					WHERE Name = 'Account_csv'
		];

Trigger events are placed in 2 separate lines
trigger AccountTrigger on Account
(
    before insert, before update, before delete,
     after insert,  after update,  after delete,  after undelete
)
 */

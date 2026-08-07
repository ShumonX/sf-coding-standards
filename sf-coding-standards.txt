Shumon's sf-coding-standards 👨‍💻
Similar to the GNU Coding Standards by Richard Stallman and other GNU Project volunteers 🐃



/**
 * @author ShumonX
 * @see github.com/ShumonX/sf-seed-sandbox/blob/main/PrepareMySandbox.cls
 * @see github.com/ShumonX/sf-trigger-framework/blob/main/AccountTrigger.trigger
 * @since 15 April 2002 😎
 * @version 1.0
 * For Salesforce Apex Classes, Salesforce Apex Triggers, Java, C, and C++. ✅
*/

Rule 1 ☝ : Braces and code indentation
Code should be indented using Allman Style — opening curly brace brackets are on new lines to vertically align with closing curly brace brackets. ✅

Allman Style:

if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c ?? true)
{
    TriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    switch on Trigger.operationType
    {
        when BEFORE_INSERT
        {
            handler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE
        {
            handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when BEFORE_DELETE
        {
            handler.beforeDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_INSERT
        {
            Handler.afterInsert(Trigger.new, Trigger.newMap);
        }
        when AFTER_UPDATE
        {
            handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when AFTER_DELETE
        {
            handler.afterDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_UNDELETE
        {
            handler.afterUndelete(Trigger.new, Trigger.newMap);
        }
    }
}

NOT in K&R style which is taught in most schools, textbooks, and websites — where the opening brace is on the previous line, and never aligns with the closing brace - to save space, shorten code, reduce scrolling, save paper, or God knows why. ❌

K&R style (Kernighan & Ritchie style):

if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c ?? true) {
    TriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            handler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when BEFORE_DELETE {
            handler.beforeDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_INSERT {
            Handler.afterInsert(Trigger.new, Trigger.newMap);
        }
        when AFTER_UPDATE {
            handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when AFTER_DELETE {
            handler.afterDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_UNDELETE {
            handler.afterUndelete(Trigger.new, Trigger.newMap);
        }
    }
}

The braces don’t align and affect OCD. 😣😫😖

Whereas, Allman Style makes it MUCH easier for newbies, non-programmers, and new people on the project to even try to follow what's happening.


Rule 2 ✌ : Braces for single statements

Single statements should still be put inside curly brace brackets. ✅

Even though putting braces around single statements is not necessary, still works, and saves space - it is difficult for the next person to read the code. ❌

Not putting braces around single statements:

if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c ?? true) {
    TriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    switch on Trigger.operationType {
        when BEFORE_INSERT
            handler.beforeInsert(Trigger.new);

        when BEFORE_UPDATE
            handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);

        when BEFORE_DELETE
            handler.beforeDelete(Trigger.old, Trigger.oldMap);

        when AFTER_INSERT
            Handler.afterInsert(Trigger.new, Trigger.newMap);

        when AFTER_UPDATE
            handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);

        when AFTER_DELETE
            handler.afterDelete(Trigger.old, Trigger.oldMap);

        when AFTER_UNDELETE
            handler.afterUndelete(Trigger.new, Trigger.newMap);

    }
}

🤢🤮
Rule 3: Right Margin
All code is contained within an 80 character right margin, preventing an ugly horizontal scroll bar.

I think the practice of keeping code to 80 (or 79) columns was originally created to support people editing code on 80-column dumb terminals or on 80-column printouts. Those requirement have mostly gone away now, but there are still valid reasons to keep the 80 column rule:
 

To avoid wrapping when copying code into email, web pages, and books.
To view multiple source windows side-by-side or using a side-by-side diff viewer.
To improve readability. Narrow code can be read quickly without having to scan your eyes from side to side.
 

I think the last point is the most important. Though displays have grown in size and resolution in the last few years, eyes haven't. 👀🔎


Rule 1(c):

 * Indentations are tabs, not spaces, to reduce the number of characters used as
 * Apex has a limit of 6 MB per org.
 * 


Rule 5: 🖐

Single SOQL statements are broken into multiple lines, in a staircase indentation.

For example:

StaticResource accountStaticResource =
[
    SELECT Body
        FROM StaticResource
            WHERE Name = 'Account_csv'
];

The above looks so much readable for new people on the project, rather than:

StaticResource accountStaticResource = [SELECT Body FROM StaticResource WHERE Name = 'Account_csv'];

🤢🤮
Rule 6:

Trigger events should be in 2 separate lines, with the before and after events directly below each other:

trigger AccountTrigger on Account
(
    before insert, before update, before delete,
     after insert,  after update,  after delete,  after undelete
)
{
    // Trigger Framework Code;
}

If a Trigger Event is accidentally missing, it takes less than a second to spot the fault. The above is so much more readable than:

trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    // Trigger Framework Code
}

One missing Trigger Event in the above one-liner, and you’ll be searching everywhere why your Trigger ain’t working for an after-insert except for scrutinising that one line of code containing all the Trigger Events.

namespace ET;

using { managed } from '@sap/cds/common';
using { Structures } from './aspects';

entity Employee {
    key  UserID            : Structures.UserID;
        /*Delta keys*/
    key  Delta             : Structures.DeltaKeys;
    
    /*Name of the employee*/
        EmployeeID        : Structures.EmployeeID;
        FirstName         : Structures.FirstName;
        LastName          : Structures.LastName;

        EmployeeStatus    : Structures.EmployeeStatus;
        
    /*Other employee attributes*/
        Domain            : Structures.Domain;
        JobCode           : Structures.JobCode;
        JobGroup          : Structures.JobGroup;

        GroupBU           : Structures.GroupBU;
        EmployeeGroup     : Structures.EmployeeGroup;
        EmpCustomStatus   : Structures.EmpCustStatus;

    
    /*Direct Manager details*/    
        ManagerUserID     : Structures.ManagerUserID;
        ManagerName       : Structures.ManagerName;

        Department        : Structures.Department;
        Division          : Structures.Division;
        JobLocation       : Structures.JobLocation;

        ProcessingStatus  : Structures.ProcessingStatus;
};


entity Item {
    key  ItemID            : Structures._ItemId;
    key  ItemType          : Structures._ItemType;

        /*Delta keys*/
    key    Delta           : Structures.DeltaKeys;

        /*Item details*/
        ItemTitle         : Structures._ItemTitle;

    /*Other employee attributes*/
        Competency        : Structures.CompetencyType;
    /*Number of days certification is valid*/ 
        RetainingNumer    : Structures.RetainingNumer;

        ProcessingStatus  : Structures.ProcessingStatus;
}; 

entity Assignment {
    key  UserID            : Structures.UserID;
    key  ItemID            : Structures._ItemId;
    key  ItemType          : Structures._ItemType;
    
        /*Delta keys*/
    key   Delta             : Structures.DeltaKeys;

        AssignmentDate     : Structures.EventDate;
        AssignedBy		   : Structures.AssignedBy;
        ProcessingStatus   : Structures.ProcessingStatus;
};  

entity RecentAssignment {
    key  UserID            : Structures.UserID;
    key  ItemID            : Structures._ItemId;
    key  ItemType          : Structures._ItemType;

        ProcessingStatus   : Structures.ProcessingStatus;
        AssignedBy		   : Structures.AssignedBy;
};  


entity Completion {
    key  UserID            : Structures.UserID;

    /*Delta keys*/
    key    Delta           : Structures.DeltaKeys;

        /*Item details*/
    key ItemID             : Structures._ItemId;
    key ItemType           : Structures._ItemType;

        CompletionStatus   : Structures.CompletionStatus;
        CompletionDate     : Structures.EventDate;

        ProcessingStatus   : Structures.ProcessingStatus;
};  

entity RecentCompletion {
    key  UserID            : Structures.UserID;
    key  ItemID            : Structures._ItemId;
    key  ItemType          : Structures._ItemType;

        ProcessingStatus   : Structures.ProcessingStatus;
};  


entity AdminAccess {
    key UserID             : Structures.UserID;
    key Domain             : Structures.Domain;
    key SubDomain          : Structures.Domain;
    key RoleAssigned       : Structures.ObjectName;

        ProcessingStatus   : Structures.ProcessingStatus;
};  

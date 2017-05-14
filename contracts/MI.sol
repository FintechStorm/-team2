pragma solidity ^0.4.6;

contract MI {
    struct PlanData{
        uint product; //name of the plan
        uint insuredagainst; //damage or theft
        uint payout_percent;
        uint premium_percent;
        address Agency;
        uint no_of_policies;
        uint totprem;
        uint totpayout;
        uint totobjectval;
        uint policyno;
        mapping(uint => Policy) policies;
    }
    struct Policy {
        address Insured;
        string objectSNO;
        uint objectvalue;
        uint startdt;
        uint enddt;
    }
   uint nextPlanID;
   mapping(uint256 => PlanData) plans;

   function MI() {

   }

    // Start a new insurance plan
    function CreatePlan(address agency, uint insuredagainst, uint product, uint payout_percent, uint premium_percent) returns (uint id)
    {
        plans[nextPlanID] = PlanData(product, insuredagainst, payout_percent, premium_percent,agency,0,0,0,0,0);
        nextPlanID++;
        id=nextPlanID;
    }

    //subscribe to an insurance plan
    function insures(address insured, string objectSNO, uint objectvl, uint startdt, uint enddt, uint256 PlanID) returns (uint policyno) {
        var plan = plans[PlanID];
        plan.totobjectval += objectvl;
        plan.totpayout += objectvl * (plan.payout_percent / 100);
        plan.totprem += objectvl * (plan.premium_percent /100);
        plan.policies[policyno] =  Policy(insured, objectSNO, objectvl,startdt,enddt);
        plan.policyno++;
    }

    //Claim
    // }
   // function claim(address insured, string objectSNO, uint objectvl, uint startdt, uint enddt, uint256 PlanID) returns (uint id) {

   function mytest() returns (string teststr){
   teststr =  "hello world";

   }


}

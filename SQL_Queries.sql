-- 1. claim type cost breakdown

select claim_type, 
	count(claim_type),
	sum(billed_amount) as total_billed_amount, 
    sum(paid_amount) as total_paid_amount, 
    rank() over(order by sum(paid_amount) desc) as ranking 
from claims
group by claim_type
;

-- 2. CPT & ICD cost drivers

select cpt_code, 
	count(*) as numbers_of_claims, 
    sum(paid_amount) as total_paid_amount,
    sum(paid_amount) / count(*) as avg_paid_per_claim
from claims
group by cpt_code
order by total_paid_amount desc
limit 10
;
select icd_code, 
	count(*) as numbers_of_claims, 
    sum(paid_amount) as total_paid_amount,
    sum(paid_amount) / count(*) as avg_paid_per_claim
from claims
group by icd_code
order by total_paid_amount desc
limit 10
;

-- 3. member-level analysis

-- total paid amount per member
select member_id, sum(paid_amount) as total_paid_amount
from claims
group by member_id
order by 1
;

-- top 5 members by paid amount
select member_id, sum(paid_amount) as total_paid_amount
from claims
group by member_id
order by 2 desc
limit 5
;

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

-- claim type break down cost for each high-cost member

with total_member as (
	select member_id, sum(paid_amount) as total_paid
    from claims
    group by member_id),
top_member as (
	select member_id
    from total_member
    order by total_paid desc
    limit 5)
select c.member_id, c.claim_type, sum(c.paid_amount) as total_paid_cost
from claims c
join top_member t
on c.member_id = t.member_id
join total_member tm
on c.member_id = tm.member_id
group by c.member_id, c.claim_type
order by tm.total_paid desc, total_paid_cost desc
;

-- 4. Billed vs Paid Ratio

-- overall paid ratio
select
	sum(paid_amount),
	sum(billed_amount),
    round(sum(paid_amount) * 1.0 / nullif(sum(billed_amount),0), 2) as paid_ratio
from claims;

-- average paid ratios by: claim_type
select
	claim_type,
    sum(paid_amount),
    sum(billed_amount),
	round(sum(paid_amount) * 1.0 / nullif(sum(billed_amount),0), 2) as paid_ratio
from claims
group by claim_type
;

-- average paid ratios by: provider
select
	provider_id,
    sum(paid_amount),
    sum(billed_amount),
	round(sum(paid_amount) * 1.0 / nullif(sum(billed_amount),0), 2) as paid_ratio
from claims
group by provider_id
;

-- average paid ratios by: CPT code
select
	cpt_code,
    sum(paid_amount),
    sum(billed_amount),
	round(sum(paid_amount) * 1.0 / nullif(sum(billed_amount),0), 2) as paid_ratio
from claims
group by cpt_code
;

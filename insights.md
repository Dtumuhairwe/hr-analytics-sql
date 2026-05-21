# What the Data Shows

A short read-through of the 25 queries, written the way I'd hand it to a People Operations lead. The numbers below come from the sample data in `02_seed_data.sql`. The data is synthetic but the queries that produced these numbers are real, and the same ones would work on a production HR warehouse.

## Headcount

The company has 36 active employees across six departments. Customer Support is the largest team at 9, followed by Engineering at 7. Sales and Marketing are tied at 6, Finance at 5, and HR at 3.

About a third of the company has been hired since the start of 2023, which is a fast ramp for a 36-person company and probably worth a conversation about onboarding capacity.

## Compensation

Average 2025 base salary varies a lot by function. Sales averages \$120k base and \$163k total comp (commission is doing most of the work). Engineering averages \$126k base, \$144k total. Customer Support sits at the bottom — \$85k base, \$95k total — which is in line with the market but worth keeping an eye on if Support's attrition picks up.

Three departments pay above the company-wide average base: Sales, Finance, and HR. Engineering is just below the line, and Marketing and Customer Support are below it.

## Attrition

Year-over-year attrition tells a clearer story than a static count:

- 2023: 1 termination on 30 employees who started the year. About 3% — low.
- 2024: 3 terminations on 36 employees. About 8%. Roughly in line with industry but worth watching.
- 2025: 0 terminations so far this year.

The three 2024 exits were one Engineering, one Customer Support, and one Marketing. No single team is bleeding people.

## Top performers

Nine employees earned a 5/5 rating in both 2023 and 2024:

- Engineering: Sarah Chen, Priya Patel, Aisha Williams
- Sales: Robert Taylor
- Customer Support: Rachel Green
- Marketing: Diana Patel
- Finance: Henry Wong, Oliver Reid
- HR: Patricia Davis

These are the obvious promotion and retention priorities.

## Flight-risk shortlist (Q25)

This is the query I'd run quarterly. The logic: anyone rated 4 or 5 in 2024 who got less than a 5% base-salary raise into 2025. The list comes back with nine names. The five most exposed:

- Aisha Williams (Engineering) — rating 5, 2.1% raise
- Jessica Lee (Sales) — rating 4, 2.3%
- Hannah Cole (Marketing) — rating 4, 2.3%
- Marcus Lee (Customer Support) — rating 4, 3.0%
- Oliver Reid (Finance) — rating 5, 3.0%

Two of them (Aisha and Oliver) were also on the 5/5 list above. If even half of these people leave, the cost in re-hiring and ramp time is well above what a meaningful raise would have cost.

## Caveats

The dataset is synthetic and small. The numbers here are illustrative, not benchmarks. The point of the project is to show the SQL and the analytical framing — pointed business questions answered with clean queries.

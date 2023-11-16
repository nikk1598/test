CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    with cte as (
    select distinct e.Salary as Salary_, dense_rank() over(order by e.Salary desc) s
    from Employee e
    )
    select Salary_
    from cte
    where s = N
  );
END;
$$ LANGUAGE plpgsql;
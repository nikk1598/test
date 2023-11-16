CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    select distinct e.Salary
    from Employee e
    order by e.Salary desc
    limit 1 offset N-1
  );
END;
$$ LANGUAGE plpgsql;
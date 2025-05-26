declare @json nvarchar(4000)
set @json = '
{
"name":"Phillip",
"Shopping":
	{"ShoppingTrip":1,
	 "Items":
	 [
		{"Item":"Bananas","Cost":5},
		{"Item":"Apples","Cost":4},
		{"Item":"Cherries","Cost":3}
	 ]
	}
}
'

--select JSON_QUERY(@json,'$.Shopping')
select json_modify(@json, 'strict $.Shopping.Items[0]', json_query('{"Item":"Big Bananas", "Cost":1}'))
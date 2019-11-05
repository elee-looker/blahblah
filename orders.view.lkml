view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_valtest {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    label: " "
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    html: <font color="blue">{{ value }}</font> ;;
    drill_fields: [id, users.first_name, users.id, users.last_name, order_items.count]
  }

#   measure: filtered_measure {
#     type: count
#     filters: {
#       field: created_date
#       value: "after 2 mon"
#     }
#   }
}

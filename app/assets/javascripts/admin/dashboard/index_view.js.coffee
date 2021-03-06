class PPIS.Views.Admin_Dashboard.IndexView
  render: ->
    ctx = document.getElementById("myChart")
    jctx = $(ctx)
    myChart = new Chart(ctx,
      type: 'pie'
      data:
        labels: [
          'Adhoc',
          'Regular'
        ]
        datasets: [ {
          label: '# Status of volunteers'
          data: [
            jctx.data('volunteer-adhoc'),
            jctx.data('volunteer-regular')
          ]
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)'
            'rgba(54, 162, 235, 0.2)'
          ]
          borderColor: [
            'rgba(255,99,132,1)'
            'rgba(54, 162, 235, 1)'
          ]
          borderWidth: 1
        } ])

    ctx = document.getElementById("myChartAllV")
    jctx = $(ctx)

    options = {
      scales: yAxes: [{
        display: true
        ticks:
          suggestedMin: 0
          beginAtZero: true
          stepSize: 5
      }]
      legend: display: false
    }

    myChartAllV = new Chart(ctx,
      type: 'bar'
      options: options
      data:
        labels: [
          '2 years ago'
          'last year'
          'Current year'
        ]
        datasets: [ {
          data: [
            jctx.data('volunteers-past3yrs-oldest-only'),
            jctx.data('volunteers-past3yrs-exclude-current'),
            jctx.data('volunteers-past3yrs-include-current')
          ]
          backgroundColor: [
            'rgba(54, 162, 235, 0.2)'
            'rgba(54, 162, 235, 0.2)'
            'rgba(54, 162, 235, 0.2)'
          ]
          borderColor: [
            'rgba(54, 162, 235, 1)'
            'rgba(54, 162, 235, 1)'
            'rgba(54, 162, 235, 1)'
          ]
          borderWidth: 1
        } ])

    ctx = document.getElementById("myChartAllE")
    jctx = $(ctx)

    options = {
      scales: yAxes: [{
        display: true
        ticks:
          suggestedMin: 0
          beginAtZero: true
          stepSize: 5
      }]
      legend: display: false
    }

    myChartAllE = new Chart(ctx,
      type: 'bar'
      options: options
      data:
        labels: [
          '2 years ago'
          'last year'
          'Current year'
        ]
        datasets: [ {
          data: [
            jctx.data('events-past3yrs-oldest-only'),
            jctx.data('events-past3yrs-exclude-current'),
            jctx.data('events-past3yrs-include-current')
          ]
          backgroundColor: [
            'rgba(54, 162, 235, 0.2)'
            'rgba(54, 162, 235, 0.2)'
            'rgba(54, 162, 235, 0.2)'
          ]
          borderColor: [
            'rgba(54, 162, 235, 1)'
            'rgba(54, 162, 235, 1)'
            'rgba(54, 162, 235, 1)'
          ]
          borderWidth: 1
        } ]
        options:
          scales: yAxes: [ { ticks: beginAtZero: true, stepSize: 5 } ])
        
      

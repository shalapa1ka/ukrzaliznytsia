$(document).ready(function () {
    var seats = {
        top_seats: $('.top-seats'),
        side_top_seats: $('.side-top-seats'),
        bottom_seats: $('.bottom-seats'),
        side_bottom_seats: $('.side-bottom-seats'),
        seating: $('.seating')
    }

    var all_input_fields = $('.seats')
    var submit_button = $(':input[type="submit"]')

    $('turbolinks:load', () => {
        submit_button.prop('disabled', true)
        all_input_fields.hide()
    })

    $('#carriage_type').change((e) => {
        all_input_fields.hide()
        submit_button.prop('disabled', false);
        show_carriage_attr(e.target.value, seats)
    })

    function show_carriage_attr(type, seats) {
        switch (type) {
            case 'CoupeCarriage':
                seats['top_seats'].show()
                seats['bottom_seats'].show()
                break
            case 'CVCarriage':
                seats['bottom_seats'].show()
                break
            case 'EconomyCarriage':
                seats['top_seats'].show()
                seats['bottom_seats'].show()
                seats['side_top_seats'].show()
                seats['side_bottom_seats'].show()
                break
            case 'SeatCarriage':
                seats['seating'].show()
                break
            default:
                submit_button.prop('disabled', true)
                break
        }
    }
})

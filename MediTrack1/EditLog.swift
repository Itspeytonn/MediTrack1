import SwiftUI
import SwiftData

struct EditLog: View {
  var log: Log
  @State private var newMedicationName: String
  @State private var newLogDate: Date
  @Environment(\.dismiss) private var dismiss // new
  init(log: Log) {
    self.log = log
      _newMedicationName = State(initialValue: log.medicationName)
      _newLogDate = State(initialValue: log.logDate)
  }
  var body: some View {
    Text("Hello World")
    Form { // new
      TextField("Name", text: $newMedicationName) // new
      DatePicker("Log Date", selection: $newLogDate, displayedComponents: .date) // new
    }
    // end form
    .navigationTitle("Edit Log")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Cancel") {
          dismiss()
        }
      }
      ToolbarItem(placement: .confirmationAction) {
        Button("Save") { // new
            log.medicationName = newMedicationName
              log.logDate = newLogDate
          dismiss()
        }
        //end save button
      }//end action
    }//end toolbar
  }
  // end body
}
#Preview {
  NavigationStack { // new
      EditLog(log: Log(medicationName: "Test", logDate: Date.now))
  }
  //end nav stack
}

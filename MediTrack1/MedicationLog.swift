
import SwiftUI
import SwiftData
struct MedicationLog: View {
  @Query private var logs: [Log]
  @Environment(\.modelContext) private var context
  @State private var newMedicationName = ""
  @State private var newLogDate = Date.now
  @State private var selectedLog: Log?
  //end array
  var body: some View {
    NavigationStack {
      List {
        ForEach(logs) { log in
          HStack {
              Text(log.medicationName)
              Text(log.logDate, format: .dateTime.month(.wide).day().year())
            }
            //end hstack
          .onTapGesture {
            selectedLog = log
          }
        }
        .onDelete(perform: deleteLog)
      }
      //end list
      .navigationTitle("Medicine")
      .sheet(item: $selectedLog) { log in
        NavigationStack {
          EditLog(log: log)
               }
      }
      .safeAreaInset(edge: .bottom) {
        VStack(alignment: .center, spacing: 20) {
            Text("Log New Medication")
                .font(.custom("Verdana", size: 18))
          DatePicker(selection: $newLogDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                TextField("Name", text: $newMedicationName)
                  .textFieldStyle(.roundedBorder)
              }
            Button("Log") {
                let newLog = Log(medicationName: newMedicationName, logDate: newLogDate)
                context.insert(newLog)
                newMedicationName = ""
                newLogDate = .now
            }
          //end button
          .bold()
        }
        //end VStack
        .padding()
        .background(.bar)
      }
      //end safenet
    }
    //end nav stack
  }
  //end body view
    func deleteLog(at offsets: IndexSet) {
        for index in offsets {
            let log = logs[index]
            context.delete(log)
        }
    }
}
//end content
#Preview {
  MedicationLog()
    .modelContainer(for:Log.self, inMemory: true)
}

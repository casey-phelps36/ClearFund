import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double savingsProgressBar(
  double savingsCurrent,
  double savingsGoal,
) {
// I need the savings progress bar to fill based on the savings_current and savings_goal. If they meet the goal just fill the progress bar completely
  if (savingsGoal <= 0) return 1.0; // Fill completely if goal is 0 or less
  return (savingsCurrent >= savingsGoal) ? 1.0 : savingsCurrent / savingsGoal;
}

double? investmentProgressBar(
  double investmentCurrent,
  double investmentGoal,
) {
  // Create a FlutterFlow custom function.  Name: investmentProgress   Return type: double    Parameters: - currentInvestment (double) - investmentGoal (double)  Logic: - If investmentGoal is less than or equal to 0, return 0.01 - Calculate progress as currentInvestment divided by investmentGoal - Clamp the result so it is never less than 0.01 and never greater than 1.0 - Return the clamped progress value  Important: - Only output the function body (no imports, no class, no extra code)
  if (investmentGoal <= 0) return 0.01;
  double progress = investmentCurrent / investmentGoal;
  if (progress < 0.01) return 0.01;
  if (progress > 1.0) return 1.0;
  return progress;
}

double overallProgressBar(
  double investmentGoal,
  double investmentCurrent,
  double savingsCurrent,
  double savingsGoal,
) {
  // Create a FlutterFlow custom function named overallFinanceProgress returning double. Inputs: currentSavings, currentInvestment, savingGoal, investmentGoal (all double). Compute totalCurrent = currentSavings + currentInvestment and totalGoal = savingGoal + investmentGoal. If totalGoal <= 0 return 0.01. progress = totalCurrent / totalGoal. Clamp between 0.01 and 1.0. Return progress. Only output function body.
  if (savingsGoal + investmentGoal <= 0) return 0.01;
  double totalCurrent = savingsCurrent + investmentCurrent;
  double totalGoal = savingsGoal + investmentGoal;
  double progress = totalCurrent / totalGoal;
  return progress.clamp(0.01, 1.0);
}

dynamic jsonToDataReceipt(String? jsonString) {
  if (jsonString == null || jsonString.isEmpty) {
    return null;
  }

  try {
    // 1. Clean the string of any Markdown backticks
    final cleanString =
        jsonString.replaceAll('```json', '').replaceAll('```', '').trim();

    // 2. Parse the string into a Map
    Map<String, dynamic> data = jsonDecode(cleanString);

    // 3. Normalize 'amount' (looks for amount, total_amount, or total)
    var amountValue =
        data['amount'] ?? data['total_amount'] ?? data['total'] ?? 0.0;
    data['amount'] = double.tryParse(amountValue.toString()) ?? 0.0;

    // 4. Normalize 'vendor' (looks for vendor or store)
    data['vendor'] = (data['vendor'] ?? data['store'] ?? 'Unknown').toString();

    // 5. Normalize 'category'
    data['category'] = (data['category'] ?? 'General').toString();

    return data;
  } catch (e) {
    // If it fails, we return a map with "Unknown" so the DB doesn't get a literal null
    return {'vendor': 'Error Parsing', 'amount': 0.0, 'category': 'Error'};
  }
}
